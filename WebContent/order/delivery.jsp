
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<jsp:useBean id="odao" class="semi.order.OrderDAO" scope="session"></jsp:useBean>


<% 
request.setCharacterEncoding("utf-8");

String o_idx_s = request.getParameter("o_idx");
int o_idx = Integer.parseInt(o_idx_s);
String s_idx = request.getParameter("s_idx");




int res = odao.orderDelivery(o_idx);

String msg = "";
if (res>0){
	msg="배달완료.";
	
}

else {
	msg = "error";
	
}




%>


<script type="text/javascript">

window.alert ('<%=msg%>');
window.location.href ='orderList.jsp?s_idx=<%=s_idx%>';


</script>