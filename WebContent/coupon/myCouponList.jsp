




<%@page import="semi.coupon.CouponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdao" class="semi.coupon.CouponDAO" ></jsp:useBean>

<%

request.setCharacterEncoding("utf-8");

//String user_id=(String) session.getAttribute("sid");
String sid = "고객1";

//System.out.println (user_id);

ArrayList<CouponDTO> dtos = cdao.myCouponList(sid);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>나의 쿠폰</h2>
	
	<table>
		<tr>
			<th>쿠폰번호</th>
			<th>쿠폰이름 </th> 
			<th>음식 종류</th>
			<th>할인액(률)</th>
			<th>사용기한</th>
			<th>사용 여부</th>
		</tr>

	<%
	if(dtos.size()==0|| dtos==null){
		%><tr>
			<td colspan="6">쿠폰이 없습니다.</td>
			
		</tr>
		<tr>
		
		<td colspan="6">쿠폰 받으러 가기 => <a href="/semi/coupon/couponList.jsp">click!</a></td>
		</tr>
		<%
	}
	else {
		for ( int i =0 ; i< dtos.size(); i ++){
			%>
			<tr>
				<td><%=dtos.get(i).getCoupon_idx() %> </td>
				<td><%=dtos.get(i).getCoupon_name() %> </td>
				<td><%=dtos.get(i).getCoupon_food_type() %> </td>
				
				<%
				if (dtos.get(i).getCoupon_type()==1){
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
				
				<td><%=dtos.get(i).getCoupon_end()%> </td>
				
				<%
				if (dtos.get(i).getIs_used()==1){
					%>
					
					<td>사용불가</td>
					<%
				}
				else {
					%>
					<td>사용가능</td>
					<%
				}
				%>
				
			</tr>
			<%
		}
		
	}
	%>
	</table>
		
</body>
</html>