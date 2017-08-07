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

String a = request.getParameter("password");

System.out.print(a.length());

boolean num = false;
boolean eng = false;

for (int i = 0; i < a.length(); i++) {

	if (48 <= a.charAt(i) && a.charAt(i) <= 57) {
		num = true;
	}

	if (65 <= a.charAt(i) && a.charAt(i) <= 90) {
		eng = true;
	}

	if (97 <= a.charAt(i) && a.charAt(i) <= 122) {
		eng = true;
	}
}
	
	if (request.getParameter("id") == null || request.getParameter("id").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("아이디를 입력해주세요.");
			history.back();
		</script>
		<%
	}

	else if (request.getParameter("name") == null || request.getParameter("name").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("이름을 입력해주세요.");
			history.back();
		</script>
		
		<%
	}
	else if (request.getParameter("password") == null || request.getParameter("password").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("비밀번호를 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if (request.getParameter("pwd2") == null || request.getParameter("pwd2").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("비밀번호 확인을 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if(8>a.length()||a.length()>12) {
		chk = false;
		%>
		<script>
			window.alert('비밀번호는 8~12자 입력해주세요.');
			history.back();
		</script>

		<%
	}
	
	else if (!num || !eng) {
		chk = false;
%>
<script>
	window.alert('영문과 숫자를 모두 조합해주세요.');
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
	else if (request.getParameter("ans") == null || request.getParameter("ans").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("2차비밀번호 답변을 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	
	if(chk) {
		int result = mdao.ceoJoin(mdto);

		String msg = result > 0 ? "회원가입성공" : "회원가입실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	} 
		%>


	

