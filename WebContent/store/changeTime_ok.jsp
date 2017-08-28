<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="sdto" class="semi.store.StoreDTO" />
<jsp:setProperty property="*" name="sdto" />
<jsp:useBean id="sdao" class="semi.store.StoreDAO" />
<%
	//모든 값 검증..

	
	
	
		int result = sdao.changeTime(sdto);

		String msg = result > 0 ? "시간변경성공" : "시간변경실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>


	

