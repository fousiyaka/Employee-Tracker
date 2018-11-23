<%-- 
    Document   : ViewSubmitedTask
    Created on : Nov 22, 2018, 7:45:02 AM
    Author     : i tech
--%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%@page import="java.sql.*"%>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <%
        
       if(request.getParameter("download")!=null)
       {
           String filename=request.getParameter("download");
           File proj_path=new File(config.getServletContext().getRealPath("/"));
           String file_path=proj_path.getParentFile().getPath()+"\\web\\Guest\\FileUploads\\"+filename;
//           File dimg=new File(file_path);
//           BufferedImage idec=ImageIO.read(dimg);
//           System.out.println(proj_path.getParentFile().getPath()+"\\web\\Guest\\FileUploads\\"+filename);
       
       
        String filepath = "e:\\";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(file_path  );  
           
int i;   
  while ((i=fileInputStream.read()) != -1) {  
   out.write(i);   
  }   
 fileInputStream.close();   

       }
       
    %>
    <head>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <form>
        <table id="customers">
                            <tr>
                                <th>Employee id</th>
                                <th>Task id</th>
                                <th>Description</th>
                                <th>File</th>
                                <th>Date</th>
                                <th>Time</th>
                            </tr>
        
        <%
            String sel="select * from tbl_submittask where submit_status='0'";
            ResultSet rs=obj.select(sel);
            while(rs.next())
            {
        %>
                <tr>
                    <td><%=rs.getString("emp_id")%></td>
                    <td><%=rs.getString("task_id")%></td>
                    <td><%=rs.getString("submit_desc")%></td>
                    <td><a href="ViewSubmitedTask.jsp?download=<%=rs.getString("submit_file")%>">Download</a></td> 
                    <td><%=rs.getString("submit_date")%></td>
                    <td><%=rs.getString("submit_time")%></td>
                    <td><a href ="Rate.jsp?acceptid=<%=rs.getString("emp_id")%>">Accept</a></td>
                </tr> 
        <%
            }
        %>
        </table>
        </form>
    </body>
</html>
