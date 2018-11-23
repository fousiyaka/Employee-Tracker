<%-- 
    Document   : Image Upload
    Created on : Nov 15, 2018, 1:47:22 PM
    Author     : i tech
--%>

<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Upload</title>
    </head>

    <form name="upload" action="upload_action.jsp" enctype="multipart/form-data" method="post" >
    <h1 align="center">
            UPLOADING FILE
    </h1>
    <body>
    <%
        session.setAttribute("id",request.getParameter("id"));
    %>
        <tr>
            <br>
            <br>
                <td align="center">BROWSE THE PHOTO:</td>
                <td><input type="file" name="txtup" value="" required=""/></td>
        </tr>
        <tr>
             <td>
             <br>
                        
             </td>
        </tr>
        <tr>                 
            <td colspan="2" align="center"><input type="submit" value="Submit" name="submit" required="" /></td>
        </tr>
    </table>
    </body>
    </form>
    </html>
