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
	else if (request.getParameter("tel2") == null || request.getParameter("tel2").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("전화번호를 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if (request.getParameter("tel3") == null || request.getParameter("tel3").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("전화번호를 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if (request.getParameter("address") == null || request.getParameter("address").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("주소를 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if (request.getParameter("address2") == null || request.getParameter("address2").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("상세주소를 입력해주세요.");
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

	}else if (request.getParameter("ans") == null || request.getParameter("ans").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("2차비밀번호 답변을 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	
	if(chk) {
		int result = mdao.update_ok(mdto);

		String msg = result > 0 ? "회원정보수정성공" : "회원정보수정실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	} 
		%>


	

