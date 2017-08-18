<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="sdto" class="semi.store.StoreDTO" />
<jsp:setProperty property="*" name="sdto" />
<jsp:useBean id="sdao" class="semi.store.StoreDAO" />
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
	
	
	if(chk) {
		int result = sdao.memberJoin(sdto);

		String msg = result > 0 ? "회원가입성공" : "회원가입실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	} 
		%>


	

