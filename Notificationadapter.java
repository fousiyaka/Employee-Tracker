package com.example.itech.employeetracker;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

/**
 * Created by i tech on 11/17/2018.
 */

public class Notificationadapter extends RecyclerView.Adapter<Notificationadapter.MyViewHolder> {
    Context c;
    List<Notificationbean> listnoti;

    public Notificationadapter(List<Notificationbean> lst, NotificationActiity NotificationActivity) {

        this.listnoti = lst;
        c = NotificationActivity;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.single_notifi_layout, parent, false);
        return new MyViewHolder(itemView);


    }

    @Override
    public void onBindViewHolder(Notificationadapter.MyViewHolder holder, int position) {

        Notificationbean obj = listnoti.get(position);
        holder.d.setText(obj.getNotidate());
        holder.t.setText(obj.getNotitime());
        holder.m.setText(obj.getNotimsg());
    }

    @Override
    public int getItemCount() {
        return listnoti.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView d, t, m;

        public MyViewHolder(View itemView) {
            super(itemView);

            d = (TextView) itemView.findViewById(R.id.notidate);
            t = (TextView) itemView.findViewById(R.id.notitime);
            m = (TextView) itemView.findViewById(R.id.notimsg);

        }

    }
}
