<%-- 
    Document   : Place
    Created on : 4 Aug, 2018, 2:14:43 PM
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place Page</title>
        <script src="jquery.js" type="text/javascript"></script>
        <script>
            function displaydistrict(id)
            {
                $.ajax(
                        {
                            url: "AjaxPlace.jsp?id="+id,
                    success: function(result){
                        $("#distid").html(result);
                    }
                        });
            }
        </script>
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
    </head>
    
    <body>
        <%
        String id="";
        String stateid="";
        String placeid="";
        String districtid="";
          if(request.getParameter("submit")!=null)
    {
        String place=request.getParameter("placename");
        String district=request.getParameter("districtname");
        String idd=request.getParameter("hid");
        if(!idd.equals("null"))
        {
            String upd= "update tbl_place set place_name='"+place+"',dis_id='"+district+"' where place_id="+idd+"'";
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
            else
            {
                
        String insert="insert into tbl_place(place_name,dis_id)values('"+place+"','"+district+"')";
        
        
         boolean b=obj.insert(insert);
        
        if(b)
        {
            %>
            <script>
                alert("Inserted successfully");
            </script>
            <%
        }
        else
         {
            System.out.println("Failed to insert");
          }
        }
          
        }
    }
    
            
             if(request.getParameter("delid")!=null)
        {
            String a=request.getParameter("delid");
            String del="delete from tbl_place where place_id='"+a+"'";
            
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
                  String sel="select place_name,p.dis_id,state_id from tbl_place p inner join tbl_district d on p.dis_id=d.dis_id where place_id="+id;
                  //System.out.println(sel);
                  ResultSet r = obj.select(sel);
                  if(r.next())
                  {
                     placeid =r.getString("place_name");
                     districtid= r.getString("dis_id");
                      stateid=r.getString("state_id");
                  }
              }
               
              
            
               
        
    %>
    
     


        
       
        <form>
        
        <div>
        <table id="customers">
  
</table>
        </div>

<div id="main">
   
      <div>
          <label for="StateName">State</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="hidden" name="hid" value="<%=id%>">
          <Select name="statename" onchange="displaydistrict(this.value)">
              
        <option selected="selected"value="">Select</option>
        <%
        String s ="select * from tbl_state";
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
          <label for="DistrictName">District</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Select name="districtname" id="distid">
        <option selected="selected"value="">Select</option>
        <% String ss="select * from tbl_district";
        ResultSet r2=obj.select(ss);
        while(r2.next())
        {
            
        
         %>
         <option <% if(districtid.equals(r2.getString("dis_id"))){%>selected=""<%}%>value="<%=r2.getString("dis_id")%>"><%=r2.getString("dis_name")%></option>
         <%
        }
        %>
          </select>
          
      </div>
    <label for="PlaceName">Place Name</label>
    <input type="text" id="placename" name="placename" placeholder="Your placename..">
    
      
      
	<input type="submit" name="submit" value="Submit">
            <table id="customers">
  <tr>
    <th>No</th>
    <th>Place</th>
    <th>District</th>
    <th>State</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
        

          <% String p="select * from tbl_place p inner join tbl_district d on p.dis_id =d.dis_id inner join tbl_state s on d.state_id= s.state_id";
                ResultSet r3=obj.select(p);
                int i=1;
                while(r3.next())
                {
                    
                String nam=r3.getString("place_name");
                %>
                <tr> 
                    <td><%=i%></td>
                    <td><%=nam%></td>
                    <td><%=r3.getString("dis_name")%></td>
                    <td><%=r3.getString("state_name")%></td>
                    <td><a href ="Place.jsp?delid=<%=r3.getString("place_id")%>">DELETE</a></td>
                    <td><a href ="Place.jsp?edtid=<%=r3.getString("place_id")%>">EDIT</a></td>
                </tr>
                <% i++;
                
                }
                
        %>
        </form>

    </body>
    </html>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%@include file="footer.jsp" %>
