<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="semi.member.MemberDAO" />
<%


String id = (String) session.getAttribute("sid");
String type = (String) session.getAttribute("stype");
	
	
	
		int result = mdao.memberOut(id, type);

		String msg = result > 0 ? "회원탈퇴성공" : "회원탈퇴실패";
		
		
		session.invalidate();
		response.sendRedirect("/semi");

		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	
		%>


	

