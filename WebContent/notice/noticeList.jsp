
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="semi.notice.NoticeDTO" %>
 
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"></jsp:useBean>
<!-- //session영역에 쓴거 재활용 copy/paste 왜? 오타 방지  -->

<%
request.setCharacterEncoding("utf-8");



/*/////////////paging관련



//필수정보4가지
int totalCnt= bdao.getTotalCnt(); 
//총 게시물 수
//sql : select count (*) from jsp_bbs

int listSize = 5; 
// 보여줄 게시물 수 

int pageSize = 5; 
//보여줄 페이지 수 


String cp_s = request.getParameter("cp");
if (cp_s==null|| cp_s.equals("")){
	
	cp_s="1";
}
int cp = Integer.parseInt(cp_s);

//1. total pg 
int totalPg = totalCnt/listSize+1;
if (totalCnt % listSize==0){
	totalPg= totalPg-1; 
	
}

int userGp =cp/pageSize; 
if ( cp %pageSize==0){
	userGp= userGp-1;
}
*/




%>

<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8">
<title>Insert title here</title>



</style>
</head>
<body>

		<h2>공지사항</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					
					
				</tr>
				
			</thead>
				
	
			
			
			<tbody>
			
			<% 
			ArrayList <NoticeDTO> arr = ndao.noticeList();
		
			
			if (arr== null|| arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center"> 등록된 글이 없습니다.</td>
				</tr>
				<%
			}
			else {
				for ( int i =0; i<arr.size(); i ++){
					%>
					<tr>
						<td><%=arr.get(i).getNotice_idx() %> </td>
			
						<td>
						
						<a href="noticeContent.jsp?notice_idx=<%=arr.get(i).getNotice_idx()%>"><%=arr.get(i).getNotice_title() %></a> </td>
						<td><%=arr.get(i).getNotice_writer() %> </td>
						<td><%=arr.get(i).getNotice_date() %> </td>
					</tr>
				
					<%
				}
			}
			
			%>
			
			
			<tr>
				<td colspan="4">	<a href="noticeWrite.jsp">글쓰기</a></td>
			</tr>
			
			

			</tbody>
			
			

		</table>
		
</body>
</html>