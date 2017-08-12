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

		<%
		
		
		
		ArrayList<CouponDTO> dtos= cdao.couponList(); 
		
		if ( dtos.size()==0|| dtos==null){
			%>
			no data 
			<%
		}
		
		else {
			
			for ( int i =0; i< dtos.size(); i ++){
				
				
				
				%>
				<table border="1" cellspacing ="0" style="border: 1px solid black; border-collapse: collapse; margin-bottom: 3px">
					
						<tr>
							<th>쿠폰번호</th>
							<td><%=dtos.get(i).getCoupon_idx() %></td>
							
						</tr>	
						<tr>
							<th>이름 </th> 
							<td><%=dtos.get(i).getCoupon_name() %></td> 
							
						</tr>	
						<tr>
							
							<th>음식 종류</th>
							<td><%=dtos.get(i).getCoupon_food_type() %></td>
							
						</tr>	
						<tr>
							
							<th>쿠폰 종류</th>
							<td><%=dtos.get(i).getCoupon_type() %></td>
							
							
						</tr>	
						<tr>
							<th>값</th>
							<td><%=dtos.get(i).getCoupon_value() %></td>
							
							
						</tr>	
						<tr>
							<th>유효기간</th>
							<td><%=dtos.get(i).getCoupon_end() %></td>
							
							
						</tr>
						
						<tr >
							<td colspan="2"><a href="couponReceive.jsp?coupon_idx=<%=dtos.get(i).getCoupon_idx()%>">쿠폰받기</a></td>
						</tr>
				
					
					
	
					
				</table>
			
		<%
			}
		}
		%>


</body>
</html>