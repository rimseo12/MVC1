<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String path=application.getRealPath("storage");
	int size=1024*1024*7;
	DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
	MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8",dfr);	
	
	int t_num=Integer.parseInt(mr.getParameter("Tnum"));
	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
	String img=mr.getFilesystemName("t_img_name");
	
	msg="update bbs_table set t_title=?, t_content=?, t_img_name=?  where t_num=?";
	
	PST=CN.prepareStatement(msg);
	PST.setString(1,title);
	PST.setString(2,content);
	PST.setString(3,img);
	PST.setInt(4,t_num);
	
	PST.executeUpdate();
	
	response.sendRedirect("bbsList.jsp");

%>
</body>
</html>