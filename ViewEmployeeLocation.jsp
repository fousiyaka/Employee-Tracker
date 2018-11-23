<%-- 
    Document   : ViewEmployeeLocation
    Created on : 15-Mar-2018, 12:02:20
    Author     : Anjali Babychen
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Employee Location Details</title>
    
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
        <form >
       
            <table id="customers">
  <tr>
   
   
    <th>Employee id</th>
    <th>Latitude</th>
    <th>Longitude</th>
    <th>date</th>
    <th>time</th>
    <th>Place</th>
    
  </tr>
         <% String p="select * from tbl_tracklocation";
                ResultSet r3=obj.select(p);
               //out.println(p);
                int i=1;
                while(r3.next())
                {
                    
               
                %>
                <tr> 
                    
                    <td><%=r3.getString("emp_id")%></td>
                    <td><%=r3.getString("lattitude")%></td>
                    <td><%=r3.getString("longitude")%></td>
                    <td><%=r3.getString("date")%></td>
                    <td><%=r3.getString("time")%></td>
                    <td><%=r3.getString("locationplace")%></td>
                  
                </tr>
                <% i++;
                
                }
                
        %>

     </table>
       
    </form>
    </body>
    
</html>
<%@include file="footer.jsp" %>