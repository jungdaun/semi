<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@ page import="semi.notice.NoticeDTO" %>
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


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


		<h2 >공지사항-본문보기</h2>
		<table   border="1">
			<form action="noticeUpdate_ok.jsp" name="noticeUpdate">
			
				
				<tr>
					
					<th>idx</th>
					<td><input type="text" readonly="readonly" name="notice_idx" value="<%=dto.getNotice_idx() %>">
					</td>
					
						<th>writeDate</th>
					<td><%=dto.getNotice_date()  %></td>
					
				</tr>s
		
				
				<tr>
					<th>title</th>
					<td colspan="3">
					<input type="text" value="<%=dto.getNotice_title() %>" name="notice_title">
					</td>
				</tr>
				<tr>
					<th>writer</th>
					<td><input type="text" name="notice_writer" value="<%=dto.getNotice_writer() %>">
					
					</td>
				</tr>
				<tr height="200">
			
					<td colspan="4"><textarea rows="10" cols="45" name="notice_content" maxlength="4000" >
					<%=dto.getNotice_content().replaceAll("\n", "<br>") %>
				
					
					</textarea></td>
					
					
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="ok">
		
					
					
					</td>
				</tr>
				
				
		</form>
			


		</table>
		
	</body>
</html>