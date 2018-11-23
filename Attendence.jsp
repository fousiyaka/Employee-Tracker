 <%-- 
    Document   : Attendence
    Created on : Nov 18, 2018, 10:52:33 AM
    Author     : i tech
--%>
<%@include file="Header.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <%
    String empid="";
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
         <script src="jquery.js" type="text/javascript"></script>
        <script>
            function fillEmployee(id,frm,to)
            {
                $.ajax(
                        {
                            url: "AjaxEmployee.jsp?id="+id+"&&frm="+frm+"&&to="+to,
                    success: function(result){
                        $("#myattID").html(result);
                    }
                        });
            }
        </script>
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
    </head>
    <body>
        <label for="datefrom">Date From</label>
          <input type="date" name="datafrom">
          <label for="dateto">Date To</label>
          <input type="date" name="dateto">
      <label for="emp">Employee ID</label>
      <Select name="empid" onchange="fillEmployee(this.value,datafrom.value,dateto.value)">
        <option selected="selected" value="">Select</option>
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
          
          <input type="submit" name="submit" value="Search"> 
           <div id="main">
           <table id="customers">
             <tr>
               <th>Date</th>
               <th>Attendance Status</th>
             
         
             </tr>
                
             <tr>
                 <td>
                     
                 </td>
             </tr>
           </table>
               <div id="myattID">
                   
               </div>
           </div>
    </body>
</html>
