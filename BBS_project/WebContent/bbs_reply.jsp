<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		#table {display: table; width: 100%;}
		.row {display: table-row;}
		.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
		.col1 { width: 10%;}
		.col2 {width: 20%;}
		.col3 {width: 35%;}
		.col4 {width: 15%;
		.col5 {width: 10%;}
		.col6 {width: 10%;}
	</style>
	
	<script type="text/javascript">
		function  r_edit(num, content) {
			document.getElementById('content').value=content;
			document.getElementById('btn').innerHTML="수정";
			document.getElementById('reply_form').action="bbs_reply_update.jsp";
			document.getElementById('Rnum').value=num;
		}
	</script>

<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">
</head>
<body>

	<% Tnum=Integer.parseInt(request.getParameter("Tnum")); %>

			<div class="card my-4">
          <h5 class="card-header">댓글</h5>
          <div class="card-body">
          
          <form action="bbs_reply_insert.jsp" id="reply_form">
            <div class="input-group">
            	<input type="hidden" value="<%=Tnum %>" name="Tnum">
            	<input type="hidden" value="" name="Rnum" id="Rnum">
            	<select name="rate">
            		<option value="★" >★</option>
            		<option value="★★" >★★</option>   
            		<option value="★★★" >★★★</option>   
            		<option value="★★★★" >★★★★</option>   
            		<option value="★★★★★" >★★★★★</option>                    	
            	</select>
              <input type="text" name="content" id="content" class="form-control" placeholder="댓글.." required>
              <span class="input-group-btn">
                <button class="btn btn-secondary" id="btn" type="submit">등록</button>
              </span>
            </div>
           </form> 
 
 <%
 	msg="select count(*) cnt from bbs_reply where t_num="+Tnum;
	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
 	RS.next(); Stotal=RS.getInt("cnt");
 	
 	
 	
 	String RpageNum=request.getParameter("RPNum");
 	if(RpageNum==null || RpageNum==""){RpageNum="1";}
 	int rpNum=Integer.parseInt(RpageNum);
 	
 	int start, end, startpage, endpage, rpCount;
 	
 	if(Stotal%5==0){rpCount=Stotal/5;
 	}else{ rpCount=Stotal/5+1;}
 	
 	start=(rpNum-1)*5+1;
 	end=rpNum*5;
 	
 	
 	startpage=rpNum-(rpNum-1)%5;
 	endpage=startpage+4;
 	
 	if(endpage>rpCount)endpage=rpCount;
 	
 
	StringBuffer sb=new StringBuffer();
	sb.append("select * from(");
	sb.append("select rownum rn, br.* from");
	sb.append(" bbs_table b inner join bbs_reply br");
	sb.append(" on b.t_num=br.t_num");
	sb.append(" and br.t_num="+Tnum);
	sb.append(") where rn between "+start+" and "+end);
	System.out.println(sb.toString());
	ST=CN.createStatement();
	RS=ST.executeQuery(sb.toString());
	while(RS.next()){
		Rrate=RS.getString("tr_rate");
		Rdate=RS.getDate("tr_date");
		Rcontent=RS.getString("tr_content");
		Rname=RS.getString("tr_name");
		Rnum=RS.getInt("tr_num");%>
		
		<div id="table">
				<div class="row">
					<span class="cell col1"><%=Rname %></span>
					<span class="cell col2"><%=Rrate %></span>
					<span class="cell col3"><%=Rcontent %></span>
					<span class="cell col4"><%=Rdate %></span>
					<%
						String name=(String)session.getAttribute("name");
					if(name.equals(Rname)) {%>
					<span class="cell col5" id="edit">
								<a href="#" onclick="r_edit('<%=Rnum%>','<%=Rcontent%>')">수정</a></span>
					<span class="cell col6"><a href="bbs_reply_delete.jsp?Tnum=<%=Tnum%>&Rnum=<%=Rnum%>">삭제</a></span>
					<%} %>
				</div>
		</div>
	<%}
		if(startpage>5){
			out.print("<a href='bbsDetail.jsp?RPNum="+(startpage-5)+"'>[이전]</a>");
		}
	
		for(int i=startpage;i<=endpage;i++){
			if(rpNum==i){
				out.print("<font color=red>["+i+"]</font>");		
			}else{
				out.print("<a href='bbsDetail.jsp?RPNum="+i+"'>["+i+"]</a>");
			}
		}
		
		if(rpCount>endpage){
			out.print("<a href='bbsDetail.jsp?RPNum="+(startpage+5)+"'>[다음]</a>");
		}
	
	%>     
           
  </div>
</div>
</body>
</html>