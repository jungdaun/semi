<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<%@ page import="semi.cart.CartDTO" %>
<%@ page import="java.util.*" %>



<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>


<jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>


<%





int store_idx = Integer.parseInt(request.getParameter("sIdx"));

int c_idx =Integer.parseInt(request.getParameter("cIdx"));
int order_idx =Integer.parseInt(request.getParameter("oIdx"));


int res =odao.addOrderIdx(store_idx, order_idx, c_idx);






ArrayList <CartDTO> cartDtos = ctdao.myCartList(order_idx);


//String sid = "고객1";



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


/*
fieldset table {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
}
fieldset table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
}
fieldset table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
*/
fieldset table
{
width: 600px ; 
 border-collapse:collapse;
background-color: rgba( 255, 255, 255, 0.2 )
}


fieldset table th {
	

	/*
	border-bottom: 2px dotted white;
border-left: 2px solid white;
border-right: 2px solid white;
border-top: 2px solid white;

*/
	
	color: white;
	background-color:  rgba( 255, 255, 255, 0.2 );
	
	/* border-bottom: 2px double white; */
}


fieldset table td{

	/*
border-bottom: 2px solid white;
border-left: 2px solid white;
border-right: 2px solid white;
border-top: 2px solid white;

*/
	
}

input { 
color:white;
 
 background-color:transparent; 
 border: 0px; 
 text-align: center;
	
}


.del table{
width: 550px; 

}

.del th {
	border-bottom: 1px dotted white;

}
.del td {
	border-bottom: 1px dotted white;
	text-align: left;

}

.del input {
	color:black;
 
 background-color:white; 
 border: 0px; 
 text-align: left ;
	
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
	
	
	<p><h4>[<input type="text"    name="sName" size="10" value="<%=ctdao.getStoreName(store_idx) %>">]에서 주문하신 내역은 다음과 같습니다.</h4></p>
	
	
	
	<table class="order">
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
	
	
	


</table>
<p><h4>총 금액은 <input type="text" value="<%=tempPrice %>" name="price">원 입니다.</h4></p>

</fieldset>






<fieldset>
	<legend>
<h2>배달 정보</h2>
	</legend>



<table class="del">	
	<tr>
	<%
	String userInfo [] = mdao.getUserInfo(sid);
	
	%>
		<th>이름</th>
		<td><input type="text" name="c_name" value="<%=userInfo[0] %>" > </td>
	
	</tr>
	
	<tr>
	
		<th>전화번호</th>
		<td><input type="text" name="c_tel" value="<%=userInfo[3]%>">(ex. 01012345678) </td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td colspan="3"><input type="text" name="c_addr" value="<%=userInfo[2]%>"> </td>
		
	</tr>

	<tr>
		<th colspan="1">전달사항</th>
		<td colspan="3">
		<input type="text" name="memo">
		
	</td>
	</tr>
	
</table>
</fieldset>



<fieldset>
	<legend>
	
<h2>할인 선택</h2>
	</legend>


<table class="coupon">


	<tr>
		<th>쿠폰</th>
		<td><input type="text" name="user_coupon" readonly="readonly" ><!--   -->

	<a href="" onclick="window.open ('selectCoupon.jsp?tp=<%=tempPrice%>', 'selectCoupon', 'height=450, width=450')">쿠폰 선택</a>
		</td>
		
	</tr>

</table>

<p>
<h4><input type="text" name="discount" readonly="readonly">원 할인받으셨습니다.</h4>
</p>



</fieldset>


<fieldset>
	<legend>
	
<h2>최종결제정보</h2>
	</legend>
	

<p>
	<h4><input type="radio" name="pay_type" value="1" checked="checked">바로결제

	
		<input type="radio" name="pay_type" value="2">현장결제</h4>
	
</p>

<p>
<h4>최종 결제금액은 <input type="text" name="final_price" readonly="readonly" value="<%=tempPrice %>" >원 입니다.</h4>
</p>



</fieldset>





<h3><input type="submit" value="주문하기"></h3>
</form>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>






</body>
</html>