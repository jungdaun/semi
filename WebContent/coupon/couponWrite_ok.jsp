<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="semi.coupon.CouponDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>


<%



int res = cdao.couponWrite(cdto);

String msg = "";
if (res>0){
	msg = "사장님~쿠폰이 등록되었어요 ^.^";
	
}
else {
	msg = "error";
	
}



%>
<script type="text/javascript">
window.alert ('<%=msg%>');
window.location.href='couponList.jsp';



<!--

//-->
</script>
<html>
<head>


</head>

<body>
<%=request.getParameter("coupon_name") %>
<%=request.getParameter("coupon_food_type") %>
<%=request.getParameter("coupon_type") %>
<%=request.getParameter("coupon_value") %>
<%=request.getParameter("coupon_end") %>
</body>
</html>