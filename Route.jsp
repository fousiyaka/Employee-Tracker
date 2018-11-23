<%-- 
    Document   : Rout
    Created on : Aug 31, 2018, 2:01:04 PM
    Author     : admin
--%>
<%@include file="Header.jsp" %>
<br>
<br><br><br>
<br>
<br>
<br>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rout Page</title>
        <script src="jquery.js" type="text/javascript"></script>
        <script>
            function displaydistrict(id)
            {
                $.ajax(
                        {
                            url: "AjaxRout1.jsp?id="+id,
                    success: function(result){
                        $("#distid").html(result);
                    }
                        });
            }
        </script>
        <script>
            function displayplace(id)
            {
                $.ajax(
                        {
                            url: "AjaxRout2.jsp?id="+id,
                    success: function(result){
                        $("#placeid").html(result);
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
        String L1="";
        String L2="";
        String L3="";
        String L4="";
        if(request.getParameter("submit")!=null)
    {
        String place=request.getParameter("place");
        //String district=request.getParameter("districtname");
        String idd=request.getParameter("hid");
        String l1=request.getParameter("latitude1");
        String l2=request.getParameter("latitude2");
        String l3=request.getParameter("longitude1");
        String l4=request.getParameter("longitude2");
        if(!idd.equals("null"))
        {
            String upd= "update tbl_route set place_id='"+place+"',route_latfrom='"+l1+"',route_latto='"+l2+"',route_longfrom='"+l3+"',route_longto='"+l4+"' where place_id="+idd+"'";
            if(obj.insert(upd))
            {
                System.out.println("Updated Successfully");
                
            }
            else
            {
                
        String insert= "insert into tbl_route(place_id,route_latfrom,route_latto,route_longfrom,route_longto)values('"+place+"','"+l1+"','"+l2+"','"+l3+"','"+l4+"')";
        out.println(insert);
        
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
            String del="delete from tbl_route where route_id='"+a+"'";
            out.println(del);
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
                  
                  String sel="select * from tbl_route r inner join tbl_place p on r.place_id =p.place_id inner join tbl_district d on p.dis_id =d.dis_id where r.route_id="+id;
                 
                  //System.out.println(sel);
                  ResultSet r = obj.select(sel);
                  if(r.next())
                  {
                     placeid =r.getString("place_id");
                     L1= r.getString("route_latfrom");
                     L2=r.getString("route_latto");
                     L3=r.getString("route_longfrom");
                     L4=r.getString("route_longto");
                      
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
          <label for="StateName">State</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
              <br>
          <label for="DistrictName">District</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <Select name="districtname" id="distid" onchange="displayplace(this.value)">
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
          <br>
    <label for="PlaceName">Place Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select name="place" id="place">
        <option selected="selected" value="">Select</option>
        <%String s1="select * from tbl_place";
        ResultSet r6=obj.select(s1);
        while(r6.next())
        {
            %>
        <option <% if(placeid.equals(r6.getString("place_id"))){%>selected=""<%}%>value="<%=r6.getString("place_id")%>"><%=r6.getString("place_name")%></option>
            <%
        }
        %>
    </select>
    <div>
        <br>
    <label for="lattitude">Latitude From</label>&nbsp;&nbsp;&nbsp;
    <input type="text" id="latitude1" name="latitude1" value="<%=L1%>">
    <br>
    <label for="lattitude">To</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="text" id="latitude2" name="latitude2"value="<%=L2%>">
     </div>
     <br>
    <label for="longitude">Longitude From</label>&nbsp;&nbsp;&nbsp;
    <input type="text" id="longitude1" name="longitude1"value="<%=L3%>">
    <br>
    <label for="lattitude">To</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="text" id="longitude2" name="longitude2"value="<%=L4%>">
    <input type="submit" name="submit" value="Submit">
     <table id="customers">
  <tr>
    <th>No</th>
   
    <th>District</th>
    <th>Place</th>
    <th>Lattitude From</th>
    <th>Lattitude To</th>
    <th>Longitude From</th>
    <th>Longitude To</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
         <% String p="select * from tbl_route r inner join tbl_place p on r.place_id =p.place_id inner join tbl_district d on p.dis_id =d.dis_id";
                ResultSet r3=obj.select(p);
               //out.println(p);
                int i=1;
                while(r3.next())
                {
                    
               
                %>
                <tr> 
                    <td><%=i%></td>
                    
                    <td><%=r3.getString("dis_name")%></td>
                    <td><%=r3.getString("place_name")%></td>
                    <td><%=r3.getString("route_latfrom")%></td>
                    <td><%=r3.getString("route_latto")%></td>
                    <td><%=r3.getString("route_longto")%></td>
                    <td><%=r3.getString("route_longfrom")%></td>
                    <td><a href ="Route.jsp?delid=<%=r3.getString("route_id")%>">DELETE</a></td>
                    <td><a href ="Route.jsp?edtid=<%=r3.getString("route_id")%>">EDIT</a></td>
                </tr>
                <% i++;
                
                }
                
        %>

     </table>
        </form>

    </body>
    
    
</html>
<br><br><br><br><br>
<%@include file="footer.jsp" %>