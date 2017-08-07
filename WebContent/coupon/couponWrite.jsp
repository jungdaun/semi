<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

쿠폰 등록 페이지 

<form action="couponWrite_ok.jsp" name="couponWrite">
	<table>
		<tr>
			<th>쿠폰 이름</th>
			<td><input type="text" name="coupon_name"> </td>
		</tr>
		
		
		
		<tr>
			<th>음식 종류 </th>
			<td>
			
			<select name="coupon_food_type" >
			
				<option value="치킨">치킨</option>
				<option value="피자">피자</option>
			
			</select>
			
			</td>
		</tr>
		
		<tr>
			<th>
			<select name="coupon_type" >
			
				<option value="1">가격(1)</option>
				<option value="2">비율(2)</option>
			
			</select>
			</th>
			
			<td>
			
			<input type="text" name="coupon_value"> </td>
			
		</tr>
		
		<tr>
			<th>유효 기간</th>
			<td><input type="date" name="coupon_end" > </td>
		</tr>
		<tr>
			<td ><input type="submit" value="확인"> </td>
		</tr>
	</table>


</form>


</body>
</html>