<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="semi.member.MemberDAO" />
<%
	String ask = request.getParameter("ask");
	String ans = request.getParameter("ans");
	String userid = request.getParameter("id");
	String type = request.getParameter("type");
	String userPwd = mdao.getUserPwd(userid, ask, ans, type);
	
	%>
	
	<body>
<form name = "happy">
<input type = "button" name = "id" value = "<%=userid%>">
</form>
</body>

<%

	if (userPwd == null || userPwd.equals("")) {
%>
<script>
	window.alert('입력하신 정보가 정확하지 않습니다.');
	location.href = 'findPwd.jsp';
</script>

<%
	} else {
%>
<script>
	window.open('changePwd.jsp', 'changePwd', 'width = 600, height = 200');
	location.href = '/semi/index.jsp';
</script>
<%
	}
%>

