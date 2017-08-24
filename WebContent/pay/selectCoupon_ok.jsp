
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="semi.coupon.CouponDAO"></jsp:useBean>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");

int tp = Integer.parseInt(request.getParameter("tp"));

//System.out.println ("---");
//System.out.println (tp);

int cIdx = Integer.parseInt(request.getParameter("cIdx"));
//System.out.println (cIdx);


if (cIdx == 0 ){
	%>
	
	<script>
 opener.document.pay.final_price.value ='<%=tp%>';
 opener.document.pay.user_coupon.value ='';
 opener.document.pay.discount.value ='';
 
 
 
 window.self.close(); 
</script>
	
	<%
	return ; 
}



int dc =  cdao.getCouponValue(cIdx,tp);
String cName = cdao.getCouponName(cIdx);



System.out.println (dc);
%>

<script>
 opener.document.pay.final_price.value ='<%=dc%>';
 opener.document.pay.user_coupon.value ='<%=cIdx%>';
 opener.document.pay.discount.value ='<%=(tp-dc)%>';
 
 
 
 window.self.close(); 
</script>
