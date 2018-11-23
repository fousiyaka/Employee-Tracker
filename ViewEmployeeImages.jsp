<%-- 
    Document   : ViewEmployeeImages
    Created on : 25-Mar-2018, 12:15:53
    Author     : Anjali Babychen
--%>
<%@include file="Header.jsp" %>
<br>
<br>
<br>
<br><br>

<%@page import="java.sql.*"%>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Employee Images</title>
    </head>
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
        <form name="frmImageUploads" action="ViewEmployeeImages.jsp" method="POST">
        
        <table id="customers">
                            <tr>
                                <th>Employee Name</th>
                                <th>Image</th>
                                <th>Image Date</th>
                                <th>Image Time</th>
                            </tr>
        
        <%
            String sel="select * from tbl_imageupload";
            ResultSet rs=obj.select(sel);
            while(rs.next())
            {
        %>
                <tr>
                    <td><%=rs.getString("emp_id")%></td>
                    <td><img src="../../Guest/ImageUploads/<%=rs.getString("image_name")%>" width="300" height="300"></td> 
                    <td><%=rs.getString("image_date")%></td>
                    <td><%=rs.getString("image_time")%></td>
                </tr> 
        <%
            }
        %>
        </table>
        </table>
        </form>
    </body>
     <%@include file="footer.jsp" %>
</html>
