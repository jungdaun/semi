
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="semi.notice.NoticeDTO" %>
 
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"></jsp:useBean>
<!-- //session영역에 쓴거 재활용 copy/paste 왜? 오타 방지  -->

<%int searchKey =(Integer.parseInt( request.getParameter("searchKey")));%>
<%String searchVal= request.getParameter("searchValue");%>

<%
request.setCharacterEncoding("utf-8");



/////////////paging관련

String msg = "";
switch (searchKey){
case 1:
	msg = "글 번호가 "+searchVal+"인 글입니다.";
	
	break;
case 2:
	msg = "글쓴이가 "+ searchVal+"인 글입니다. ";
	
	break;
case 3: 
	msg = "글 제목에 "+searchVal+"이(가) 포함된 글입니다.";
	
	break;
case 4:
	msg = "제목 또는 내용에 "+searchVal +"이(가) 포함된 글입니다.";
	break;


}

//필수정보4가지
int totalCnt= ndao.getTotalCnt(searchKey, searchVal);

System.out.println (totalCnt);

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
		border-top: 4px double white;
		border-bottom: 4px double white;
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
	}
	table thead th{
		background: #BF0920;
		color: white; 
		text-align: center;
	}
	table td{
		text-align: center
		
		;
	}
	
	tfoot {
		border-top: 4px double #BF0920;
		
	
	}
	#ns_ok{
		width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
	}
</style>
</head>
<body>





<%@include file="/header.jsp"%>
		<div id="bodywrap">
		<div id="ns_ok">

<!-- -------------------------------------------------------------- -->

		<h2>검색 결과</h2>
		<h3 ><font color="white"><%=msg %></font> </h3>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					
					
				</tr>
				
			</thead>
				
	  <tfoot>
         
            <tr>
               <td colspan="2" align="center">
               
               <%


            if (userGp !=0 ){
            
            %><a href="noticeSearch_ok.jsp?cp=<%=(userGp-1)*pageSize+pageSize%>&searchKey=<%=searchKey%>&searchValue=<%=searchVal%>">&lt;&lt;</a>
            
            
            <% 
            
            
            }
            
            
            for ( int i =userGp*pageSize+1; i<=userGp*pageSize+pageSize ; i ++){
               
               %>&nbsp;&nbsp;&nbsp;<a href="noticeSearch_ok.jsp?cp=<%=i %>&searchKey=<%=searchKey%>&searchValue=<%=searchVal%>"><font <%=cp==i?"color='red'":"" %>> <%=i %> </font> </a>&nbsp;&nbsp;&nbsp;<%
               if (i ==totalPg) break; 
            }
            
            
            if ( userGp!= (totalPg/pageSize -(totalPg%pageSize==0? 1:0)) ){
               %><a href="noticeSearch_ok.jsp?cp=<%=(userGp+1)*pageSize+1%>&searchKey=<%=searchKey%>&searchValue=<%=searchVal%>">&gt;&gt;</a><%
            }
            %>
               
               </td>
               <td><a href="noticeList.jsp">목록으로</a></td>
               <td> 
               
               
               <% 
               
               
               
               //////////// the people who has admin id can write notice 
			//	String sid = (String)session.getAttribute("sid");
				
               
               if (sid !=null ){
                   System.out.println (sid);
   				if (sid.equals("admin")){
   					System.out.println ("true");
   					out.println (" <a href='noticeWrite.jsp'>글쓰기</a>");
   					
   					
   				}
   				
   				
   				
               }
               
  

		%>
               
              </td>
              
              <
            </tr>
            <tr>
            	<td colspan="4">
	        	<form action="noticeSearch_ok.jsp" name="noticeSearch">
	        		<select name="searchKey">
	        			<option value="1">글번호</option>
	        			<option value="2">글쓴이</option>
	        			<option value="3">제목</option> 
	        			<option value="4">제목+내용</option> 
	        			 
	        		</select>
	        		
	        		<input type="text" name="searchValue">
	        		<input type="submit" value="search" >
	        	
	        	
	        	</form>
            	</td>
            
            </tr>
         
         </tfoot>            
			
			
			<tbody>
			
			<% 
			ArrayList <NoticeDTO> arr = ndao.noticeSearchedList(cp, listSize, searchVal, searchKey);
			
		
			
			if (arr== null|| arr.size()==0){
				%>
				<tr>
					<td colspan="4" align="center"> 등록된 공지사항이 없습니다.</td>
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

			</tr>
			
			

			</tbody>
			
			

		</table>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>
</div>





		
</body>
</html>