<%--
    Document   : Upload Action
    Created on : March 24, 2018, 12:40:19 PM
    Author     : Anjali Babychen
--%>

<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean class="database.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%
    //declaring a fileitem variable
    FileItem f_item=null;
    String file_name="";
    String fname[]=null;
    //checking if request cotains multipart data
    boolean isMultipart=ServletFileUpload.isMultipartContent(request);
    if(isMultipart)
    {
        FileItemFactory factory=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(factory);
        //declaring a list of form fields
        List items_list=null;
        //assigning fields to list 'items_list'
        try
        {
            items_list=upload.parseRequest(request);
        }
        catch(FileUploadException ex)
        {
            out.println(ex);
        }
        //declaring iterator
        Iterator itr=items_list.iterator();
        //iterating through the list 'items_list'
        if(itr.hasNext())
        {
            //typecasting next element in items_list as fileitem
            f_item=(FileItem)itr.next();
            //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
            while(f_item.isFormField())
            {
                //getting fieldname and value
                String field=f_item.getFieldName();
                String value=f_item.getString();
            }
            //else part does the image upload
            file_name=f_item.getName();
            fname=file_name.split("/");
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Guest\\ImageUploads\\";
            //creating a file object
            File savedFile=new File(file_path+fname[0]);
            try
            {
                //writing the file object
                f_item.write(savedFile);
            }
            catch(Exception ex)
            {
                out.println(ex);
            }

        }

    }
    //writing details to database
    String q=session.getAttribute("id").toString();
    q=q.replaceAll("'", "");
    String qry="insert into tbl_imageupload(image_name,image_date,image_time,emp_id)values('"+file_name+"',curdate(),curtime(),'"+q+"')";
    System.out.print("\nFile Uploaded\n'"+qry+"'\n");
    //out.print(file_name);
    
    boolean status=obj.insert(qry);
    if(status==true)
    {
    }
    else
    { 
        out.println(session.getAttribute("id"));
    }       
%>