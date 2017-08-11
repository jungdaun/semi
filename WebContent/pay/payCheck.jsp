<%@page import="semi.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>

 
<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int oIdx =Integer.parseInt(request.getParameter("oIdx")) ;
	
	
	OrderDTO dtos = odao.orderCheck(oIdx);
	
	if ( dtos ==null){
		%>
		no data
		
		<%
	}
	else {
		%>
	<table>
		
		<tr>	
			<th>받는분</th>
			<td><%=dtos.getC_name() %> </td>
			<th>전화번호</th>
			<td><%=dtos.getC_tel() %></td>	
			
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dtos.getC_addr() %></td>
		</tr>

	</table>
		<%
	}
	%>

	


</body>
</html>