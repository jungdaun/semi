<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"/>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"/>
<jsp:setProperty property="*" name="cdto"/>
<%
request.setCharacterEncoding("utf-8");
String store_type=request.getParameter("store_type");
Integer c_idx = Integer.parseInt((String)session.getAttribute("c_idx"));
int count = Integer.parseInt(request.getParameter("count"));
int store_idx = Integer.parseInt(request.getParameter("store_idx"));
int price = Integer.parseInt(request.getParameter("price"));
String name = request.getParameter("food_name");

int cnt = cdao.changeData(store_idx, c_idx, count, price, name);
String msg = (cnt>0) ? "장바구니가 수정되었습니다.":"오류가 발생했습니다.";
%>
<script>
   window.alert('<%=msg%>');
   location.href='postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>';
</script>