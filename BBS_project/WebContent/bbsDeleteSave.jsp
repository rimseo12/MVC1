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
		
		int num=Integer.parseInt(request.getParameter("Tnum"));	
	
		msg="delete from bbs_table where t_num="+num;
		System.out.println(msg);
		ST=CN.createStatement();
		ST.executeUpdate(msg);
	
		response.sendRedirect("bbsList.jsp");
	
	%>


</body>
</html>