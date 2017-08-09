<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<%@ page import="semi.cart.CartDTO" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>

<%
int store_idx = 14;
int c_idx = 2;

ArrayList <CartDTO> cartDtos = ctdao.showData(store_idx, c_idx);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>

<script type="text/javascript">
	function couponPopup() {
		
		window.open('selectCoupon.jsp', 'select coupon', 'width=450, height=450');
		
		
	}

</script>
</head>
<body>


<h3>buy & pay page</h3>

<h2>주문 내용</h2>
<table>
	<tr>
		<th>가게 이름</th>
		<td colspan="2">김피탕가게</td>
	</tr>

	<tr>
		<th>메뉴</th>
		<th>수량</th>
		<th>가격</th>
		
		
	</tr>
	
	<%
	int tempPrice =0; 
	for ( int i=0; i< cartDtos.size(); i ++){
		%>
		<tr>
		<td><input type="text" name="menu" value="<%=cartDtos.get(i).getFood_name() %>" readonly="readonly"></td>
		<td><input type="text" name="count" value="<%=cartDtos.get(i).getFood_count()%>" readonly="readonly"> </td>
		<td><input type="text" name="price" value="<%=cartDtos.get(i).getTotal_price() %>" readonly="readonly">  </td>
		
		
	</tr>	
		
		<%
		tempPrice += cartDtos.get(i).getTotal_price();
		
		
	}
	%>
	
	
	

	<tr>
		<td colspan="2">총 구매금액: </td>
		<td><%=tempPrice %></td>
	</tr>

</table>

<h2>할인 수단</h2>
<table>
<form name="discount">

	<tr>
		<th>쿠폰</th>
		<td><input type="text" name="coupon" readonly="readonly" >

	<a href="selectCoupon.jsp?tempPrice=<%=tempPrice%>">쿠폰 선택</a>
		</td>
		
	</tr>
	<tr>
		<td><input type="text" name="discount" readonly="readonly">원 할인 </td>
		<th colspan="1">최종결제금액</th>
		<td><input type="text" name="totalPrice" readonly="readonly" value="<%=tempPrice %>">원</td>
	</tr>
</form>
</table>




<h2>배달 정보</h2>
<table>	
	<tr>
		<th>이름</th>
		<td>김개똥</td>
		<th>전화번호</th>
		<td>010-1111-1111</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>강서구어쩌고</td>
		<th>주문 시간</th>
		<td>2017-08-09 10:50:45</td>
	</tr>

	<tr>
		<th colspan="1">전달사항</th>
		<td colspan="3"><textarea rows="3" cols="100">
		
		</textarea> </td>
	</tr>
	
</table>


</body>
</html>