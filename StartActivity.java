package com.example.itech.employeetracker;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.io.ByteArrayOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import android.support.v7.app.ActionBarActivity;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.AsyncHttpResponseHandler;
import com.loopj.android.http.RequestParams;



import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import cz.msebera.android.httpclient.Header;
import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.PixelFormat;
import android.hardware.Camera;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;

public class StartActivity extends AppCompatActivity implements OnClickListener, SurfaceHolder.Callback {
    private static final String TAG = "CameraTest";
    Camera mCamera;
    boolean mPreviewRunning = false;
    String city_name="", city_lattitude="" , city_longitude="";
    @SuppressWarnings("deprecation")
    public void onCreate(Bundle icicle){
        super.onCreate(icicle);
        Log.e(TAG, "onCreate");

        getWindow().setFormat(PixelFormat.TRANSLUCENT);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_start);
        ImageView img = (ImageView) findViewById(R.id.blankImage);

        if(MainHome.isBlack)
            img.setBackgroundResource(android.R.color.black);
        else
            img.setBackgroundResource(android.R.color.white);

        mSurfaceView = (SurfaceView) findViewById(R.id.surface_camera);
        mSurfaceView.setOnClickListener(this);
        mSurfaceHolder = mSurfaceView.getHolder();
        mSurfaceHolder.addCallback(this);
        mSurfaceHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);

    }

    @Override
    protected void onRestoreInstanceState(Bundle savedInstanceState){
        super.onRestoreInstanceState(savedInstanceState);
    }


    Camera.PictureCallback mPictureCallback = new Camera.PictureCallback() {

        public void onPictureTaken(byte[] data, Camera camera) {
            // TODO Auto-generated method stub
            if (data != null){
                //Intent mIntent = new Intent();
                //mIntent.putExtra("image",imageData);

                mCamera.stopPreview();
                mPreviewRunning = false;
                mCamera.release();

                try{
                    BitmapFactory.Options opts = new BitmapFactory.Options();
                    Bitmap bitmap= BitmapFactory.decodeByteArray(data, 0, data.length,opts);
                    bitmap = Bitmap.createScaledBitmap(bitmap, 300, 300, false);
                    int width = bitmap.getWidth();
                    int height = bitmap.getHeight();
                    int newWidth = 300;
                    int newHeight = 300;

                    // calculate the scale - in this case = 0.4f
                    float scaleWidth = ((float) newWidth) / width;
                    float scaleHeight = ((float) newHeight) / height;

                    // createa matrix for the manipulation
                    Matrix matrix = new Matrix();
                    // resize the bit map
                    matrix.postScale(scaleWidth, scaleHeight);
                    // rotate the Bitmap
                    matrix.postRotate(-90);
                    Bitmap resizedBitmap = Bitmap.createBitmap(bitmap, 0, 0,
                            width, height, matrix, true);
                    MainHome.image.setImageBitmap(resizedBitmap);//Captured Image




                    /*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String dateTime = sdf.format(Calendar.getInstance().getTime()); // reading local time in the system
                    Canvas cs = new Canvas(resizedBitmap);
                    Paint tPaint = new Paint();
                    tPaint.setTextSize(35);
                    tPaint.setColor(Color.BLUE);
                    tPaint.setStyle(Paint.Style.FILL);
                    cs.drawBitmap(src, 0f, 0f, null);
                    float height = tPaint.measureText("yY");
                    cs.drawText(dateTime, 12f, height+15f, tPaint);
                    cs.drawText(city_name,12f,height+50f,tPaint);
                    cs.drawText(city_lattitude,12f,height+85f,tPaint);
                    cs.drawText(city_longitude,12f,height+115f,tPaint);*/
//................Save image to sd card
                  /* Random rand = new Random();
                    int pickedNumber = rand.nextInt(10000);
                    try
                    {
                        resizedBitmap.compress(Bitmap.CompressFormat.JPEG, 100, new FileOutputStream(new File(Environment.getExternalStorageDirectory().getPath(),"employee/timeStampedImage"+pickedNumber+".jpg")));

                    }
                    catch (FileNotFoundException e)
                    {
                        Log.d("alliswellStorage",e+"");
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }*/
                   String root = Environment.getExternalStorageDirectory().toString();
                    File myDir = new File(root + "/employee");
                    if (!myDir.exists()) {
                        myDir.mkdirs();
                    }
                    Random generator = new Random();
                    int n = 10000;
                    n = generator.nextInt(n);
                    String fname = "Image_"+ n +".jpg";
                    File file = new File (myDir, fname);
                    if (file.exists ())
                        file.delete ();
                    try {
                        FileOutputStream out = new FileOutputStream(file);
                        bitmap.compress(Bitmap.CompressFormat.JPEG, 90, out);
                        out.flush();
                        out.close();

                    } catch (Exception e) {
                        Log.d("alliswellStorage",e+"");
                        e.printStackTrace();
                    }





                }catch(Exception e){
                    e.printStackTrace();
                }
                //StoreByteImage(mContext, imageData, 50,"ImageName");
                //setResult(FOTO_MODE, mIntent);
                setResult(585);
                finish();
            }
        }
    };

    protected void onResume(){
        Log.e(TAG, "onResume");
        super.onResume();
    }

    protected void onSaveInstanceState(Bundle outState){
        super.onSaveInstanceState(outState);
    }

    protected void onStop(){
        Log.e(TAG, "onStop");
        super.onStop();
    }

    @TargetApi(9)
    public void surfaceCreated(SurfaceHolder holder){
        Log.e(TAG, "surfaceCreated");
        mCamera = Camera.open(MainHome.cameraID);
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
        Log.e(TAG, "surfaceChanged");

        // XXX stopPreview() will crash if preview is not running
        if (mPreviewRunning){
            mCamera.stopPreview();
        }

        Camera.Parameters p = mCamera.getParameters();
        // p.setPreviewSize(300, 300);
        p.getSupportedPictureSizes();
        if(MainHome.cameraID == 0){
            String stringFlashMode = p.getFlashMode();
            if (stringFlashMode.equals("torch"))
                p.setFlashMode("on"); // Light is set off, flash is set to normal 'on' mode
            else
                p.setFlashMode("torch");
        }

        mCamera.setParameters(p);
        try{
            mCamera.setPreviewDisplay(holder);
        }catch (Exception e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        mCamera.startPreview();
        mPreviewRunning = true;
        mCamera.takePicture(null, mPictureCallback, mPictureCallback);
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
        Log.e(TAG, "surfaceDestroyed");
        //mCamera.stopPreview();
        //mPreviewRunning = false;
        //mCamera.release();
    }

    private SurfaceView mSurfaceView;
    private SurfaceHolder mSurfaceHolder;

    public void onClick(View v) {
        // TODO Auto-generated method stub
        mCamera.takePicture(null, mPictureCallback, mPictureCallback);
    }

    @Override
    public void onPointerCaptureChanged(boolean hasCapture) {

    }
}