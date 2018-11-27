package com.example.itech.employeetracker;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

/**
 * Created by i tech on 11/18/2018.
 */

public class Viewtakadapter extends RecyclerView.Adapter<Viewtakadapter.MyViewHolder> {

    Context c;
    List<Viewtaskbeen>lsttask;





    public Viewtakadapter(List<Viewtaskbeen> lst, ViewTask viewTask) {

        this.lsttask = lst;
        c = viewTask;
    }

    @Override

    public Viewtakadapter.MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.single_viewtask_layout, parent, false);
        return new MyViewHolder(itemView);

    }

    @Override
    public void onBindViewHolder(Viewtakadapter.MyViewHolder holder, int position) {

        Viewtaskbeen vb=lsttask.get(position);
        holder.taskid.setText(vb.getTaskid());
        holder.taskdate.setText(vb.getTaskdate());
        holder.tasktime.setText(vb.getTasktime());
        holder.tasktype.setText(vb.getTasktype());
        holder.taskdesc.setText(vb.getTaskdesc());
        holder.subdate.setText(vb.getSubdate());





    }

    @Override
    public int getItemCount() {
        return lsttask.size();

    }




    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        TextView taskid,taskdate,tasktime,tasktype,taskdesc,subdate,submit;


        public MyViewHolder(View itemView) {
            super(itemView);


            taskid =(TextView) itemView.findViewById(R.id.taskidtxt);
            taskdate=itemView.findViewById(R.id.taskdatetxt);
            tasktime=itemView.findViewById(R.id.tasktimetxt);
            tasktype=itemView.findViewById(R.id.tasktypetxt);
            taskdesc=itemView.findViewById(R.id.taskdesctxt);
            subdate=itemView.findViewById(R.id.subdatetxt);
            submit=itemView.findViewById(R.id.tasksumitButton);
            submit.setOnClickListener(this);

        }

        @Override
        public void onClick(View view) {
            int a=getAdapterPosition();
            Viewtaskbeen ob=lsttask.get(a);
            String id=ob.getTaskid();
            Toast.makeText(c,"taskid"+id,Toast.LENGTH_LONG).show();
            Intent intent=new Intent(c,SubmitTaskActivity.class);
            intent.putExtra("taskid",id);
            c.startActivity(intent);
        }
    }
}
