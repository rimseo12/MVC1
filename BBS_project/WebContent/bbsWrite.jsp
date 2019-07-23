<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bbsWrite</title>
 <link rel="stylesheet" type="text/css"  href="css/login.css">
 <link rel="stylesheet" type="text/css"  href="css/bootstrap.min.css">
	
 <script type="text/javascript" src="js/jquery.slim.js"></script> 
 <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script> 
	
</head>
<body>

<div class="container">

  <h1 class="font-weight-blod text-center text-lg-left mt-4 mb-0">What my eyes have seen</h1>
       <div id="header" align="right">
        <ul class="navbar-nav ml-auto">
         <li class="nav-item">
          <% 
          String Pop_nickname=(String)session.getAttribute("name");
		  if(Pop_nickname!=null){%> <a class="nav-link" href="#"><%=Pop_nickname%>님</a> <%}%>
          </li>
         <li class="nav-item active">
            <a class="nav-link" href="bbsWrite.jsp">Posting Images
            </a>
         </li>
         <li class="nav-item">
         <%
         String Pop_Login=(String)session.getAttribute("user");
         if(Pop_Login!=null){%> <a class="nav-link" href="bbsLogout.jsp">Logout</a> <%} 
         else{%><a class="nav-link" href="bbsLogin.jsp">Login</a> 
         <li class="nav-item">
            <a class="nav-link" href="bbsJoin.jsp">Join</a>
         </li>
         <%} %>  
          </li>
         
        </ul>
      </div>



<%
String user=(String)session.getAttribute("user");
if(user!=null){
	System.out.println(user);
%>
 <div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">Posting Images</h3>
              
              <form method="post" action="bbsWriteSave.jsp" enctype="Multipart/form-data">
                <div class="form-label-group">
                  <input type="text" name="inputTitle" class="form-control" placeholder="Title" required autofocus>
                  <label for="inputTitle">Title</label>
                </div>

                <div class="form-label-group">
                  <input type="text" name="inputContent" class="form-control" placeholder="Content" required>
                  <label for="inputContent">Content</label>
                </div>
                
                <div class="form-label-group">
                  <input type="file" name="inputAttached" class="form-control" placeholder="Name Of Images" required>
                  <label for="inputName">Name Of Images</label><br>
                </div>

                
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Create</button>
                <div class="text-center">
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%}else {%>
 <script type="text/javascript">
 alert("login을 해주세요");
 location.href="bbsLogin.jsp";
 </script>
<%}%>	
</div>
</body>
</html>