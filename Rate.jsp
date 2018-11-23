<%-- 
    Document   : Rate
    Created on : Nov 22, 2018, 12:31:58 PM
    Author     : i tech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<br>
<br>
<br>
<br><br>

<%@page import="java.sql.*"%>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <%
    
     
     if(request.getParameter("submit")!=null)
    {
        
        
         if(request.getParameter("acceptid")!=null)
    {
        String empid=request.getParameter("acceptid");
    
        String rating=request.getParameter("rate");
        String insert="insert into tbl_rate(rate_value,emp_id)values('"+rating+"','"+empid+"')";
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <form>
     <div id="main">
    <label for="rate">Rating</label>&nbsp&nbsp&nbsp&nbsp
    <input type="text" id="rate" name="rate" placeholder="in between 1 to 5" value="">
     </div>
            <div id="main">
    <input type="submit" name="submit" value="Submit">
            </div>
        </form>
       
    </body>
</html>
