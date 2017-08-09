<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@ page import="semi.voc.*" %>
<jsp:useBean id="vdao" class="semi.voc.VocDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
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
location.href='vocList.jsp';


</script>

<%
return ; 

}



%>



<body>


		<h2 >voc update</h2>
		<table   border="1">
			<form action="vocUpdate_ok.jsp" name="vocUpdate">
			
				
				<tr>
					
					<th>idx</th>
					<td><input type="text" readonly="readonly" name="voc_idx" value="<%=dto.getVod_idx() %>">
					</td>
					
						<th>writeDate</th>
					<td><%=dto.getWritedate()  %></td>
					
				</tr>
		
				
				<tr>
					<th>title</th>
					<td colspan="3">
					<input type="text" value="<%=dto.getTitle() %>" name="title">
					</td>
				</tr>
				<tr>
					<th>writer</th>
					<td><input type="text" name="writer" value="<%=dto.getWriter() %>">
					
					</td>
				</tr>
				<tr height="200">
			
					<td colspan="4"><textarea rows="10" cols="45" name="content" maxlength="4000" >
					<%=dto.getContent().replaceAll("\n", "<br>") %>
				
					
					</textarea></td>
					
					
				</tr>
				<tr>
				
					<th>
						비밀번호
						
					</th>
					<td><input type="password" name="pwd"  > </td>
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