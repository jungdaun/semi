<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="semi.cart.*" %>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>
<%
String store_type=request.getParameter("store_type");
String store_idx_s = request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);
String str = request.getParameter("str");
String arr[] = str.split(" ");

for(int i=0; i<arr.length; i++){
   cdao.deleteData(arr[i]);
}

%>
<script>
   window.alert('선택하신 음식을 삭제하였습니다.');
   location.href='postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>';
</script>