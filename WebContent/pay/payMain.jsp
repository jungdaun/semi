<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<%@ page import="semi.cart.CartDTO" %>
<%@ page import="java.util.*" %>



<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>


<jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>


<%
String sIdxs = request.getParameter("sIdx");
int store_idx = Integer.parseInt(sIdxs);

String cIdxs = request.getParameter("cIdx");
int c_idx =Integer.parseInt(cIdxs);

String oIdxs =request.getParameter("oIdx");
int order_idx =Integer.parseInt(oIdxs);

int res =odao.addOrderIdx(store_idx, order_idx, c_idx);
//System.out.println (store_idx);
//System.out.println (c_idx);
//System.out.println (order_idx);
ArrayList <CartDTO> cartDtos = ctdao.myCartList(order_idx, store_idx);
//String sid = "고객1";

String userInfo [] = mdao.getUserInfo((String)session.getAttribute("sid"));
	


%>

<!DOCTYPE html>
<html>
<head>


	
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">


<title>Insert title here</title>




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
	text-align: center;

	/* border-bottom: 2px double white; */
}
fieldset table td{
text-align: center;
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

fieldset {
	text-align: left;
	margin-bottom: 20px ; 
}
#payMain{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
}

</style>

<script type="text/javascript">



function addOrder() {
	var add1 = document.pay.add1.value ; 
	var add2 = document.pay.add2.value ; 
	
	document.pay.c_addr.value = add1+" "+add2;
	pay.submit (); 
	
}

</script>


</head>

<body >
<%@include file="/header.jsp"%>
		<div id="bodywrap">
		<div id="payMain">

<!-- -------------------------------------------------------------- -->


<form name="pay" action="pay_ok.jsp" method="post">
<input type="hidden" name="order_idx" value="<%=order_idx%>">
<input type="hidden" name="store_idx" value="<%=store_idx%>">
<input type="hidden" name="mem_idx" value="<%=c_idx%>">


<h1>주문결제 페이지</h1>




 <div style="display: inline-block; text-align: center;">
<fieldset>
	<legend style="text-align: center;">
	
<h2>주문 내용</h2>
	</legend>
	
	
	<p><h4>[<input type="text"   name="sName" size="10" value="<%=ctdao.getStoreName(store_idx) %>">]에서 주문하신 내역은 다음과 같습니다.</h4></p>
	
	
	
	<table>
	<tr>
		<th colspan="2">메뉴</th>
		<th>수량</th>
		<th>가격</th>
		
		
	</tr>
	
	<%
	int tempPrice =0; 
	for ( int i=0; i< cartDtos.size(); i ++){
		%>
		<tr>
		<td colspan="2"><input type="text" name="menu" value="<%=cartDtos.get(i).getFood_name() %>" readonly="readonly"></td>
		<td><input type="text" name="count" value="<%=cartDtos.get(i).getFood_count()%>" readonly="readonly"> </td>
		<td><input type="text" name="menuPrice" value="<%=cartDtos.get(i).getTotal_price() %>" readonly="readonly">  </td>
		
		
	</tr>	
		
		<%
		tempPrice += cartDtos.get(i).getTotal_price();
		
		
	}
	
	if (tempPrice <odao.getMinPrice(store_idx)){
		
		
		String[] c_sub = odao.getStoreAddr(store_idx).split(" ");
		String c_sub_s = c_sub[2];

		%>
		
		<script>
		window.alert ('<%=odao.getMinPrice(store_idx)%>원 이상 주문하셔야 합니다.');
		
		window.location.href = '/semi/store/postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=odao.getStoreType(store_idx)%>&c_sub_s=<%=c_sub_s%>';
		
		</script>
		
		<%
	return ; 
	}
	
	%>
	
	
	


</table>
<p><h4>총 금액은 <input type="text" value="<%=tempPrice %>" name="price">원 입니다.</h4></p>

</fieldset>
</div>


<div style="display: inline-block; text-align: center;">
<fieldset>
	<legend style="text-align: center;">
	
<h2>할인 선택</h2>
	</legend>


<table class="coupon">


	<tr>
		<th>쿠폰</th>
		<td><input type="text" name="user_coupon" readonly="readonly" ><!--   -->

	<a href="" onclick="window.open ('selectCoupon.jsp?tp=<%=tempPrice%>&sType=<%=odao.getStoreType(store_idx)%>', 'selectCoupon', 'height=450, width=500')">쿠폰 선택</a>
		</td>
		
	</tr>

</table>

<p>
<h4><input type="text" name="discount" readonly="readonly">원 할인받으셨습니다.</h4>
</p>



</fieldset>
</div>

 <div style="display: inline-block; text-align: center;">
<fieldset>
	<legend style="text-align: center;">
<h2>배달 정보</h2>
	</legend>



<table class="del">	
	<tr>

		<th>이름</th>
		<td><input type="text" name="c_name" value="<%=userInfo[0] %>" > </td>
	
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td colspan="3">	
				
					<input type="text" name="c_tel" value="<%=userInfo [3]%>">
						
			</td>
</tr>
			<tr>
			
						
					<th>주소</th>
					
					<td colspan="3"><input type="text" value="<%=odao.getStoreAddr(store_idx) %>" name="add1" required="required" readonly="readonly">
					<input type="text" name="add2" required="required">
					<input type="hidden" name="c_addr" >
				
					</td>
					
					
			
			
			</tr>
			<!-- 			
	
	<tr>
	
	
		<th>전화번호</th>
		<td>
		
		 <input type="text" name="c_tel" value="">(ex. 01012345678)
		
		 </td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td colspan="3">
		
		<input type="text" name="c_addr" value=""> </td>
		
	</tr>


-->
	<tr>
		<th colspan="1">전달사항</th>
		<td colspan="3">
		<input type="text" name="memo">
		
	</td>
	</tr>
	
</table>
</fieldset>
</div>

 
 <div style="display: inline-block; text-align: center;">
<fieldset>
	<legend style="text-align: center;">
	
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





<h3><input type="button" onclick="addOrder()" value="주문하기"></h3>
</form>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>

</div>




</body>
</html>