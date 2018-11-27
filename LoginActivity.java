package com.example.itech.employeetracker;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class LoginActivity extends AppCompatActivity implements View.OnClickListener {
EditText username,password;
Button login,newuser;
String Username,Password;
    SharedPreferences sh;
    String sh_name="MyData";
    String id="",name="",a;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        username=findViewById(R.id.unameEditText);
        password=findViewById(R.id.pswEditText);
        login=findViewById(R.id.loginButton);
        newuser=findViewById(R.id.newButton);
        login.setOnClickListener(this);
        newuser.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        if(view==login) {
            Username = username.getText().toString();
            Password = password.getText().toString();

            login id = new login();
            id.execute(Username, Password);
        }
        else
        {
            Intent in=new Intent(LoginActivity.this,RegisterActivity.class);
            startActivity(in);
        }

    }
    private class login extends AsyncTask<String,String,String> {

        @Override

        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("loginoperation");
            wb.addProperty("username", strings[0]);
            wb.addProperty("password", strings[1]);
            wb.callWebService();
            return wb.getResponse();


        }

        protected void onPostExecute(String s) {
            super.onPostExecute(s);
         //   Toast.makeText(LoginActivity.this, s  + "::::Login Successfully", Toast.LENGTH_SHORT).show();
            try {
                JSONArray jsonArray = null;
                jsonArray = new JSONArray(s);
                JSONObject jsonObject;
                for (int i = 0; i < jsonArray.length(); i++) {
                    jsonObject = jsonArray.getJSONObject(i);
                    String id = jsonObject.getString("eid");
                    String name = jsonObject.getString("ename");
                    sh = getSharedPreferences(sh_name, Context.MODE_PRIVATE);
                    SharedPreferences.Editor editor = sh.edit();
                    editor.putString("id", id);
                    editor.putString("username", name);
                    editor.commit();
                    Toast.makeText(LoginActivity.this, "id=" + id + name , Toast.LENGTH_SHORT).show();
                    Intent in = new Intent(LoginActivity.this, MainHome.class);
                    startActivity(in);
                }
            }
                    catch (JSONException e) {
                         e.printStackTrace();}


           /* if(s=="true")

            {

                Intent intent = new Intent(LoginActivity.this, HomeActivity.class);
                startActivity(intent);
            }*/
                }
            }
}

