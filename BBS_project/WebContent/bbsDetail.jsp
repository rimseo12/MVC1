<%@ page language="java" contentType="text/html; charset=UTF-8"%>
   <%@page import="net.bbs.common.DBBbs" %>
     <%@page import="net.bbs.common.DBBbsDTO" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>bbsDetail.jsp</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">What my eyes have seen</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="bbsList.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <%if(session.getAttribute("user")!=null){ %>
          <li class="nav-item">
            <a class="nav-link" href="bbsLogout.jsp">Logout</a>
          <%}else{%>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="bbsLogin.jsp">Login</a>
          </li>
   
          <li class="nav-item">
            <a class="nav-link" href="bbsJoin.jsp">Join</a>
          </li>
          <%}%>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">
          <small>Photos</small>
        </h1>
 
        
   


        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="card-img-top" src="storage/" width="750" height="700" alt="">
          <div class="card-body">
            <h2 class="card-title">&nbsp;<img src="storage/like.png" width="20" height="20"><</h2> 
            <p class="card-text"></p>
            <a href="bbsImgDown.jsp?Timg=" class="btn btn-primary">Download &rarr;</a>
          </div>
          <div class="card-footer text-muted" align="right">
            Posted on 
            
            	String user=(String)session.getAttribute("user");
            	if(user!=null && user.equals(Tid) ){	
            <a href="#">edit</a>
           
            <a href="delete.gallery">delete</a>
          
          </div>
        </div>
        

        <div>
          	
        </div>
  
        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; Prev</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="#">Next &rarr;</a>
          </li>
        </ul>

      </div>
      <!-- class="col-md-8" -->
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; YS 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>