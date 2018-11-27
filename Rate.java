package com.example.itech.employeetracker;

import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.RatingBar;
import android.widget.Toast;

public class Rate extends AppCompatActivity {
    RatingBar r;
SharedPreferences sp;
String id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rate);
        sp = getSharedPreferences("MyData", MODE_PRIVATE);
        id = sp.getString("id", "");
        r = findViewById(R.id.rating);
        Rating r1=new Rating();
        r1.execute(id);

    }

    private class Rating extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Rate");
            wb.addProperty("empid",strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(Rate.this, "hello " + s, Toast.LENGTH_SHORT).show();
    float k= Float.parseFloat(s);
    r.setRating(k);

        }

    }
}


