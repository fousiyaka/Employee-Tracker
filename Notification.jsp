<%-- 
    Document   : Notification
    Created on : Nov 15, 2018, 1:47:22 PM
    Author     : i tech
--%>
<%@include file="Header.jsp" %>
<br>
<br>
<br>
<br>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
  <% String notiid="";
       
       
        String id="";
        String notifi="";
        String empl="";
        if(request.getParameter("submit")!=null)
    {
        String noti=request.getParameter("noti");
        String emp=request.getParameter("emp");
        String idd=request.getParameter("hid");
        if(!idd.equals(""))
        { 
            String upd= "update tbl_notification set noti_date=curdate(),noti_time=curtime(),noti_msg='"+noti+"',emp_id='"+emp+"' where noti_id='"+idd+"'";
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
        }  
        
        
     
        else
        {
           String insert="insert into tbl_notification(noti_date,noti_time,noti_msg,emp_id)values(curdate(),curtime(),'"+noti+"','"+emp+"')"; 
           boolean b=obj.insert(insert);
        if(b)
        {
            System.out.println("Successfully Inserted");
            
        }
        else
        {
            System.out.println("failed to insert");
        }
        }
        
    }
     
      if(request.getParameter("delid")!=null)
        {
            String a=request.getParameter("delid");
            String del="delete from tbl_notification where task_id='"+a+"'";
            
            if(obj.insert(del))
            {%>
            <script>
                alert("Deleted");
                </script>
               <%
            }
            
            else
            {
                System.out.print("Failed to delete");
            }
            
      }
      
       %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task Page</title>
        <style>
            #customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<style>
 input[type=text],input[type=password],select {
    width: 50%;
    padding: 12px 25px;
    margin: 8px 15px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}


input[type=submit] {
    width: 50%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 50px;
    
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

#main {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    margin-left:  350px;
    width: 40%;
}
</style>
    </head>
    <body>
         
        <form>   
            
           <div id="main">
               <label for="emp">Employee ID</label>
               <Select name="emp">
        <option selected="selected"value="">Select</option>
        <% String s="select * from tbl_emp";
        ResultSet rl=obj.select(s);
        while(rl.next())
        {
            
        
         %>
         <option <% if(notiid.equals(rl.getString("emp_id"))){%>selected=""<%}%>value="<%=rl.getString("emp_id")%>"><%=rl.getString("emp_id")%></option>
         <%
        }
        %>
          </select>
           
           <br>
           <br>
           <input type="hidden" name="hid" value="<%=id%>">
           <label for="notification">Notification</label>
         <textarea rows="5" cols="50" name="noti" value="<%=notifi%>">
         </textarea>
         <br>
         <br>
          <input type="submit" name="submit" value="Submit">
               
           </div>
            </form>
    </body>
</html>
<br>
<br>
<br>
<%@include file="footer.jsp"%>