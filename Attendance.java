package com.example.itech.employeetracker;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class Attendance extends AppCompatActivity {
TextView att;
SharedPreferences sp;
String id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_attendance);
        att = (TextView)findViewById(R.id.attendancetxt);
        sp = getSharedPreferences("MyData", MODE_PRIVATE);
        id = sp.getString("id", "");
        WebAttendance wa = new WebAttendance();
        wa.execute(id);   //
    }
    private class WebAttendance extends AsyncTask<String, String, String>
    {
        @Override
        protected String doInBackground(String... strings)
        {
            WebServiceCaller wc = new WebServiceCaller();
            wc.setSoapObject("Attendance"); // Attendance is the method name at Netbeans. Check Spell
            wc.addProperty("id",strings[0]);
            wc.callWebService();
            return wc.getResponse();
        }
        @Override
        protected void onPostExecute(String s)
        {

            super.onPostExecute(s);
            att.setText(s+"%");
        }
    }
}
