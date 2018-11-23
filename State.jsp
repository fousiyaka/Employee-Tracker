<%-- 
    Document   : State
    Created on : 4 Aug, 2018, 2:14:01 PM
    Author     : ASUS
--%>
<%@include file="Header.jsp" %>

<br>
<br>
<br>
<br>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    
    
    
    
   <% String id="";
      String stateid="";
      
     if(request.getParameter("submit")!=null)
    {
        String name=request.getParameter("statename");
        String idd=request.getParameter("hid");
        if(!idd.equals(""))
        { 
            String upd= "update tbl_state set state_name='"+name+"' where state_id='"+idd+"'";
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
        }  
        
        
     
        else
        {
        String insert="insert into tbl_state(state_name)values('"+name+"')";
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
            String del="delete from tbl_state where state_id='"+a+"'";
            
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
                  String sel="select state_name from tbl_state where state_id="+id;
                  System.out.println(sel);
                  ResultSet r = obj.select(sel);
                  if(r.next())
                  {
                   
                      stateid=r.getString("state_name");
                  }
              }
     
    
    
     %>
    <head>
        <title>State</title>
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
   



<form >
    
   <div id="main">
    <label for="statename">State</label>&nbsp&nbsp&nbsp&nbsp
    <input type="text" id="statename" name="statename" placeholder="state..." value="<%=stateid%>">
    <input type="hidden" name="hid" value="<%=id%>">
    <input type="submit" name="submit" value="Submit">
    
   
   <table id="customers">
       <th>No</th>
       <th>State</th>
       <th>Edit</th>
       <th>Delete</th>
        </tr>
        

          <% String p="select * from tbl_state ";
                ResultSet r3=obj.select(p);
                int i=1;
                while(r3.next())
                {
                    
                String nam=r3.getString("state_name");
                %>
                <tr> 
                    <td><%=i%></td>
                    <td><%=nam%></td>
                    <td><a href ="state.jsp?delid=<%=r3.getString("state_id")%>">DELETE</a></td>
                    <td><a href ="state.jsp?edtid=<%=r3.getString("state_id")%>">EDIT</a></td>
                </tr>
                <% i++;
                
                }
                
        %>
    
     
   </table>
   </div>
</form>

</body>
</html>
<br>
<br><br>
<br><br>
<br>
<%@include file="footer.jsp" %>

