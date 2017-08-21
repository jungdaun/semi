<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>


<%
int oIdx = Integer.parseInt(request.getParameter("oIdx")) ;
int state = Integer.parseInt(request.getParameter("state")) ;

if (state < 0 || state> 2){
	%>
	<script>
	window.alert ('오류');
	location.href = 'myStoreOrderList.jsp';
	
	</script>
	
	<%
	
	return ; 
}
else {
	int res = odao.changeState(state, oIdx);
	if (res > 0 ){
		
		%>
		<script>
		window.alert ('주문 상태가 변경되었습니다.');
		location.href = 'myStoreOrderList.jsp';
			
		</script>
		<%
		
	}
	else {
		%>
		<script>
		window.alert ('변경 오류');
		location.href = 'myStoreOrderList.jsp';
			
		</script>
		<%
		
	}
	
}


%>


<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>