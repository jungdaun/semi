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

<h2>주문 내역</h2>
	<table>	
		<thead>
			<tr >
				<th>품목</th>
				<th>단품가격</th>
				<th>갯수</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
							<%
							int oIdx =Integer.parseInt(request.getParameter("oIdx")) ;
				ArrayList<CartDTO> cartdto = ctdao.myCartList(oIdx);
				if(cartdto==null || cartdto.size()==0){
						
					%><tr>
					<td>no data</td></tr><%
				}
				else {
					for ( int i =0; i< cartdto.size(); i ++){	
						%>
						<tr>
							<td><%=cartdto.get(i).getFood_name() %> </td>
							<td><%=cartdto.get(i).getFood_price() %> </td>
							<td><%=cartdto.get(i).getFood_count()%> </td>
							<td><%=cartdto.get(i).getTotal_price()%> </td>
						</tr>
						
						<%
					}
				
				}
	
	%>
			
			
		
		
		</tbody>
	
	
	</table>
	<%
	
	
	
	OrderDTO dtos = odao.orderCheck(oIdx);
	
	
	
	if ( dtos ==null){
		%>
		no data
		
		<%
	}
	else {
		%>
		
		<h2>배송 정보</h2>
	<table>
	
		
		<tr>	
			<th>받는분</th>
			<td><%=dtos.getC_name() %> </td>
			<th>전화번호</th>
			<td><%=dtos.getC_tel() %></td>	
			
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3"><%=dtos.getC_addr() %></td>
		</tr>
		<tr>
			<th>전달사항</th>
			<td colspan="3"><%=dtos.getMemo() %></td>
		</tr>
		
		
	</table>
		<%
	}
	%>
		
			<%
			if (dtos.getPay_type()==1){
				%><h3><%=dtos.getFinal_price() %>원 결제 하셨습니다.</h3>  <%
			}
			else if (dtos.getPay_type()==2){
				%><h3>배달이에게 <%=dtos.getFinal_price()%>원 결제 하세요. </h3> <%
			}
			
			%>





</body>
</html>