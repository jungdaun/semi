<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>



<%
int coupon_idx =Integer.parseInt(request.getParameter("coupon_idx")) ;

String msg = "";

int res = cdao.deleteCoupon(coupon_idx);
if (res>0){
	msg = "삭제완료";
	
}
else {
	msg = "error";
	
}

%>




<script>
window.alert ('<%=msg%>');
window.location.href = "couponList.jsp";


</script>


<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>