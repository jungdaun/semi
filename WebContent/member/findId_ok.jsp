<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="semi.member.MemberDAO" />


<%
	String username = request.getParameter("name");
	String useremail = request.getParameter("email");
	String type = request.getParameter("type");
	String userid = mdao.getUserId(username, useremail, type);

	if(userid == null || userid.equals("")) {
		
%>
<script>
	window.alert('입력하신 정보의 아이디가 없습니다.');
	location.href='findId.jsp';
</script>

<%
	} else {
%>
<script>
	window.alert('찾으시는 아이디는 <%=userid%> 입니다.');
	window.self.close();0
</script>
<%
	}
%>