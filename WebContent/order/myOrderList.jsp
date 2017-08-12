<%@page import="semi.cart.CartDTO"%>
<%@page import="semi.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>
 <jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
	<%

	int mem_idx = 1; 

	ArrayList<OrderDTO> dtos =odao.myOrderList(mem_idx);
	%>
	
	
	
	<table  border="1">
		
		<!-- 
		<tr>
			<th>주문번호</th>
			<th>주문날짜</th>
		</tr>
		<tr>
			
			<th>상품이름</th>
			<th>상품갯수</th>
			<th>가격</th>
		</tr>
		<tr>
			<th>주문상태</th>
			<th>총가격</th>
			
		</tr>
		 -->

	<%
	
	
	
	if (dtos ==null || dtos.size()==0){
		%>
		no data
		<%
	}
	
	else {
		for ( int i =0; i< dtos.size(); i ++){
			
			ArrayList<CartDTO> cartdtos = ctdao.myCartList(dtos.get(i). getOrder_idx());
			
			
			
			
			%>
			<tr>
				<th>주문번호</th>
			<td ><%=dtos.get(i).getOrder_idx() %> </td>
			<th>주문날짜</th>
			<td ><%=dtos.get(i).getOrder_date() %> </td>
			</tr>
			
			
			
			<tr>
			<TH colspan="2">품목</TH>
			<TH>갯수</TH>
			<TH>단품가</TH>
			</tr>
			
			<%
			
			for ( int j =0; j<cartdtos.size(); j ++){
				%>
				
				
				<tr>
				
				<td colspan="2"><%=cartdtos.get(j).getFood_name() %> </td>
				<td><%=cartdtos.get(j).getFood_count() %> </td>
				<td><%=cartdtos.get(j).getFood_price()%> </td></tr>
				<%
			}
			
			
			%>
			<tr>
				<th>배달상황</th>
				<td ><%=dtos.get(i).getFinish() %> </td>
				<th>총 가격</th>
				<td ><%=dtos.get(i).getFinal_price() %> </td>
			
			</tr>
			<%
		}
	}
	%>
	
		</table>
	

</body>
</html>