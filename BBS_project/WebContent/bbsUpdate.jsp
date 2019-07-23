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
	
	
	<%
		Tnum=Integer.parseInt(request.getParameter("Tnum"));
		msg="select * from bbs_table where t_num="+Tnum;
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		Ttitle=RS.getString("t_title");
		Tcontent=RS.getString("t_content");
		T_img_name=RS.getString("t_img_name");
		
	
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
              
              <form method="post" action="bbsUpdateSave.jsp" enctype="Multipart/form-data">
              	<input type="hidden" value=<%=Tnum %> name="Tnum">
                <div class="form-label-group">
                  <input type="text" value=<%=Ttitle %> name="title" class="form-control" placeholder="Title" required autofocus>
                  <label for="inputTitle">Title</label>
                </div>

                <div class="form-label-group">
                  <input type="text" value=<%=Tcontent %> name="content" class="form-control" placeholder="Content" required>
                  <label for="inputContent">Content</label>
                </div>
                
                <div class="form-label-group">
                  <input type="file" name="t_img_name" class="form-control" placeholder="Name Of Images" required>
                  <label for="inputName">Name Of Images</label><br>
                </div>

                
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Edit</button>
                <div class="text-center">
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
	
</body>
</html>