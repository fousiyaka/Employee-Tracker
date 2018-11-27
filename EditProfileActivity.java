package com.example.itech.employeetracker;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class EditProfileActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);
        EditText fname, lname, housename, email, username, password,contact,age,gender;
        Button edit;
        fname = findViewById(R.id.fnameEditText);
        lname = findViewById(R.id.lnameEditText);
        housename = findViewById(R.id.homeEditText);
        contact=findViewById(R.id.contactEditText);
        email = findViewById(R.id.emailEditText);
        username = findViewById(R.id.usernameEditText);
        password = findViewById(R.id.passwordEditText);
        age=findViewById(R.id.ageEditText);
        gender=findViewById(R.id.genderEditText);
        edit=findViewById(R.id.editButton);
        edit.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {

    }
}
