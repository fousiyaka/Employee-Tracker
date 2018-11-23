<%-- 
    Document   : District
    Created on : 4 Aug, 2018, 2:14:23 PM
    Author     : ASUS
--%>
<%@include file="Header.jsp" %>
<br>
<br><br>
<br>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <% String stateid="";
       String disid="";
               
       String id="";
        
        if(request.getParameter("submit")!=null)
    {
        String name=request.getParameter("districtname");
        String state=request.getParameter("statename"); 
        String idd=request.getParameter("hid");
        
      if(!idd.equals(""))
        { 
            String upd= "update tbl_district set dis_name='"+name+"',state_id='"+state+"' where dis_id='"+idd+"'";
            
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
        }  
      else{
          
      
        String insert="insert into tbl_district(dis_name,state_id)values('"+name+"','"+state+"')";
        boolean b=obj.insert(insert);
        
        if(b)
        {
            System.out.println("Successfully inserted");
        }
        else
        {
            System.out.println("Failed to insert");
        }
    }
    }if(request.getParameter("delid")!=null)
        {
            String a=request.getParameter("delid");
            String del="delete from tbl_district where dis_id='"+a+"'";
            
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
                  String sel="select dis_name,state_id from tbl_district where dis_id="+id;
                  System.out.println(sel);
                  ResultSet r = obj.select(sel);
                  if(r.next())
                  {
                   
                      stateid=r.getString("state_id");
                      disid=r.getString("dis_name");
                  }
              }
              
            
               
     
    
        
    
     %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District Page</title>
         <style>
input[type=text],input[type=password],select {
    width: 50%;
    padding: 12px 25px;
    margin: 8px 15px;
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
    margin: 8px 50px;
    
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

#main {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    margin-left:  350px;
    width: 40%;
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
    <body><div>
        <table id="customers">
  
</table>
        </div>
        
        

        
<div id="main">
    <form>
      <div>
          <label for="StateName">State</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Select name="statename">
        <option selected="selected"value="">Select</option>
        <% String s="select * from tbl_state";
        ResultSet rl=obj.select(s);
        while(rl.next())
        {
            
        
         %>
         <option <% if(stateid.equals(rl.getString("state_id"))){%>selected=""<%}%>value="<%=rl.getString("state_id")%>"><%=rl.getString("state_name")%></option>
         <%
        }
        %>
          </select>
      </div>
          <div>
    <label for="DistrictName">District Name</label>
    <input type="text" id="districtname" name="districtname" placeholder="Your districtname.." value="<%=disid%>" >
    <input type="hidden" name="hid" value="<%=id%>">
          </div>
      
	<input type="submit" name="submit" value="Submit">
        <table id="customers">
         <tr>
    <th>No</th>
    <th>State</th>
    <th>District</th>
    <th>Delete</th>
    <th>Edit</th>
  </tr>
        

          <% String p="select * from tbl_district d inner join tbl_state s on d.state_id=s.state_id";
                ResultSet r3=obj.select(p);
                int i=1;
                while(r3.next())
                {
                    
               
                String disnam=r3.getString("dis_name");
                %>
                <tr> 
                    <td><%=i%></td>
                    <td><%=r3.getString("state_name")%></td>
                    <td><%=disnam%></td>
                    <td><a href ="District.jsp?delid=<%=r3.getString("dis_id")%>">DELETE</a></td>
                    <td><a href ="District.jsp?edtid=<%=r3.getString("dis_id")%>">EDIT</a></td>
                </tr>
                <% i++;
                
                }
                
        %>
         </table>
        
        
  </form>
</div>
    </body>
</html>
<br>
<br><br>
<br>
<%@include file="footer.jsp" %>