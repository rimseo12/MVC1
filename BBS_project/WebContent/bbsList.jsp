<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bbsList.jsp</title>
 <style type="text/css">
  h2{font-weight: bold;}
  
  .img_size{
   width:auto;
   height:auto;
   max-height:400px; 
   max-width:250px;
  
  }
 </style>
 <script type="text/javascript">
 function enter(){
	
	 var keyPressed = event.keyCode || event.which;

     //if ENTER is pressed
     if(keyPressed==13)
     {
         home.keyword.submit();
     }
     else
     {
         return false;
     }
 }
 
 </script>

 <!-- Bootstrap core CSS -->
 <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
 <!-- Custom styles for this template -->
  <link href="css/business-frontpage.css" rel="stylesheet">

</head>
<body>

<!-- Page Content -->

<div class="container">

  <h1 class="font-weight-blod text-center text-lg-left mt-4 mb-0">What my eyes have seen</h1>
       <div id="header" align="right">
        <ul class="navbar-nav ml-auto">
         <li class="nav-item">
          <% 
          String Pop_nickname=(String)session.getAttribute("name");
		  if(Pop_nickname!=null){%> <a class="nav-link" href="#"><%=Pop_nickname%>님</a> <%}%>
          </li>
         <li class="nav-item active">
            <a class="nav-link" href="bbsWrite.jsp">Posting Images
            </a>
         </li>
         <li class="nav-item">
         <%
         String Pop_Login=(String)session.getAttribute("user");
         if(Pop_Login!=null){%> <a class="nav-link" href="bbsLogout.jsp">Logout</a> <%} 
         else{%><a class="nav-link" href="bbsLogin.jsp">Login</a> 
         <li class="nav-item">
            <a class="nav-link" href="bbsJoin.jsp">Join</a>
         </li>
         <%} %>  
          </li>
         
        </ul>
      </div>
 <!-- 검색하기 -->
<%
 String sql;
 String key=request.getParameter("keyfield");
 String word=request.getParameter("keyword");
 if(key==null||key==""||word==null||word==""){
	 key="";
	 word="";
	 sql="";
 }else{sql=" where "+ key+" like '%"+word+"%'" ;}
 
 String returnpage="&keyfield="+key+"&keyword="+word;
 %>
  
 <!-- 페이징 조건들 -->
 <%!
 String pnum;
 int pagenum ,pagecount;
 int start=1, end=5;
 int startpage,endpage;
 
 %>
 
 <%
 pnum=request.getParameter("Pnum");  //페이지 숫자 [1][2]345-678910-이런식으로
 if(pnum==null|| pnum==""){pnum="1";}
 pagenum=Integer.parseInt(pnum);
 start=(pagenum-1)*8+1; //게시글
 end=(pagenum*8);
 
 ST=CN.createStatement();
 msg="select count(*) as cnt from bbs_table";
 msg+=sql;
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 RS.next(); 
 total=RS.getInt("cnt");
 
 //8개씩 사진 묶어서
 if(total%8==0) {pagecount=total/8;}
 else {pagecount=(total/8)+1 ;}

 //시작페이지는 1,6,11  마지막페이지는 5,10,15 
 startpage=pagenum-(pagenum-1)%5;
 endpage=startpage+4;
if(endpage>pagecount){endpage=pagecount;}
 
 %>
 <br>
 
 <form action="bbsList.jsp" name="home" >
 <span id="search">SEARCH</span>
 <select name="keyfield" >
 <option value="search"  selected="true" disabled="disabled">Search free high-resolution photos</option>
 <option value="t_name" <%if(key.equals("t_name")){out.print("selected");}%>>writer</option>
 <option value="t_title"<%if(key.equals("t_title")){out.print("selected");}%>>title</option>
 <option value="t_content"<%if(key.equals("t_content")){out.print("selected");}%>>content</option>
 </select> &nbsp;&nbsp;
 <input type="text" name="keyword" size=10  value="<%=word%>" onkeypress="enter()">
 
 
 </form>
 
  <!-- 페이징 출력-->
  
   <%
   if(startpage!=1){
  	 out.print("<a href='bbsList.jsp?Pnum="+(startpage-1)+"'>[prev]</a>");
  	 System.out.println("<a href='bbsList.jsp?Pnum="+(startpage-1)+"'[prev]</a>");
   }
  
   
   for(int i=startpage;i<=endpage;i++){
  	 if(pagenum==i){out.print("<font style='color:grey;'>["+i+"]</font>");}else{
  		 out.print("<a href=bbsList.jsp?Pnum="+i+">["+i+"]</a>");
   } 
   }
   
   if(pagecount>endpage){
  	 out.print("<a href='bbsList.jsp?Pnum="+(startpage+5)+"'>[next]</a>");
  	 System.out.println("<a href='bbsList.jsp?Pnum="+(startpage+5)+"'[next]</a>");
   }
   %>
  

 <hr class="mt-2 mb-5">

  <div class="row text-center text-lg-left">
   <% 
    msg="select * from (";
    msg+=" select rownum rn, t.* from (";
    msg+=" select * from bbs_table "+sql+")t)";
    msg+=" where rn between "+start+" and "+end+"order by t_num asc";
    System.out.println(msg);
    ST=CN.createStatement();
    RS=ST.executeQuery(msg);
    
    while(RS.next()==true){
    		Tnum=RS.getInt("t_num");
    		Tid=RS.getString("t_id");
    		Tname=RS.getString("t_name");
    		Ttitle=RS.getString("t_title");
    		Tcontent=RS.getString("t_content");
    		T_img_name=RS.getString("t_img_name");
    		T_img_date=RS.getDate("t_img_date");
    		T_view=RS.getInt("t_view");
    	
   
    	%>
    
    <div class="col-lg-3 col-md-4 col-6"> 
      <a href="bbsDetail.jsp?Tnum=<%=Tnum%>" class="d-block mb-4 h-100">
           <img src="storage/<%=T_img_name %>" class="img_size"  onmouseover="this.style.opacity=0.7" onmouseout="this.style.opacity=1">
          </a>
    </div>
    
 <%}
 
   if(RS.next()!=true){
    //System.out.println("검색하신 사진의 정보가 존재하지 않습니다");
    String pop_notice=" 검색하신 사진의 정보가 존재하지 않습니다";}
    %>
      
            
   
 
 
 </div>
</div>


</body>
</html>