<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		msg="select * from bbs_member where t_id=? and pwd=?";
	
		PST=CN.prepareStatement(msg);
		PST.setString(1, id);		
		PST.setString(2, pwd);	
		
		RS=PST.executeQuery();

		if(RS.next()){
			String name=RS.getString("name");
			session.setAttribute("user", id);
			session.setAttribute("name", name);
			response.sendRedirect("bbsList.jsp");
		}else{
		%>
			<script type="text/javascript">
				alert("아이디나 비밀번호가 틀렸습니다.")
				history.back();
			</script>
		<%}	%>
</body>
</html>