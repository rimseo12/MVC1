<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import=" java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
</head>
<body>
 
 <%!
 Connection CN; //CN필드 DB서버정보, 명령어생성할때 참조
 Statement ST;  //ST=CN.createStatement(); 명령어생성
 PreparedStatement PST; //미리서 SQL해석을 하고 준비하는 명령어 PST=Cn.prePareStatement("쿼리문")
 ResultSet RS; //RS=ST.executeQuery("select~"); 조회한 결과를 RS가 기억함		 

 String msg,Tid,Tname,Ttitle,Tcontent,T_img_name;
 Date T_img_date;
 int Gtotal,T_view,Tnum,Like,total;
 
 //댓글 
 int Rrn,Rnum;
 String Rid,Rname,Rcontent,Rrate;
 int Rtotal;//댓글개수
 java.util.Date Rdate;
 
 int Stotal;
 

 
 %>

<%
 try{
 //순서1 오라클 드라이브 라이브러리 로드, database마다 기술하는 방법이 다르다
 Class.forName("oracle.jdbc.driver.OracleDriver");
 
 //순서2 database서버 정보, 계정id, 비밀번호를 CN에게 기억시켜서 나중에 명령어생성 
 String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
 CN=DriverManager.getConnection(url,"system","oracle"); // ,id,password
 
 //out.println("hangry~~~~AM 10:50");
 System.out.println("DB연결성공 DB작업가능05-28-화요일:");	 
 }catch(Exception ex){System.out.println("DB연결실패:"+ ex);}

%>
</body>
</html>