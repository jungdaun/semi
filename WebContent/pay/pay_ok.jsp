
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");%>
    
<jsp:useBean id="odto" class="semi.order.OrderDTO" /> 
<!-- 1회성 data 마트 카트같은거: scope=page -->

<jsp:setProperty property="*" name="odto"/>
<jsp:useBean id="odao" class="semi.order.OrderDAO" /> 

<!-- 실제 기능을 가지고있는거 /앞으로 계속 사용할거기때문에 scope = session  
 -->

<%
int result=odao.addOrder(odto);
int oIdx = Integer.parseInt(request.getParameter("order_idx"));

String add2 = request.getParameter("add2");
if (add2 == null || add2.equals("")){
   %>
   <script>

   window.alert ('주소를 입력하세요');
   location.href = 'javascript:history.back()';
   
   </script>
   
   <%
   return; 
   
}



//입력데이터 넘기기  
String msg=result>0?"주문완료":"실패";

if (result>0){
   int cartRes =odao.deleteCart(oIdx);
   
   %>
   
   <script type="text/javascript">

   window.alert ('주문완료');

   location.href='payCheck.jsp?oIdx=<%=oIdx%>';
<!--

//-->
</script>
   <%
   
}
else {
   %>
   
   <script type="text/javascript">

   window.alert ('실패');

   location.href='payMain.jsp';
<!--

//-->
</script>
   
   <%
   
}


%>