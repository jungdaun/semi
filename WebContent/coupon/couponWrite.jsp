<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    



<%
String admin = "admin";

String adminId = (String)session.getAttribute("sid");
if (adminId==null || adminId.equals("")){
	%>
	
	
	
    	
    	<script>
    	
    	window.alert('관리자만 접근할 수 있습니다.');
        location.href='/semi/coupon/couponList.jsp';
    	</script>
    	
    	<%
    	return; 

}
else if ( (!adminId.equals(admin))){
	%>
	
	
	    	<script>
    	
    	window.alert('관리자만 접근할 수 있습니다.');
        location.href='/semi/coupon/couponList.jsp';
    	</script>
    	
    	<%
    	return; 
	
	

}



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

		  

		
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
		
	}
	table th{
	
		  			border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		color: black; 
		text-align: center;
	}
	table td{
	
	
		text-align: left
		;
					border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		
		color: black; 
	
		;
	}

	
</style>
</head>
<body>



<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->

<h2>쿠폰 등록 페이지</h2> 

<form action="couponWrite_ok.jsp" name="couponWrite">
	<table>
		<tr>
			<th>쿠폰 이름</th>
			<td><input type="text" name="coupon_name" required="required"> </td>
		</tr>
		
		
		
		<tr>
			<th>음식 종류 </th>
			<td>
			
			<select name="coupon_food_type" >
			
				<option value="chicken">치킨</option>
				<option value="pizza">피자</option>
			
			</select>
			
			</td>
		</tr>
		
		<tr>
			<th>
			<select name="coupon_type" required="required">
			
				<option value="1">가격(1)</option>
				<option value="2">비율(2)</option>
			
			</select>
			</th>
			
			<td>
			
			<input type="number" name="coupon_value" required="required"> </td>
			
		</tr>
		
		<tr>
			<th>유효 기간</th>
			<td><input type="date" name="coupon_end" required="required" > </td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;"><input type="submit" value="확인"> </td>
		</tr>
	</table>


</form>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>





</body>
</html>