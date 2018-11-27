package com.example.itech.employeetracker;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnClickListener, RadioGroup.OnCheckedChangeListener {
    Button B1,upload;
    EditText name,addr,age,phone,email,username,password,cpsw;
    RadioButton R1,R2;
    RadioGroup G;
    String gender;
    String Name,Address,Age,Ph,Email,User,Pass,Cpsw;
    SharedPreferences sh;
    String sh_name="My Data";





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        name=findViewById(R.id.nameEditText);
        addr=findViewById(R.id.adresEditText);
        age=findViewById(R.id.ageEditText);
        phone=findViewById(R.id.phoneEditText);
        email=findViewById(R.id.emailEditText);
        username=findViewById(R.id.userEditText);
        password=findViewById(R.id.passwordEditText);
        cpsw=findViewById(R.id.cnfpassEditText);
        R1=findViewById(R.id.maleRadioButton);
        R2=findViewById(R.id.femaleRadioButton);
        G=findViewById(R.id.gender);
        B1=findViewById(R.id.regButton);
        B1.setOnClickListener(this);
        G.setOnCheckedChangeListener(this);



    }

    @Override
    public void onClick(View view) {
         Name=name.getText().toString();
         Address=addr.getText().toString();
         Age=age.getText().toString();
         Ph=phone.getText().toString();
         Email=email.getText().toString();
         User=username.getText().toString();
         Pass=password.getText().toString();
         Cpsw=cpsw.getText().toString();
         insertdata id=new insertdata();
         id.execute(Name,Address,Age,gender,Ph,Email,User,Pass);

        if(view==B1)
        {
            Intent intent=new Intent(this,LoginActivity.class);
            sh=getSharedPreferences(sh_name,MODE_PRIVATE);
            SharedPreferences.Editor editor=sh.edit();
            editor.putString("user_id",User);
            editor.putString("password",Pass);
            editor.commit();
          //  intent.putExtra("name",User);
            startActivity(intent);

        }


    }

    @Override
    public void onCheckedChanged(RadioGroup radioGroup, int i) {

        if (i==R.id.maleRadioButton)
        {
           gender=R1.getText().toString();
        }
        else
        {
            gender=R2.getText().toString();
        }

    }

    private class insertdata extends AsyncTask<String,String,String>{

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller();
            wb.setSoapObject("insert");
            wb.addProperty("Name", strings[0]);
            wb.addProperty("Address",strings[1]);
            wb.addProperty("Age",strings[2]);
            wb.addProperty("Gender",strings[3]);
            wb.addProperty("Phone",strings[4]);
            wb.addProperty("Email",strings[5]);
            wb.addProperty("User",strings[6]);
            wb.addProperty("Password",strings[7]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(MainActivity.this,s,Toast.LENGTH_SHORT).show();
        }
    }
}
