package com.example.itech.employeetracker;

import android.os.AsyncTask;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class RegisterActivity extends AppCompatActivity implements View.OnClickListener, RadioGroup.OnCheckedChangeListener {
    EditText fname, lname, housename, email, username, password, contact, age, date;
    Button register;
    //DatePicker d1;
    String gender;
    String Fname;
    String Lname;
    String House;
    // String dob;
    String Age;
    String Email;
    String Contact;
    String Username;
    String Password;
    String Place, State;

    Spinner district, state, place;
    RadioButton R1, R2;
    RadioGroup G;
    String placeid[] = null;

    String disid[] = null,stateid[]=null;
    String placename[] = null, statename[] = null, disname[] = null;
    ArrayAdapter<String> adapterplace;
    ArrayAdapter<String> adapterstate;
    ArrayAdapter<String> adapterdistrict;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        fname = findViewById(R.id.fnameEditText);
        lname = findViewById(R.id.lnameEditText);
        housename = findViewById(R.id.homeEditText);
        contact = findViewById(R.id.contactEditText);
        email = findViewById(R.id.emailEditText);
        username = findViewById(R.id.usernameEditText);
        password = findViewById(R.id.passwordEditText);
        age = findViewById(R.id.ageEditText);
        place = findViewById(R.id.placeSpinner);
        state = findViewById(R.id.stateSpinner);
        //date=findViewById(R.id.dateEditText);
        district = findViewById(R.id.districtSpinner);
        //state=findViewById(R.id.stateSpinner);
        // d1 = findViewById(R.id.d1Picker);
        register = findViewById(R.id.regButton);
        register.setOnClickListener(this);
        R1 = findViewById(R.id.maleRadioButton);
        R2 = findViewById(R.id.femaleRadioButton);
        G = findViewById(R.id.gender);
        G.setOnCheckedChangeListener(this);
        State= String.valueOf(state.getSelectedItemId());
        Toast.makeText(RegisterActivity.this,State,Toast.LENGTH_LONG).show();
        getplace gt = new getplace();
        gt.execute();
        getstate gs = new getstate();
        gs.execute();
        getdistrict gd=new getdistrict();
        gd.execute();



    }

    @Override
    public void onClick(View view) {
        Fname = fname.getText().toString();
        Lname = lname.getText().toString();
        House = housename.getText().toString();
        Contact = contact.getText().toString();
        Email = email.getText().toString();
        Username = username.getText().toString();
        Password = password.getText().toString();
        //dob=date.getText().toString();
        Age = age.getText().toString();
        Place = place.getSelectedItem().toString();
        Toast.makeText(RegisterActivity.this, Age, Toast.LENGTH_LONG).show();
        insertdata id = new insertdata();
        id.execute(Fname, Lname, House, Place, Age, gender, Email, Contact, Username, Password);


    }

    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int i) {
        if (i == R.id.maleRadioButton) {
            gender = R1.getText().toString();
        } else {
            gender = R2.getText().toString();
        }

    }




    private class insertdata extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("insert");
            wb.addProperty("fname", strings[0]);
            wb.addProperty("lname", strings[1]);
            wb.addProperty("hname", strings[2]);
            wb.addProperty("place", strings[3]);
            //wb.addProperty("dob",strings[4]);
            wb.addProperty("age", strings[4]);
            wb.addProperty("gender", strings[5]);
            wb.addProperty("email", strings[6]);
            wb.addProperty("contact", strings[7]);
            wb.addProperty("username", strings[8]);
            wb.addProperty("password", strings[9]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(RegisterActivity.this, s+"Registerd Successfully", Toast.LENGTH_SHORT).show();
        }
    }


    private class getplace extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("getplaceoperation");
            wb.callWebService();
            return wb.getResponse();
        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            // Toast.makeText(RegisterActivity.this,s, Toast.LENGTH_LONG).show();
            try {

                JSONArray jsonArray = new JSONArray(s);
                placeid = new String[jsonArray.length()];
                placename = new String[jsonArray.length()];
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    placeid[i] = jsonObject.getString("pid");
                    placename[i] = jsonObject.getString("pname");


                }
                adapterplace = new ArrayAdapter<String>(RegisterActivity.this, android.R.layout.simple_spinner_item, placename);
                adapterplace.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                place.setAdapter(adapterplace);
            } catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }

    private class getstate extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("getstateoperation");
            wb.callWebService();
            return wb.getResponse();
        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            // Toast.makeText(RegisterActivity.this,s, Toast.LENGTH_LONG).show();
            try {

                JSONArray jsonArray = new JSONArray(s);
                stateid = new String[jsonArray.length()];
                statename = new String[jsonArray.length()];
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    stateid[i] = jsonObject.getString("sid");
                    statename[i] = jsonObject.getString("sname");


                }
                adapterstate = new ArrayAdapter<String>(RegisterActivity.this, android.R.layout.simple_spinner_item, statename);
                adapterstate.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                state.setAdapter(adapterstate);
            }catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }


    private class getdistrict extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
           WebServiceCaller wb = new WebServiceCaller();
           wb.setSoapObject("getdistrictoperation");
            //wb.addProperty("state", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            // Toast.makeText(RegisterActivity.this,s, Toast.LENGTH_LONG).show();
            try {

                JSONArray jsonArray = new JSONArray(s);
                disid = new String[jsonArray.length()];
                disname = new String[jsonArray.length()];
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    disid[i] = jsonObject.getString("did");
                    disname[i] = jsonObject.getString("dname");


                }
                adapterdistrict = new ArrayAdapter<String>(RegisterActivity.this, android.R.layout.simple_spinner_item,disname);
                adapterdistrict.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                district.setAdapter(adapterdistrict);
            } catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }
}
