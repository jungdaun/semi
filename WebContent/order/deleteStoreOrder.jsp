
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");%>
    

<jsp:useBean id="odao" class="semi.order.OrderDAO" /> 

<!-- 실제 기능을 가지고있는거 /앞으로 계속 사용할거기때문에 scope = session  
 -->

<%

int oIdx =Integer.parseInt(request.getParameter("oIdx")) ;

int result=odao.deleteOrder(oIdx);





//입력데이터 넘기기  
String msg=result>0?"주문이 취소되었습니다.":"주문 취소 실패";

%>

<script>
window.alert ('<%=msg%>');
location.href = 'myStoreOrderList.jsp';


</script>
