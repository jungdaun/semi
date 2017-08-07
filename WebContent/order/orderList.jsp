<%@page import="semi.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="odao" class="semi.order.OrderDAO" scope="session"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

String store_idx_s = request.getParameter("s_idx");

int store_idx= Integer.parseInt(store_idx_s);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<thead>
		<tr>
			<th>주문번호</th>
			<th>고객 이름</th>
			<th>고객 주소</th>
			<th>고객 전화번호</th>
			<th>메뉴</th>
			<th>금액</th>
			<th>메모</th>
			<th>주문 시각</th>
			<th>가게 번호</th>
			<th>쿠폰</th>
			<th>완료</th>
				
		</tr>
						
	</thead>
	<tbody>
		
		<%
		ArrayList<OrderDTO> dtos= odao.orderList(store_idx); 
		
		if (dtos .size()==0 || dtos==null){
			%>
			<tr>
				<td colspan="11">no data </td>
			</tr>
			<%
		}
		else {
			for ( int i =0; i< dtos.size(); i ++){
				%>
				<tr>
				
					<td><%=dtos.get(i).getO_idx() %> </td>
					<td><%=dtos.get(i).getC_name() %> </td>
					<td><%=dtos.get(i).getC_addr()%> </td>
					<td><%=dtos.get(i).getC_tel()%> </td>
					<td><%=dtos.get(i).getMenu() %> </td>
					<td><%=dtos.get(i).getPrice() %> </td>
					<td><%=dtos.get(i).getMemo() %> </td>
					<td><%=dtos.get(i).getOrder_date() %> </td>
					<td><%=dtos.get(i).getS_idx()%> </td>
					
					<%if (dtos.get(i).getCoupon_type()==1){
						//price
						%>
						<td><%=dtos.get(i).getCoupon()%>원 할인</td>
						<%
					}
					else if (dtos.get(i).getCoupon_type()==2){
						//rate
						%>
						<td><%=dtos.get(i).getCoupon() %>% 할인</td>
						
						<%
					}
					else {
						%><td>null</td><%
					}
						
						
						
						
					%>
					
					<td>
						<%
						
						if (dtos.get(i).getFinish()== null || dtos.get(i).getFinish().equals("0") ){
							%><a href="delivery.jsp?o_idx=<%=dtos.get(i).getO_idx()%>&s_idx=<%=dtos.get(i).getS_idx()%>">배달하기</a><%
									
						}
						
						else 
						{
							%>배달완료<%
						}
						%>
					</td>
					
					</tr>
				
				
				<%
			}
		}
		%>
		
	
	
	</tbody>
	


</table>

</body>
</html>