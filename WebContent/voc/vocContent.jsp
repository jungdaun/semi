<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.voc.*" %>
    <jsp:useBean id="vdao" class="semi.voc.VocDAO" scope="session"/> 
    
    
    
    <%
    
    String admin = "admin";
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<title>Insert title here</title>
<style>
	h2{
		text-align: center;
		color: white; 
		
	}
	table{
		width: 450px;

		  

		
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
		
	}
	table th{
	
		  			border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		color: black; 
		text-align: center;
	}
	table td{
	
	
		text-align: left
		;
					border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		
		color: black; 
	
		;
	}
	
	tfoot tr{
	text-align: center
	;
	
	}
	
</style>
</head>
<body>

<%@include file="/header.jsp"%>
		<div id="bodywrap">

<%
    String idx_s= request.getParameter("idx");
    if(idx_s==null||idx_s.equals("")){
    	idx_s="0";
    }
    int idx=Integer.parseInt(idx_s);
/*
   String userPwd="";
    
    
    if (sid !=null && sid.equals(admin)){
    	userPwd = vdao.getUserPwd(idx);
    	
    }
    else {
        userPwd = request.getParameter("pwd");
    }
    
    */

    	VocDTO	dto=vdao.vocContent(idx);

    
    if(dto==null){
    %>
    <script>
    window.alert('잘못된 접근 또는 삭제된 게시글입니다.');
    location.href='vocList.jsp';
    </script>
    <%
    return;
    }
  
    %>

<!-- -------------------------------------------------------------- -->
<h2>[<%=dto.getWriter() %>]님의 질문글입니다.</h2>

<table >


<tr>
<th colspan="1">제목</th>
<td colspan="3"><%=dto.getTitle() %></td>
</tr>

<tr>
<th colspan="1">날짜</th>
<td colspan="3"><%=dto.getWritedate() %></td>
</tr>



<tr height="200">

<%if (dto.getContent().equals("") || dto.getContent()==null){

	
	%><td colspan="4"  valign="top" style="text-align: center;">...</td> <%
}	

else {

	%>
	<td colspan="4"  valign="top" style="text-align: left;"><%=dto.getContent().replaceAll("\n","<br>") %></td>

	<%
}

	%>


</tr>
<tfoot>

<tr>
<td colspan="4" style="text-align: center;"><a href="findMyVoc.jsp">목록으로</a>||

<%

		if (sid.equals(admin) ){
			%>
			<a href="vocReWrite.jsp?title=<%=dto.getTitle()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&turn=<%=dto.getTurn()%>&idx=<%=dto.getVod_idx()%>">답변쓰기||</a>
			

<a href="vocDel.jsp?voc_idx=<%=dto.getVod_idx()%>">글삭제</a>||<a href="vocUpdate.jsp?idx=<%=dto.getVod_idx()%>">수정</a>
			
			<%
		}


               //////////// the people who has admin id can write notice 
	//			String sid = (String)session.getAttribute("sid");
				
               
          //     if (sid !=null ){
                //  System.out.println (sid);
   				
              
  


%>


</td>
</tr>
</tfoot>
</table>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>





</body>
</html>