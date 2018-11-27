package com.example.itech.employeetracker;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import static android.widget.Toast.LENGTH_LONG;

public class MainHome extends AppCompatActivity implements View.OnClickListener,LocationListener  {
    Button start,upload;
    String loc;
    // Button hom, vw, qr, not;
    String sh_name = "MyData";
    String id = "";


    LocationManager locationManager;
    String lattitude;
    String longitude;

    public static int cameraID = 1;
    public static boolean isBlack = true;
    public static ImageView image;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_home);
        //start=findViewById(R.id.startButton);
        upload=findViewById(R.id.uploadButton);
//        start.setOnClickListener(this);
        upload.setOnClickListener(this);
        SharedPreferences sh = getSharedPreferences(sh_name, MODE_PRIVATE);
        id = sh.getString("id", " ");
        getLocation();

        image = (ImageView) findViewById(R.id.imgView);

        //----------------

      //  isBlack = false;

        cameraID = 1;
        Intent i = new Intent(MainHome.this,StartActivity.class);
        startActivityForResult(i, 999);

        //--------------
    }



    @Override
    public void onClick(View view) {

      if (view==upload)
        {

            Intent intent=new Intent(MainHome.this,ImageUpload.class);
            startActivity(intent);

        }

    }
    //----------------------------------------------------------------------------------------------------------------
    //GPS Tracking

    public void getLocation() {

        try {
            Log.d("alliswell", "Inside getLocation");
            locationManager = (LocationManager) getApplicationContext().getSystemService(Context.LOCATION_SERVICE);
            locationManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, 5000, 5, (LocationListener) this);
        } catch (SecurityException e) {
            e.printStackTrace();
        }
    }

    public void onLocationChanged(Location location) {
        // locationText.setText("Latitude: " + location.getLatitude() + "\n Longitude: " + location.getLongitude());
        Toast.makeText(this, "Latitude: " + location.getLatitude() + "\n Longitude: " + location.getLongitude(), Toast.LENGTH_SHORT).show();
        lattitude = location.getLatitude() + "";
        longitude = location.getLongitude() + "";
        try {
            Geocoder geocoder = new Geocoder(getBaseContext(), Locale.getDefault());
            List<Address> addresses = geocoder.getFromLocation(location.getLatitude(), location.getLongitude(), 1);
            //  locationText.setText(locationText.getText() + "\n"+addresses.get(0).getAddressLine(0)+", "+
            addresses.get(0).getAddressLine(1);
            //  Toast.makeText(this, addresses.get(0).getAddressLine(0) + ", " +
            // addresses.get(0).getAddressLine(1), Toast.LENGTH_SHORT).show();
            //  loc=locationText.getText().toString();
            loc = "Latitude: " + location.getLatitude() + "\n Longitude: " + location.getLongitude() + "\n" + addresses.get(0).getAddressLine(0) + ", " +
                    addresses.get(0).getAddressLine(1);

            //    Toast.makeText(this, "Location" + loc, Toast.LENGTH_SHORT).show();
            Log.d("alliswell", "hello");
            String myloc = addresses.get(0).getAddressLine(0) + "";
            insertLocation il = new insertLocation();
            il.execute(id, lattitude, longitude, myloc);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void onStatusChanged(String s, int i, Bundle bundle) {

    }

    public void onProviderEnabled(String s) {
        Toast.makeText(this, "Please Enable GPS and Internet", Toast.LENGTH_SHORT).show();
    }

    public void onProviderDisabled(String s) {

    }




    class insertLocation extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Tracking");
            wb.addProperty("empid", strings[0]);
            wb.addProperty("lattitude", strings[1]);
            wb.addProperty("longitude", strings[2]);
            wb.addProperty("pl", strings[3]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            //Toast.makeText(insertLocation.this, s, LENGTH_LONG).show();
            Toast.makeText(MainHome.this, "insert" + s, Toast.LENGTH_SHORT).show();
        }
    }
}
