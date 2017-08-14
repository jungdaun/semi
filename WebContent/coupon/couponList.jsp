<%@page import="semi.coupon.CouponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdao" class="semi.coupon.CouponDAO" ></jsp:useBean>

<%

request.setCharacterEncoding("utf-8");

//String user_id=(String) session.getAttribute("sid");
String user_id = "고객1";

//System.out.println (user_id);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%ArrayList<CouponDTO> dtos= cdao.couponList();  %>


	<table border="1">
		<tr>
		
		<th>쿠폰이름 </th>
		<th>음식 종류</th>
		<th>할인액(률)</th>
		<th>유효기간</th>
		

		
		
		</tr>
		
		<%
		if ( dtos.size()==0|| dtos==null){
			%>
			<tr>
				<td>등록된 쿠폰이 없습니다. </td>
			
			</tr>
			<%
		}
		
		else {
			
			for ( int i =0; i< dtos.size(); i ++){
				
				
				
				%>
					
						<tr>
							<td><%=dtos.get(i).getCoupon_name() %></td> 
							
							<td><%=dtos.get(i).getCoupon_food_type() %></td>
							
							<%if (dtos.get(i).getCoupon_type()==1){
								%>
								<td><%=dtos.get(i).getCoupon_value() %>원 </td>
								<%
								
							}
							else {
								%>
								<td><%=dtos.get(i).getCoupon_value() %>% </td>
								<%
								
							}
							
							
								%>
								
							<td><%=dtos.get(i).getCoupon_end() %></td>
							<th  ><a href="couponReceive.jsp?coupon_idx=<%=dtos.get(i).getCoupon_idx()%>">쿠폰받기</a></th>
					
						</tr>	
					<%
			}
		}
		
			
		
		%>
		
		
	</table>

		
</body>
</html>