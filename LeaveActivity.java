package com.example.itech.employeetracker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class LeaveActivity extends AppCompatActivity implements View.OnClickListener {
    EditText reason, leavedate, nodays;
    Button submit;



    String id;
    SharedPreferences sp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_leave);
        reason = findViewById(R.id.reasonEdittext);
        leavedate = findViewById(R.id.leavedateEdittxt);
        nodays = findViewById(R.id.daysEdittext);
        submit = findViewById(R.id.leavesubmitButton);
        submit.setOnClickListener(this);
        sp = getSharedPreferences("MyData", MODE_PRIVATE);
        id = sp.getString("id", "");
    }

    @Override
    public void onClick(View view) {
        String r=reason.getText().toString();
        String d=leavedate.getText().toString();
        String days=nodays.getText().toString();
        Leave leave=new Leave();
        leave.execute(r,d,days,id);


    }

    private class Leave extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Leave");
            wb.addProperty("leavereason", strings[0]);
            wb.addProperty("leavesdate", strings[1]);
            wb.addProperty("nodays", strings[2]);
            wb.addProperty("empid",strings[3]);
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(LeaveActivity.this, s+"Applied Successfully", Toast.LENGTH_SHORT).show();
            Intent intent=new Intent(LeaveActivity.this,Capture.class);
            startActivity(intent);

        }
    }
}
