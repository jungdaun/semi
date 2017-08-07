<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="semi.member.MemberDAO" />

<%
	request.setCharacterEncoding("utf-8");
%>

<%
String id = request.getParameter("id");
	String a = request.getParameter("password");
	String b = request.getParameter("password2");
	
	boolean chk = true;

	if (a.equals(b)) {
		
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
		
		

		if (8 > a.length() || a.length() > 12) {
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
		

	} else {
		chk = false;
%>
<script>
	
	window.alert('비밀번호와 비밀번호확인의 값이 다릅니다.');
	history.back();
</script>

<%
	}
	
	if(chk) {
		int result = mdao.getChangePwd(a, id);

		String msg = result > 0 ? "비밀번호 변경 성공" : "비밀번호 변경 실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			window.self.close();
		</script>
		<%
	}
%>
