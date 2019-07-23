<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css"  href="css/login.css">
	<link rel="stylesheet" type="text/css"  href="css/bootstrap.min.css">
	
	<script type="text/javascript" src="js/jquery.slim.js"></script> 
	<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script> 
	
	<script type="text/javascript">
		
		function pwd_check(){
			var PWD=document.getElementById('pwd').value;
			var PWD2=document.getElementById('pwd2').value;
			if(PWD!=PWD2){
				alert("비밀번호을 동일하게 입력해주세요.");
				document.getElementById('pwd').focus();
				return;
			}else{
				document.getElementById('join_form').submit();
			}
		}

	
	</script>
</head>
<body>
	


	<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">Welcome back!</h3>
              <form action="bbsJoinSave.jsp" method="get" id="join_form">
                <div class="form-label-group">
                  <input type="text" id="id" name="id" class="form-control" placeholder="ID" required autofocus>
                  <label for="inputEmail">ID</label>
                </div>
               
                <div class="form-label-group">
                  <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required>
                  <label for="inputPassword">Password</label>
                </div>
                
                <div class="form-label-group">
                  <input type="password" id="pwd2" name="pwd2" class="form-control" placeholder="Password Check" required>
                  <label for="inputPassword">Password Check</label>
                </div>
                
                <div class="form-label-group">
                  <input type="text" id="name" name="name" class="form-control" placeholder="NickName" required>
                  <label for="inputPassword">NickName</label>
                </div>

                <div class="custom-control custom-checkbox mb-3">
                  <input type="checkbox" class="custom-control-input" id="customCheck1">
                  <label class="custom-control-label" for="customCheck1">Remember password</label>
                </div>
                <input type='button' class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
                		 onclick="pwd_check()" value="join">
                <div class="text-center">
                  <a class="small" href="bbsLogin.jsp">login</a></div>
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