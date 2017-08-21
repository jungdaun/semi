<!-- 변수 순서 바꾸면 안돼용... -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="semi.cart.*" %>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>

<%
String store_type=request.getParameter("store_type");
//Integer c_idx = (Integer) session.getAttribute("c_idx");
//Integer c_idx = (Integer)2;

Integer c_idx = Integer.parseInt((String)session.getAttribute("c_idx"));

//int c_idx =mdao.getMemIdx((String)session.getAttribute("sid"));

String idx_s = request.getParameter("store_idx");
int store_idx = Integer.parseInt(idx_s);

String c_sub_s = request.getParameter("c_sub_s");

String isOpen = request.getParameter("isOpen");
if (isOpen.equals("false")){
	%>
	
	<script>
	window.alert ('영업 시간이 아닙니다. ');
	window.location.href = 'postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>n&c_sub_s=<%=c_sub_s%>';
	
	</script>
	
	<%
	return ; 
}




String count_s = request.getParameter("food_count"); //선택된 value값을 가져온다.
String price_s = request.getParameter("food_price");

String food_name = request.getParameter("food_name");
int food_count = Integer.parseInt(count_s);
int food_price = Integer.parseInt(price_s);

int total_price = food_count*food_price;


/*예랑 추가*/





int num = cdao.insertData(store_idx, c_idx, food_name, food_price, food_count, total_price);
String msg = (num==-1)? "장바구니에 추가되지 않았습니다.": "장바구니에 목록이 추가되었습니다.";

	%>
	<script>
   window.alert('<%=msg%>');
   location.href='postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>';
	</script>



