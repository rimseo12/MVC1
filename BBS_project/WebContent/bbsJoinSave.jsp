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
	    String name=request.getParameter("name");
	    
		System.out.println("id:"+id);
		msg="select count(*) cnt from bbs_member where t_id='"+id+"'";
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		int total=RS.getInt("cnt");
		
		
		////////////
		
		msg="select count(*) cb from bbs_member where name='"+name+"'";
        ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		int total2=RS.getInt("cb");
		
		if(total>0){%> 
		  <script type="text/javascript">
			alert("중복된 아이디입니다.");					
			history.back();
		  </script>
	
		<%}else if(total2>0){%>
		<script type="text/javascript">
		     alert("중복된 닉네임입니다.");
		     history.back();
		</script>
			
		<%} else{
			String pwd=request.getParameter("pwd");
			//String name=request.getParameter("name");
		
			msg="insert into bbs_member values(?,?,?)";
			
			PST=CN.prepareStatement(msg);
			PST.setString(1, id);
			PST.setString(2, pwd);
			PST.setString(3, name);
			
			PST.executeUpdate();
		%>
			<script type="text/javascript">
				alert("가입을 축하합니다.")
				location.href='bbsLogin.jsp';
			</script>
		
		
		<%}%>
		

</body>
</html>