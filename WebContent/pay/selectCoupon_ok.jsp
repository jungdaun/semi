
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");

int tp = Integer.parseInt(request.getParameter("tp"));

System.out.println ("---");
System.out.println (tp);

int cIdx = Integer.parseInt(request.getParameter("cIdx"));
System.out.println (cIdx);

int dc =  cdao.getCouponValue(cIdx,tp);

System.out.println (dc);
%>

<script>
 opener.document.discount.totalPrice.value ='<%=dc%>';
 window.self.close(); 
</script>
