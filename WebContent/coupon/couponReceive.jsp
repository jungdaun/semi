<%@page import="semi.member.MemberDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="semi.coupon.CouponDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>

<%

String user_id = (String) session.getAttribute("sid");
int coupon_idx = Integer.parseInt(request.getParameter("coupon_idx"));
int mem_idx = mdao.getMemIdx(user_id);


boolean doesHave = cdao.doesHave(coupon_idx, mem_idx);

String msg = "";
if (!doesHave){
	int res =cdao.receiveCoupon(user_id,coupon_idx );
	if (res>0){
		msg ="쿠폰 받기 성공";
		
	}
	else {
		msg ="error";
		
	}
}
else {
	msg =  "이미 쿠폰을 받으셨습니다.";
	
	
	
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

<!-- 
<%=request.getParameter("coupon_name") %>
<%=request.getParameter("coupon_food_type") %>
<%=request.getParameter("coupon_type") %>
<%=request.getParameter("coupon_value") %>
<%=request.getParameter("coupon_end") %>

 -->
</body>
</html>