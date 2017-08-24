<%@page import="semi.coupon.CouponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdao" class="semi.coupon.CouponDAO" ></jsp:useBean>

<%

request.setCharacterEncoding("utf-8");

%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset=UTF-8">
<title>Insert title here</title>


<style>


a:visited {text-decoration: none; color: gray; }

	h2{
		text-align: center;
		color: white; 
		
	}
	table{
		width: 450px;
		border-top: 4px double white;
		border-bottom: 4px double white;
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
	}
	table  th{
		background: #BF0920;
		color: white; 
		text-align: center;

	}
	table td{
		text-align: center
		
		;
	}
	
	tfoot {
		border-top: 4px double #BF0920;
		
	
	}
	#couponList{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
	}
	
</style>

</head>
<body>

<%ArrayList<CouponDTO> dtos= cdao.couponList();  %>
<%

String admin = "admin"; 

%>
<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
<div id="couponList">
<h2>++쿠폰존++</h2>
<div style="display: inline-block; margin-right: -380px;">
<h3  style="color: white;">
<%if (sid.equals(admin)){
	%>
	<a href="couponWrite.jsp">쿠폰등록하기</a>
	<%
}

else {
	%>
	<a href="/semi/coupon/myCouponList.jsp" style="text-decoration: none">
나의쿠폰보기</a>
	<%
}
	%>
</h3>
</div>
		
	<table>
	
		<tr>
		
		<th>쿠폰이름 </th>
		<th>음식 종류</th>
		<th>할인액(률)</th>
		<th>유효기간</th>
		<th></th>

		
		
		</tr>
		
		<%
		if ( dtos.size()==0|| dtos==null){
			%>
			<tr>
				<td colspan="5" style="text-align: center;">등록된 쿠폰이 없습니다. </td>
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
							<td  ><a href="couponReceive.jsp?coupon_idx=<%=dtos.get(i).getCoupon_idx()%>">쿠폰받기</a></td>
					
						</tr>	
					<%
			}
		}
		
			
		
		%>
		
		
	</table>
	
	

<!-- -------------------------------------------------------------- -->
		
<%@include file="/footer.jsp"%>
</div>
</div>
		
</body>
</html>