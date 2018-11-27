package com.example.itech.employeetracker;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SubmitTaskActivity extends AppCompatActivity implements View.OnClickListener {
EditText desc;
Button sub;
    static WebView mWebView;



    private ValueCallback<Uri> mUploadMessage;
    public ValueCallback<Uri[]> uploadMessage;
    public static final int REQUEST_SELECT_FILE = 100;
    private final static int FILECHOOSER_RESULTCODE = 1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_submit_task);
        desc=findViewById(R.id.descEdittext);
        sub=findViewById(R.id.suButton);
        sub.setOnClickListener(this);
        mWebView = (WebView) findViewById(R.id.webview_1);
        mWebView.setVisibility(View.INVISIBLE);

    }












    @Override
    public void onClick(View view) {


        mWebView.setVisibility(View.VISIBLE);
        String sh_id="MyData";
        SharedPreferences sh = getSharedPreferences(sh_id, Context.MODE_PRIVATE);
        String id = sh.getString("id","");
        String taskid=getIntent().getStringExtra("taskid");
        String des=desc.getText().toString();


        WebSettings mWebSettings = mWebView.getSettings();
        mWebSettings.setJavaScriptEnabled(true);
        mWebSettings.setSupportZoom(false);
        mWebSettings.setAllowFileAccess(true);
        mWebSettings.setAllowFileAccess(true);
        mWebSettings.setAllowContentAccess(true);
        Toast.makeText(SubmitTaskActivity.this,"task" + taskid ,Toast.LENGTH_LONG).show();
        mWebView.loadUrl("http://192.168.43.212:8085/EmployeeTracker/Admin/distribution33/upload_1.jsp?id='"+ id +"'&&des='"+des+"'&&taskid='"+taskid+"'");
        Log.d("swati","http://192.168.43.212:8085/EmployeeTracker/Admin/distribution33/upload_1.jsp?id='" + id + "'");
        mWebView.setWebChromeClient(new WebChromeClient() {
            // For 3.0+ Devices (Start)
            // onActivityResult attached before constructor
            protected void openFileChooser(ValueCallback uploadMsg, String acceptType) {
                mUploadMessage = uploadMsg;
                Intent i = new Intent(Intent.ACTION_GET_CONTENT);
                i.addCategory(Intent.CATEGORY_OPENABLE);
                i.setType("image/*");
                startActivityForResult(Intent.createChooser(i, "File Browser"), FILECHOOSER_RESULTCODE);
            }

            // For Lollipop 5.0+ Devices
            public boolean onShowFileChooser(WebView mWebView, ValueCallback<Uri[]> filePathCallback, FileChooserParams fileChooserParams) {
                if (uploadMessage != null) {
                    uploadMessage.onReceiveValue(null);
                    uploadMessage = null;
                }

                uploadMessage = filePathCallback;
                Intent intent = null;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    intent = fileChooserParams.createIntent();

                    try {
                        startActivityForResult(intent, REQUEST_SELECT_FILE);
                    } catch (ActivityNotFoundException e) {
                        uploadMessage = null;
                        Toast.makeText(getApplicationContext(), "Cannot Open File Chooser", Toast.LENGTH_LONG).show();
                        return false;
                    }
                    return true;
                }

                return false;

            }

            //For Android 4.1 only
            protected void openFileChooser(ValueCallback<Uri> uploadMsg, String acceptType, String capture)
            {
                mUploadMessage = uploadMsg;
                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("image/*");
                startActivityForResult(Intent.createChooser(intent, "File Browser"), FILECHOOSER_RESULTCODE);
            }

            protected void openFileChooser(ValueCallback<Uri> uploadMsg)
            {
                mUploadMessage = uploadMsg;
                Intent i = new Intent(Intent.ACTION_GET_CONTENT);
                i.addCategory(Intent.CATEGORY_OPENABLE);
                i.setType("image/*");
                startActivityForResult(Intent.createChooser(i, "File Chooser"), FILECHOOSER_RESULTCODE);
            }
        });
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent)
    {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
        {
            if (requestCode == REQUEST_SELECT_FILE)
            {
                if (uploadMessage == null)
                    return;
                uploadMessage.onReceiveValue(WebChromeClient.FileChooserParams.parseResult(resultCode, intent));
                uploadMessage = null;
            }
        }
        else if (requestCode == FILECHOOSER_RESULTCODE)
        {
            if (null == mUploadMessage)
                return;
            // Use MainActivityRESULT_OK if you're implementing WebView inside Fragment
            // Use RESULT_OK only if you're implementing WebView inside an Activity
            //  Uri result = intent == null || resultCode !=ViewEmployeeImages.jsp.RESULT_OK ? null : intent.getData();
            //   mUploadMessage.onReceiveValue(result);
            //  mUploadMessage = null;
        }
        else
            Toast.makeText(getApplicationContext(), "Failed to Upload File", Toast.LENGTH_LONG).show();



    }
}

