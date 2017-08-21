<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="sdto" class="semi.store.StoreDTO" />
<jsp:setProperty property="*" name="sdto" />
<jsp:useBean id="sdao" class="semi.store.StoreDAO" />
<%
	//모든 값 검증..
	
	boolean chk = true;

if (request.getParameter("store_name") == null || request.getParameter("store_name").equals("")) {
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
	else if (request.getParameter("store_addr") == null || request.getParameter("store_addr").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("주소를 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	else if (request.getParameter("store_addr2") == null || request.getParameter("store_addr2").equals("")) {
		chk = false;
		%>
		<script>
			window.alert("상세주소를 입력해주세요.");
			history.back();
		</script>
		
		<%

	}
	
	
	if(chk) {
		int result = sdao.storeJoin(sdto);

		String msg = result > 0 ? "가게등록성공" : "가게등록실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	} 
		%>


	

