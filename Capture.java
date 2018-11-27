package com.example.itech.employeetracker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class Capture extends AppCompatActivity implements View.OnClickListener {


//    public static int cameraID = 1;
//    public static boolean isBlack = true;

Button noti,task,applyleave,rating,atte,sal;

    String sh_name = "MyData";
    String id = "";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_capture);
        SharedPreferences sh = getSharedPreferences(sh_name, MODE_PRIVATE);
        id = sh.getString("id", " ");
        noti=findViewById(R.id.notiButton);
        task=findViewById(R.id.taskButton);
        applyleave=findViewById(R.id.ApplyleaveButton);
        rating=findViewById(R.id.rateButton);
        atte=findViewById(R.id.AttButton);
        sal=findViewById(R.id.salButton);
        atte.setOnClickListener(this);
        sal.setOnClickListener(this);
        rating.setOnClickListener(this);
        applyleave.setOnClickListener(this);
        noti.setOnClickListener(this);
        task.setOnClickListener(this);



    }

    @Override
    public void onClick(View view) {
        if(view==noti)
        {
            Intent intent=new Intent(Capture.this,NotificationActiity.class);
            startActivity(intent);
        }
        else if(view==task)
        {
            Intent intent=new Intent(Capture.this,ViewTask.class);
            startActivity(intent);
        }
        else if(view==applyleave)
      {
            Intent intent=new Intent(Capture.this,LeaveActivity.class);
           startActivity(intent);
   }
        else if(view==rating)
        {
            Intent intent=new Intent(Capture.this,Rate.class);
            startActivity(intent);
        }
        else if(view==atte)
        {
            Intent intent=new Intent(Capture.this,Attendance.class);
            startActivity(intent);
        }
        else if(view==sal)
        {
            Intent intent=new Intent(Capture.this,Salary.class);
            startActivity(intent);
        }

    }
}
