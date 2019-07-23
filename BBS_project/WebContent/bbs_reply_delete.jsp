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

	<% Rnum=Integer.parseInt(request.getParameter("Rnum"));
		Tnum=Integer.parseInt(request.getParameter("Tnum"));
		
		msg="delete from bbs_reply where tr_num="+Rnum;
		ST=CN.createStatement();
		ST.executeUpdate(msg);
		
		response.sendRedirect("bbsDetail.jsp?Tnum="+Tnum);
	%>

</body>
</html>