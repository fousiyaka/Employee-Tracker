package com.example.itech.employeetracker;

import android.app.Notification;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class NotificationActiity extends AppCompatActivity {
    String id;
    SharedPreferences sp;
    RecyclerView rc;
    Notificationadapter ada;
    List< Notificationbean> lst;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);
        sp = getSharedPreferences("MyData", MODE_PRIVATE);
        id = sp.getString("id", "");
        Notification noti = new Notification();
        noti.execute(id);
        rc=(RecyclerView)findViewById(R.id.recycle2);
        lst=new ArrayList<>();

    }
    private class Notification extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("notification");
            wb.callWebService();
            return wb.getResponse();

        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(NotificationActiity.this, "hello " + s, Toast.LENGTH_SHORT).show();

            Log.d("alliswell", s);
            try {

                JSONArray ja = new JSONArray(s);
                for (int i = 0; i < ja.length(); i++) {
                    JSONObject jo = ja.getJSONObject(i);

                    String date = jo.getString("Date");
                    String time = jo.getString("Time");
                    String msg = jo.getString("Msg");
                   // Toast.makeText(NotificationActiity.this, "date " + date + "time" + time + "msg" + msg, Toast.LENGTH_SHORT).show();
                    Notificationbean bb = new Notificationbean();
                    bb.setNotidate(date);
                    bb.setNotitime(time);
                    bb.setNotimsg(msg);

                    lst.add(bb);
                    ada = new Notificationadapter(lst, NotificationActiity.this);
                    rc.setLayoutManager(new LinearLayoutManager(NotificationActiity.this));
                    rc.setAdapter(ada);

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        }
    }






