<%@page import="com.sun.jndi.cosnaming.CNCtx"%>
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

	Rid=(String)session.getAttribute("user");
	Rname=(String)session.getAttribute("name");
	if(Rid!=null || Rname!=null){
	Rrate=request.getParameter("rate");
	Rcontent=request.getParameter("content");
	Tnum=Integer.parseInt(request.getParameter("Tnum"));
	msg="insert into bbs_reply values(bbs_reply_seq.nextval,?,?,?,sysdate,?,?)";

	PST=CN.prepareStatement(msg);
	PST.setString(1,Rid);
	PST.setString(2, Rname);
	PST.setString(3, Rcontent);
	PST.setString(4, Rrate);
	PST.setInt(5, Tnum);
	
	PST.executeUpdate();
	
	response.sendRedirect("bbsDetail.jsp?Tnum="+Tnum);
	
 }else{%>
  <script type="text/javascript">
	alert("login 후 사용가능합니다");
	history.back();
 </script>
<%}%> 


</body>
</html>