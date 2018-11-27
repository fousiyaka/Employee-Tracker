package com.example.itech.employeetracker;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;

public class Salary extends AppCompatActivity {
TextView payroll;
String id;
SharedPreferences sp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_salary);
        payroll = (TextView)findViewById(R.id.saltxt);

        sp = getSharedPreferences("MyData", MODE_PRIVATE);
        id = sp.getString("id","");
        webPay wp = new webPay();
        wp.execute(id);
    }
    private class webPay extends AsyncTask<String, String , String>
    {
        @Override
        protected String doInBackground(String... strings)
        {
            WebServiceCaller wc = new WebServiceCaller();
            wc.setSoapObject("Payroll");
            wc.addProperty("id",strings[0]);
            wc.callWebService();
            return wc.getResponse();
        }
        @Override
        protected void onPostExecute(String s)
        {
            super.onPostExecute(s);
            Toast.makeText(Salary.this,"salary"+s,Toast.LENGTH_LONG).show();
            payroll.setText(s);

        }
    }
}
