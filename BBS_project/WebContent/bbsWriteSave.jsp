<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bbsWriteSave</title>

	
</head>
<body>
<%
String id=(String)session.getAttribute("user");
String nickname=(String)session.getAttribute("name");
String path=application.getRealPath("storage");
int size=1024*1024*250;
DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8",dfr);

String t=mr.getParameter("inputTitle");
String c=mr.getParameter("inputContent");
String n=mr.getFilesystemName("inputAttached");

System.out.println("넘어온"+t);
System.out.println("넘어온"+c);
System.out.println("넘어온"+n);

File ff=mr.getFile("inputAttached");
long fsize= ff.length();

//DB에저장
msg="insert into bbs_table values(bbs_table_seq.nextval,?,?,?,?,?,sysdate,0)";
PST=CN.prepareStatement(msg);
 PST.setString(1,id);
 PST.setString(2,nickname);
 PST.setString(3,t);
 PST.setString(4,c);
 PST.setString(5,n);
PST.executeUpdate();


response.sendRedirect("bbsList.jsp");
%>
	
</body>
</html>