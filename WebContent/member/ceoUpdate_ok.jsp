<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mdto" class="semi.member.MemberDTO" />
<jsp:setProperty property="*" name="mdto" />
<jsp:useBean id="mdao" class="semi.member.MemberDAO" />
<%
	//모든 값 검증..
	
	boolean chk = true;





	if (request.getParameter("name") == null || request.getParameter("name").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("이름을 입력해주세요.");
			history.back();
		</script>
		
		<%
	}
	else if (request.getParameter("email") == null || request.getParameter("email").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("이메일을 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if (request.getParameter("email2") == null || request.getParameter("email2").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("이메일을 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	
	if(chk) {
		int result = mdao.ceoupdate_ok(mdto);

		String msg = result > 0 ? "회원정보수정성공" : "회원정보수정실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	} 
		%>


	

