<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String path=application.getRealPath("storage");
	String Timg=request.getParameter("Timg");
	
	File file=new File(path, Timg);
	response.setHeader("Content-Disposition", "attachment;filename="+Timg);
	
	InputStream is=new FileInputStream(file);
	OutputStream os=response.getOutputStream();
	
	byte[] bt=new byte[(int)file.length()];
	
	is.read(bt,0,bt.length);
	os.write(bt);
	
	is.close();
	os.close();

	


%>
</body>
</html>