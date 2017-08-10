<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<%@ page import="semi.cart.CartDTO" %>
<%@ page import="java.util.*" %>


<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>

<%
int store_idx = 1;
int c_idx = 1;

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
<form name="pay" method="get">
<input type="hidden" name="order_idx" value="1">
<input type="hidden" name="store_idx" value="<%=store_idx%>">
<input type="hidden" name="mem_idx" value="<%=c_idx%>">


<h3>buy & pay page</h3>

<h2>주문 내용</h2>
<table>
	<tr>
		<th>가게 이름</th>
		<td colspan="2"><input type="text" name="sName" value="<%=ctdao.getStoreName(store_idx) %>"> </td>
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
		<td><input type="text" name="menuPrice" value="<%=cartDtos.get(i).getTotal_price() %>" readonly="readonly">  </td>
		
		
	</tr>	
		
		<%
		tempPrice += cartDtos.get(i).getTotal_price();
		
		
	}
	%>
	
	
	


	<tr>
	
		<td colspan="2">총 구매금액: </td>
		<td><input type="text" value="<%=tempPrice %>" name="price"> </td>
	</tr>

</table>

<h2>할인 수단</h2>
<table>


	<tr>
		<th>쿠폰</th>
		<td><input type="text" name="coupon" readonly="readonly" >

	<a href="" onclick="window.open ('selectCoupon.jsp?tp=<%=tempPrice%>', 'selectCoupon', 'height=450, width=450')">쿠폰 선택</a>
		</td>
		
	</tr>
	<tr>
		<td><input type="text" name="discount" readonly="readonly">원 할인 </td>
		<th colspan="1">최종결제금액</th>
		<td><input type="text" name="final_price" readonly="readonly" >원</td>
	</tr>

</table>




<h2>배달 정보</h2>
<table>	
	<tr>
		<th>이름</th>
		<td><input type="text" name="cName" value="고객1" > </td>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="01012345678">(ex. 01012345678) </td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3"><input type="text" name="addr" value="서울"> </td>
		
	</tr>

	<tr>
		<th colspan="1">전달사항</th>
		<td colspan="3"><textarea rows="3" cols="100" name="memo">
		
		</textarea> </td>
	</tr>
	
</table>
<input type="button" value="주문하기" onclick="location.href='pay_ok.jsp'">
</form>
</body>
</html>