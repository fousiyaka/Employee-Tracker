<%-- 
    Document   : TaskAssign
    Created on : Nov 15, 2018, 10:37:49 AM
    Author     : i tech
--%>
<%@include file="Header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place Page</title>
        <script src="jquery.js" type="text/javascript"></script>
<!--        <script>
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
        </script>-->
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
        String empid="";
        String taskid="";
        String tasktype="";
        String tasdesc="";
         if(request.getParameter("submit")!=null)
   {
       String emp=request.getParameter("emp");
        String task=request.getParameter("task");
         String subdate=request.getParameter("subdate");
        String idd=request.getParameter("hid");
       if(!idd.equals("null"))
        {
            String upd= "update tbl_taskassign set emp_id='"+emp+"',task_id='"+task+"',tassign_date=curdate(),tassign_time=curtime(),tassign_subdate='"+subdate+"' where tassign_id="+idd+"'";
           if(obj.insert(upd))
           {
                System.out.println("Updated Successfully");
               
           }
            else
            {
                
        String insert="insert into tbl_taskassign(emp_id,task_id,tassign_date,tassign_time,tassign_subdate)values('"+emp+"','"+tasktype+"',curdate(),curtime(),'"+subdate+"')";
        
        
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
            String del="delete from tbl_taskassign where tassign_id='"+a+"'";
            
            if(obj.insert(del))
            {%>
            <script>
                alert("Deleted");                </script>               <%
            }
            
            else
            {
               System.out.println("Failed to delete");
           }
            
        }
//              if(request.getParameter("edtid")!=null)
//              {
//                  id=request.getParameter("edtid");
//                  String sel="select place_name,p.dis_id,state_id from tbl_place p inner join tbl_district d on p.dis_id=d.dis_id where place_id="+id;
//                  //System.out.println(sel);
//                  ResultSet r = obj.select(sel);
//                  if(r.next())
//                  {
//                     placeid =r.getString("place_name");
//                     districtid= r.getString("dis_id");
//                      stateid=r.getString("state_id");
//                  }
//              }
//               
              
            
               
        
    %>
    
     


        
       
        <form>
        
        <div>
        <table id="customers">
  
</table>
        </div>

<div id="main">
   
     
         <label for="emp">Employee ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="hidden" name="hid" value="<%=id%>"> 
          <Select name="emp" >
               
        <option selected="selected"value="">Select</option>
        <%
        String s ="select * from tbl_emp";
        ResultSet rl=obj.select(s);
        while(rl.next())
        {
            
        
         %>
         <option <% if(empid.equals(rl.getString("emp_id"))){%>selected=""<%}%>value="<%=rl.getString("emp_id")%>"><%=rl.getString("emp_id")%></option>
         <%
        }
        %>
          </select>
          
      <label for="task">Task</label>
      <Select name="task" >
              
        <option selected="selected"value="">Select</option>
        <%
        String s1 ="select * from tbl_task";
        ResultSet r2=obj.select(s1);
        while(r2.next())
        {
            
        
         %>
         <option <% if(taskid.equals(r2.getString("task_id"))){%>selected=""<%}%>value="<%=r2.getString("task_id")%>"><%=r2.getString("task_id")%></option>
         <%
        }
        %>
          </select>
          <label for="subdate">Submission Date</label>
          <input type="text" name="subdate" value="">
      
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
