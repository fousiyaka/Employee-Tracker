<%-- 
    Document   : ChangePassword
    Created on : Aug 31, 2018, 11:02:43 AM
    Author     : admin
--%>

<%@include file="Header.jsp" %>
<br>
<br>
<br>
<br>
<br>
<br>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <%
       
        if(request.getParameter("submit")!=null)
        {
        String cpsw=request.getParameter("currentpsw");
        String npsw=request.getParameter("newpsw");
        String rpsw=request.getParameter("retypepsw");
        
        if(rpsw.equals(npsw))
        {
           
            String select= "select * from tbl_admin where admin_password='"+cpsw+"' and admin_id="+session.getAttribute("UserID")+"";
            ResultSet rs= obj.select(select);
            if(rs.next())
            {
                  String upd= "update tbl_admin set admin_password='"+npsw+"' where admin_id="+session.getAttribute("UserID")+"";
                  if(obj.insert(upd))
            {
                %>
                <script>
                    alert("Password Updated")
                    </script>
                    <%
            }
                  else
            {
                    %>
                    <script>
                        alert("Failed to Update")
                    </script>
                    <%
                      
            }
                  
       
        }
            
        }
        else
        {
            %>
            <script>
                alert("Password Mismatch")
            </script>
            <%
        }
            
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
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

    <body>
        <div id="main">
<form >
    <div>
    <label for="currentpsw">Current Password</label>&nbsp&nbsp&nbsp&nbsp
    
    <input type="password" id="currentpsw" name="currentpsw" placeholder="" value="">
    </div>
    <br>
    <div>
    <label for="newpsw">New Password</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    
    <input type="password" id="newpsw" name="newpsw" placeholder="" value="">
    </div>
    <br>
    <div>
    <label for="retypepsw">Retype Password</label>&nbsp&nbsp&nbsp&nbsp&nbsp
    
    <input type="password" id="retypepsw" name="retypepsw" placeholder="" value="">
    </div>
    <br>
    <div>
   <input type="submit" name="submit" value="Submit">
    </div>
</form>
    </div>
       
    </body>
</html>
<br>
<br>
<br>
<br><br>
<br>



<%@include file="footer.jsp" %>