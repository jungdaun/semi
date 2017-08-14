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
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset=UTF-8">
<title>Insert title here</title>


<style>
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
	
</style>

</head>
<body>

<%ArrayList<CouponDTO> dtos= cdao.couponList();  %>




<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
<h2>++쿠폰존++</h2>

<h3 align="right" style="color: white;"><a href="/semi/coupon/myCouponList.jsp">나의쿠폰보기</a>
		</h3>
	<table>
	
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
							<td  ><a href="couponReceive.jsp?coupon_idx=<%=dtos.get(i).getCoupon_idx()%>">쿠폰받기</a></td>
					
						</tr>	
					<%
			}
		}
		
			
		
		%>
		
		
	</table>
	
	

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>


		
</body>
</html>