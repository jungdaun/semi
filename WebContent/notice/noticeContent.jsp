<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@ page import="semi.notice.NoticeDTO" %>
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"></jsp:useBean>

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

<%


String admin = "admin";


//String userIdx_s = request.getParameter("idx");
//System.out.println (userIdx);


String userIdx_s = request.getParameter("notice_idx");
int notice_idx ; 
if (userIdx_s==null || userIdx_s.equals("")){
	
	notice_idx = 0; 
	
}
else {
	notice_idx= Integer.parseInt(userIdx_s);
}


/*
boolean check= false; 
if (session.getAttribute(userIdx+"")!=null){

	check = true; 
	
}


session.setAttribute(userIdx+"", true);

*/

NoticeDTO dto = ndao.noticeContent(notice_idx);

if (dto == null){

%>
<script type="text/javascript">

window.alert ('잘못된 게시글 또는 삭제된 게시물입니다.');
location.href='noticeList.jsp';


</script>

<%
return ; 

}



%>



<body>




<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
	<h2 >공지사항</h2>
		<table>

				
				<tr>
					<th>제목</th>
					<td colspan="3"><%=dto.getNotice_title() %></td>
				</tr>
				
							
				<tr>
		
					
						<th>작성일</th>
					<td colspan="3"><%=dto.getNotice_date()  %></td>
				</tr>
		
				
				<tr>
					<th>작성자</th>
					<td colspan="3"><%=dto.getNotice_writer() %></td>
				</tr>
				<tr height="200">
					<td colspan="4" style="text-align: left;">
				<%=dto.getNotice_content().replaceAll("\n", "<br>") %>
					
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
					<a href="noticeList.jsp">목록보기</a>
				
					<%
					if (((String)session.getAttribute("sid")).equals(admin) && session.getAttribute("sid")!=null){
						%>
						|	<a href="noticeWrite.jsp">글쓰기</a>
					
					|<a href="noticeUpdate.jsp?notice_idx=<%=dto.getNotice_idx()%>">글수정</a>|
					<a href="noticeDelete_ok.jsp?notice_idx=<%=dto.getNotice_idx()%>">글삭제</a>
						
						<%
					}
					
					%>
					
		
					
					
					</td>
				</tr>
				
				
		
			


		</table>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>





	
		
	</body>
</html>