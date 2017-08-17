<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@ page import="semi.voc.*" %>
<jsp:useBean id="vdao" class="semi.voc.VocDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>



<meta charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">

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

	
</style>


<title>Insert title here</title>


</head>

<%
//String userIdx_s = request.getParameter("idx");
//System.out.println (userIdx);


String userIdx_s = request.getParameter("idx");
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

VocDTO dto = vdao.vocContent(notice_idx);

if (dto == null){

%>
<script type="text/javascript">

window.alert ('잘못된 게시글 또는 삭제된 게시물입니다.');
location.href='findMyVoc.jsp';


</script>

<%
return ; 

}



%>



<body>




<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
	
	<h2>voc update</h2>
		
			<form action="vocUpdate_ok.jsp" name="vocUpdate">
			<input type="hidden" readonly="readonly" name="voc_idx"  style="border: 0px;" value="<%=dto.getVod_idx() %>">
			<table>
				
				
							<tr>
					<th>제목</th>
					<td colspan="3">
					<input type="text" value="<%=dto.getTitle() %>" name="title">
					
					</td>
					</tr>
				
				<tr>
					
					
					
					
					<th>작성일</th>
					<td colspan="3"><%=dto.getWritedate()  %></td>
					
				</tr>
		
				
	
				<tr>
					<th>작성자</th>
					<td colspan="3"><input type="text" name="writer" readonly="readonly" style="border: 0px;" value="<%=dto.getWriter() %>">
					
					</td>
				</tr>
				<tr height="200">
			
					<td colspan="4"><textarea rows="10" cols="45" name="content" maxlength="4000" >
					<%=dto.getContent().replaceAll("\n", "<br>") %>
				
					
					</textarea></td>
					
					
				</tr>
			<!--  
			
				<tr>
				
					<th>
						비밀번호
						
					</th>
					<td><input type="password" name="pwd"  > </td>
				</tr>
				
				
				-->
			
				<tr >
					<td colspan="4" style="text-align: center;">
						<input type="submit" value="ok">
		
					
					
					</td>
				</tr>
			
				
					</table>
		
		</form>
			


	
	
	
	
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>







		
	</body>
</html>