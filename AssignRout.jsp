<%-- 
    Document   : AssignRout
    Created on : Sep 19, 2018, 2:39:20 AM
    Author     : i tech
--%>
<%@include file="Header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <% String id="";
      String empid="";
      String routeid="";
      if(request.getParameter("submit")!=null)
    {
        String emp=request.getParameter("empname");
        String route=request.getParameter("route");
        String idd=request.getParameter("hid");
        if(!idd.equals(""))
        { 
            String upd= "update tbl_routeassign set emp_id='"+emp+"',route_id='"+route+"' where emp_id='"+idd+"'";
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
        }  
        
        
     
        else
        {
        String insert="insert into tbl_routeassign(emp_id,route_id)values('"+emp+"','"+route+"')";
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
     
     
      %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Route</title>
    </head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

body {
  margin: 0;
}

/* Style the header */
.header {
    background-color: #f1f1f1;
    padding: 20px;
    text-align: center;
}

/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    background-color: #333;
}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}
</style>
    </head>
<style>
input[type=text] {
    width: 30%;
    padding: 12px 20px;
    margin: 8px 0;
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
    margin: 8px 50;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

#main {
    width: 40%;
    margin-left: 350px;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
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
    <body>
     <div>
          <label for="Employee">Employee Id</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Select name="empname">
        <option selected="selected"value="">Select</option>
        <input type="hidden" name="hid" value="<%=id%>">
        <% String s="select * from tbl_emp";
        ResultSet rl=obj.select(s);
        while(rl.next())
        {
            
        
         %>
         <option <% if(empid.equals(rl.getString("emp_id"))){%>selected=""<%}%>value="<%=rl.getString("emp_id")%>"><%=rl.getString("emp_id")%></option>
         <%
        }
        %>
          </select>
      </div>  
          <div>
          <label for="route">Route</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Select name="rout">
        <option selected="selected"value="">Select</option>
        
        <% String se="select * from tbl_route";
        ResultSet r2=obj.select(se);
        while(r2.next())
        {
            
        
         %>
         <option <% if(routeid.equals(r2.getString("route_id"))){%>selected=""<%}%>value="<%=r2.getString("route_id")%>"><%=r2.getString("route_id")%></option>
         <%
        }
        %>
          </select>
      </div>  
           <input type="submit" name="submit" value="Submit">
    </body>
</html>
<%@include file="footer.jsp" %>