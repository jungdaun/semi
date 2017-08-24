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
	<h2 >공지사항-수정</h2>
	
			<form action="noticeUpdate_ok.jsp" name="noticeUpdate">
			<input type="hidden" name="notice_idx" value="<%=notice_idx%>">
					<table >
				
				<thead>
				<tr>
					
					<th>제목</th>
					<td colspan="3"><input type="text" value="<%=dto.getNotice_title() %>" name="notice_title">
					</td>
					</tr>
					
					<tr>
						<th>작성일</th>
					<td colspan="3"><%=dto.getNotice_date()  %></td>
					
				</tr>
		
				
	
				<tr>
					<th>작성자</th>
					<td colspan="3"><input type="text" name="notice_writer" value="<%=dto.getNotice_writer() %>">
					
					</td>
				</tr>
				</thead>
				<tbody>
				<tr height="200">
			
					<td colspan="4"><textarea rows="10" cols="45" name="notice_content" maxlength="4000" >
					<%=dto.getNotice_content()%>
				
					
					</textarea></td>
					
					
				</tr>
				</tbody>
				<tfoot>
				
				<tr >
					<td colspan="4" style="text-align: center;">
						<input type="submit" value="수정">
		
					
					
					</td>
				</tr>
				</tfoot>
				
				</table>
		
		</form>
			


		
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>


		
	</body>
</html>