<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<%@ page import="semi.cart.CartDTO" %>
<%@ page import="java.util.*" %>



<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>


<jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>


<%
int store_idx = 2;
int c_idx = 1;

int order_idx = 3; 


ArrayList <CartDTO> cartDtos = ctdao.myCartList(order_idx);


String sid = "고객1";



%>

<!DOCTYPE html>
<html>
<head>


	
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">


<title>Insert title here</title>

<script type="text/javascript">
	function couponPopup() {
		
		window.open('selectCoupon.jsp', 'select coupon', 'width=450, height=450');
		
		
	}

</script>



<style type="text/css">
 h2{
text-align: left
;

color: #E86274; 
}

h1{text-align: center; color: white;}
fieldset h4{text-align: center; color: white;}


fieldset table
{

background-color: rgba( 255, 255, 255, 0.2 )
}

	

table th {
	color: white;
	border-bottom: 2px double white;
}
input { 
color:white;
 
 background-color:transparent; 
 border: 0px; 
 text-align: center;
	
}

</style>


</head>

<body>
<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->


<form name="pay" action="pay_ok.jsp">
<input type="hidden" name="order_idx" value="<%=order_idx%>">
<input type="hidden" name="store_idx" value="<%=store_idx%>">
<input type="hidden" name="mem_idx" value="<%=c_idx%>">


<h1>주문결제 페이지</h1>





<fieldset>
	<legend>
	
<h2>주문 내용</h2>
	</legend>
	
	
	
	<ul style="list-style: none;">
	<li>

<h4>[<input type="text"    name="sName" size="10" value="<%=ctdao.getStoreName(store_idx) %>">]에서 주문하신 내역은 다음과 같습니다. </h4>
</li>	
	
<li>
<table>

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
	
		<td colspan="3" style="text-align: center;">총 구매금액은 <input type="text" value="<%=tempPrice %>" name="price">원 입니다. </td>
	</tr>

</table>
</li>

	</ul>

</fieldset>




<fieldset>
	<legend>
	
<h2>할인 수단</h2>
	</legend>


<table>


	<tr>
		<th>쿠폰</th>
		<td><input type="text" name="user_coupon" readonly="readonly" ><!--   -->

	<a href="" onclick="window.open ('selectCoupon.jsp?tp=<%=tempPrice%>', 'selectCoupon', 'height=450, width=450')">쿠폰 선택</a>
		</td>
		
	</tr>
	<tr>
		<td><input type="text" name="discount" readonly="readonly">원 할인 </td>
		<th colspan="1">최종결제금액</th>
		<td><input type="text" name="final_price" readonly="readonly" value="<%=tempPrice %>" >원</td>
	</tr>

</table>

</fieldset>

<fieldset>
	<legend>
	
<h2>결제방법</h2>
	</legend>

<table>
	<tr>
		
		<td><input type="radio" name="pay_type" value="1" checked="checked">바로결제</td>
		<td><input type="radio" name="pay_type" value="2">현장결제</td>
		<!-- 바로결제1 현장결제는2 -->
		
	</tr>
</table>


</fieldset>



<fieldset>
	<legend>
<h2>배달 정보</h2>
	</legend>



<table>	
	<tr>
	<%
	String userInfo [] = mdao.getUserInfo(sid);
	
	%>
		<th>이름</th>
		<td><input type="text" name="c_name" value="<%=userInfo[0] %>" > </td>
		<th>전화번호</th>
		<td><input type="text" name="c_tel" value="<%=userInfo[3]%>">(ex. 01012345678) </td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3"><input type="text" name="c_addr" value="<%=userInfo[2]%>"> </td>
		
	</tr>

	<tr>
		<th colspan="1">전달사항</th>
		<td colspan="3"><textarea rows="3" cols="20" name="memo">
		
		</textarea> </td>
	</tr>
	
</table>
</fieldset>




<input type="submit" value="주문하기">
</form>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>






</body>
</html>