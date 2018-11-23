<%-- 
    Document   : AjaxEmployee
    Created on : Nov 22, 2018, 5:13:38 PM
    Author     : i tech
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"> </jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<option value="">select</option>
<% 
    int salary=0;
        String ndate="",regid="",mintime="",maxtime="";

    String id=request.getParameter("id");
    String sel="select distinct(date) from tbl_tracklocation where date BETWEEN '"+request.getParameter("frm")+"'  and '"+request.getParameter("to")+"' and emp_id="+id;
    ResultSet rs=obj.select(sel);
        while(rs.next())
        {
            ndate=rs.getString("date");
            String selhour="select min(time) as mintime ,max(time) as maxtime from  tbl_tracklocation  where emp_id='"+id+"' and date='"+rs.getString("date")+"'";
             ResultSet rsh=obj.select(selhour);
                while(rsh.next())
                {

            mintime=rsh.getString("mintime");
            maxtime=rsh.getString("maxtime");

                }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String starttime = ndate +" "+mintime;
        String endtime = ndate +" "+maxtime;
        System.out.println("Akhilesh "+starttime);
        Date startdate = sdf.parse(starttime);
        Date enddate = sdf.parse(endtime);
        long differ = enddate.getTime()- startdate.getTime();
        double differinHour= differ/((double)1000*60*60);
        double diffInMinutes = (differinHour-(int)differinHour)*60;
        double shiftHou=0;
        String ShiftHour =""; 
        
        
        if(differinHour >= shiftHou/2 && differinHour < shiftHou )
        {
            salary = salary+300;
        }
        else if(differinHour >= shiftHou)
        {
            salary = salary+600;
        }

            System.out.println("Salary\n\n\n"+salary);        
        }
    %>