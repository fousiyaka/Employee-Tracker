<%-- 
    Document   : Header.jsp
    Created on : Nov 21, 2018, 9:39:31 PM
    Author     : i tech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Appton - Bootstrap 4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,600">
    <!-- Lightbox-->
    <link rel="stylesheet" href="vendor/lightbox2/css/lightbox.css">
    <!-- Custom font icons-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- navbar-->
    <header class="header">
      <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container"><a href="./" class="navbar-brand"><img src="img/logo.svg" alt="" class="img-fluid"></a>
          <button type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right">Menu<i class="fa fa-bars ml-2"></i></button>
          <div id="navbarSupportedContent" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                  <!-- Link-->
                  <li class="nav-item"> <a href="index.html" class="nav-link active">Home</a></li>
                  
              <li class="nav-item dropdown"><a id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Route</a>
                <div class="dropdown-menu"><a href="State.jsp" class="dropdown-item">State</a><a href="District.jsp" class="dropdown-item">District</a><a href="Place.jsp" class="dropdown-item">Place</a><a href="Route.jsp" class="dropdown-item">Add Route</a><a href="AssignRoute.jsp" class="dropdown-item">Assign Route</a></div>
              </li>
               
              <li class="nav-item dropdown"><a id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Task</a>
                <div class="dropdown-menu"><a href="Task.jsp" class="dropdown-item">Add Task</a><a href="Task Assign.jsp" class="dropdown-item">Assign Task</a></div>
              </li>
               
              <li class="nav-item dropdown"><a id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Track</a>
                <div class="dropdown-menu"><a href="ViewEmployeeLocation.jsp" class="dropdown-item">Employee Location</a><a href="ViewEmployeeImages" class="dropdown-item">View Image</a></div>
              </li>
                  <!-- Link-->
                  <li class="nav-item"> <a href="Notification.jsp" class="nav-link">Notificaton</a></li>
                  <!-- Link-->
                  <li class="nav-item"> <a href="Leave.jsp" class="nav-link">Leave</a></li>
                    <li class="nav-item"> <a href="contact.html" class="nav-link">Attendance</a></li>
                    <li class="nav-item dropdown"><a id="pages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Settings</a>
                <div class="dropdown-menu"><a href="ChangePassword.jsp" class="dropdown-item">Change Password</a><a href="../../Guest/Login.jsp" class="dropdown-item">Logout</a></div>
              </li>   
                  <!-- Link-->
                 
           
          </div>
        </div>
      </nav>
    </header>
    <!-- Login Modal-->
   
    
   
    
   
    
    
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/lightbox2/js/lightbox.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>