<%-- 
    Document   : Leave
    Created on : Nov 19, 2018, 12:30:39 PM
    Author     : i tech
--%>
<%@include file="Header.jsp" %>

<br>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    
    <%
     if(request.getParameter("acceptid")!=null)
        {
            String a=request.getParameter("acceptid");
            String del="update tbl_leave set leave_status='1' where emp_id='"+a+"'";
            
            if(obj.insert(del))
            {%>
            <script>
                alert("Accepted");
                </script>
               <%
            }
            
            else
            {
                System.out.println("Failed to Update");
            }
            
        }
              if(request.getParameter("rejectid")!=null)
              {
                  String a=request.getParameter("rejectid");
            String dell="delete from tbl_leave where emp_id='"+a+"'";
            
            if(obj.insert(dell))
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
     
    
    
     %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave</title>
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
        <<form >
     
   <table id="customers">
       <tr>
       <th>No</th>
       <th>Employee Id</th>
       <th>Leave Reason</th>
       <th>Application Date</th>
       <th>Requested Date</th>
       <th>No of Days</th>
       <th>Accept</th>
       <th>Reject</th>
        </tr>
        

          <% String p="select * from tbl_leave where leave_status='0'";
                ResultSet r3=obj.select(p);
                int i=1;
                while(r3.next())
                {
                    
                String nam=r3.getString("emp_id");
                String reason=r3.getString("leave_reason");
                String date1=r3.getString("leave_date");
                String date2=r3.getString("leave_ldate");
                String days=r3.getString("leave_nodays");
                %>
                <tr> 
                    <td><%=i%></td>
                    <td><%=nam%></td>
                    <td><%=reason%></td>
                   <td><%=date1%></td>  
                     <td><%=date2%></td>
                       <td><%=days%></td>
                        
                    <td><a href ="Leave.jsp?acceptid=<%=r3.getString("emp_id")%>">Accept</a></td>
                    <td><a href ="Leave.jsp?rejectid=<%=r3.getString("emp_id")%>">Reject</a></td>
                </tr>
                <% i++;
                
                }
                
        %>
    
     
   </table>
        </form>
    </body>
</html>
