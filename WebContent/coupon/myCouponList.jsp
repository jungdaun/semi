




<%@page import="semi.coupon.CouponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdao" class="semi.coupon.CouponDAO" ></jsp:useBean>




<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		text-align: center;
		color: white; 
		
	}
	table{
		width: 700px;
		border-top: 4px double white;
		border-bottom: 4px double white;
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
	}
	table thead th{
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
	#myCouponList{

		width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px; 	
	}
	
>>>>>>> refs/remotes/origin/master
</style>
</head>
<body>






<%@include file="/header.jsp"%>
		<div id="bodywrap">
		<div id="myCouponList">



<%

request.setCharacterEncoding("utf-8");

//String sid=(String) session.getAttribute("sid");
//String sid = "고객1";

//System.out.println (user_id);
if (sid ==null || sid.equals("")){
	
	%>
	<script>
	window.alert ('로그인 하세요');
	window.location.href ='couponList.jsp';
	
	
	</script>
	
	<%
	return ;
	
}

%>


<%




ArrayList<CouponDTO> dtos = cdao.myCouponList(sid);

%>



<!-- -------------------------------------------------------------- -->





	<h2>나의 쿠폰</h2>
	
	<table>
	<thead>
		<tr>
			<th>쿠폰번호</th>
			<th>쿠폰이름 </th> 
			<th>음식 종류</th>
			<th>할인액(률)</th>
			<th>사용기한</th>
			<th>사용 여부</th>
		</tr>
		</thead>

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
<!-- -------------------------------------------------------------- -->
		
<%@include file="/footer.jsp"%>
</div>
</div>



		
</body>
</html>