package com.example.itech.employeetracker;

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

public class ViewTask extends AppCompatActivity {
    String id;
    SharedPreferences sp;
    RecyclerView rc;
    Viewtakadapter ada;
    List<Viewtaskbeen> lst;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_task2);
        lst = new ArrayList<>();
        rc = (RecyclerView) findViewById(R.id.recycle3);

        sp = getSharedPreferences("MyData", MODE_PRIVATE);
        id = sp.getString("id", "");
        Task task = new Task();
        task.execute(id);

    }

    private class Task extends AsyncTask<String, String, String> {


        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("viewtask");
            wb.callWebService();
            return wb.getResponse();

        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(ViewTask.this, "hello " + s, Toast.LENGTH_SHORT).show();

            Log.d("alliswell", s);
            try {

                JSONArray ja = new JSONArray(s);
                for (int i = 0; i < ja.length(); i++) {
                    JSONObject jo = ja.getJSONObject(i);
                    String taskid=jo.getString("Task");
                    String date = jo.getString("Date");
                    String time = jo.getString("Time");
                    String type = jo.getString("Type");
                    String desc = jo.getString("Desc");
                    String subdate = jo.getString("Subdate");
                  //s  Toast.makeText(ViewTask.this, "date " + date + "time" + time + "msg" + type + "desc" + desc + "subdate" + subdate, Toast.LENGTH_SHORT).show();
                    Viewtaskbeen bb = new Viewtaskbeen();
                    bb.setTaskid(taskid);
                    bb.setTaskdate(date);
                    bb.setTasktime(time);
                    bb.setTasktype(type);
                    bb.setTaskdesc(desc);
                    bb.setSubdate(subdate);

                    lst.add(bb);


                }
                ada = new Viewtakadapter(lst, ViewTask.this);
                rc.setLayoutManager(new LinearLayoutManager(ViewTask.this));
                rc.setAdapter(ada);
            }  catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
