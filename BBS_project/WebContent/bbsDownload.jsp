<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@page import="java.io.FileInputStream"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsDownload</title>
</head>
<body>
<%
String path=application.getRealPath("storage");
String data=request.getParameter("t_img_name");

File file=new File(path,data);
response.setHeader("Content-Disposition","attachment;filename="+data);

try{
	 InputStream is=new FileInputStream(file);
	 OutputStream os=response.getOutputStream();
	 byte[] bt=new byte[(int)file.length()];  //각각의 파일크기/길이만큼
	 is.read(bt,0,bt.length);
	 os.write(bt);
	 is.close(); os.close(); //필수!
}catch(Exception ex){}

%>
</body>
</html>