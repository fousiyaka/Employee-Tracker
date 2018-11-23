<%-- 
    Document   : Task
    Created on : Sep 19, 2018, 9:23:21 PM
    Author     : i tech
--%>
<%@include file="Header.jsp" %>
<br>
<b
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <%
        String id="";
        String tasktype="";
        String taskdes="";
        if(request.getParameter("submit")!=null)
    {
        String task=request.getParameter("tasktype");
        String taskdesc=request.getParameter("taskdes");
        String idd=request.getParameter("hid");
        if(!idd.equals(""))
        { 
            String upd= "update tbl_task set task_type='"+task+"',task_des='"+taskdesc+"'where task_id='"+idd+"'";
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
        }  
        
        
     
        else
        {
        String insert="insert into tbl_task(task_type,task_des)values('"+task+"','"+taskdesc+"')";
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
            String del="delete from tbl_task where task_id='"+a+"'";
            
            if(obj.insert(del))
            {%>
            <script>
                alert("Deleted");
                </script>
               <%
            }
            
            else
            {
                System.out.println("Failed to delete");
            }
            
        }
              if(request.getParameter("edtid")!=null)
              {
                  id=request.getParameter("edtid");
                  String sel="select * from tbl_task where task_id="+id;
                  
                  ResultSet r = obj.select(sel);
                  if(r.next())
                  {
                 
                      tasktype=r.getString("task_type");
                      taskdes=r.getString("task_des");
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
    <label for="tasktype">Task Type</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" id="tasktype" name="tasktype" placeholder="" value="<%=tasktype%>">
    <input type="hidden" name="hid" value="<%=id%>">
    <br>
    <label for="taskdescription">Task Description</label>&nbsp&nbsp&nbsp&nbsp
    <textarea id="taskdes" name="taskdes" value="<%=taskdes%>"></textarea>
            
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="submit" name="submit" value="Submit">
        </div>   
     <table id="customers" >
         <tr>
       <th>No</th>
       <th>Task Type</th>
       <th>Task Description</th>
       <th>Edit</th>
       <th>Delete</th>
        </tr>
        

          <% String p="select * from tbl_task ";
                ResultSet r3=obj.select(p);
                int i=1;
                while(r3.next())
                {
                    
                String nam=r3.getString("task_type");
                String na=r3.getString("task_des");
                %>
                <tr> 
                    <td><%=i%></td>
                    <td><%=nam%></td>
                    <td><%=na%></td>
                    <td><a href ="Task.jsp?delid=<%=r3.getString("task_id")%>">DELETE</a></td>
                    <td><a href ="Task.jsp?edtid=<%=r3.getString("task_id")%>">EDIT</a></td>
                </tr>
                <% i++;
                
                }
                
        %>
    
     
   </table>
        </form>
    </body>
</html>
<%@include file="footer.jsp" %>