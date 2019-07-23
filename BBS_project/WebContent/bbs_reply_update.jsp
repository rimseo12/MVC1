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
        Rcontent=request.getParameter("content");
		Rrate=request.getParameter("rate");
		Rnum=Integer.parseInt(request.getParameter("Rnum"));
		Tnum=Integer.parseInt(request.getParameter("Tnum"));
		msg="update bbs_reply set tr_content=?, tr_rate=? where tr_num=?";
		PST=CN.prepareStatement(msg);
		PST.setString(1, Rcontent);
		PST.setString(2, Rrate);
		PST.setInt(3, Rnum);
		
		PST.executeUpdate();
		
		response.sendRedirect("bbsDetail.jsp?Tnum="+Tnum);


%>
</body>
</html>