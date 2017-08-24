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
<<<<<<< HEAD

//String store_type=request.getParameter("store_type");
//Integer c_idx = (Integer) session.getAttribute("c_idx");
//Integer c_idx = (Integer)2;





//int c_idx =mdao.getMemIdx((String)session.getAttribute("sid"));


String idx_s = request.getParameter("store_idx");
int store_idx = Integer.parseInt(idx_s);
String store_type =cdao.getStoreType(store_idx);

String c_sub_s =request.getParameter("c_sub_s");




String sid = (String)session.getAttribute("sid");


if (sid ==null || sid.equals("")){
	
	%>
	<script>
	window.alert ('로그인 하세요');
	window.location.href = 'postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>n&c_sub_s=<%=c_sub_s%>';
	
	
	</script>
	
	<%
	return ;
	
}

=======
String store_type=request.getParameter("store_type");
>>>>>>> branch 'master' of https://github.com/jungdaun/semi.git
Integer c_idx = Integer.parseInt((String)session.getAttribute("c_idx"));
int store_idx = Integer.parseInt(request.getParameter("store_idx"));
String c_sub_s = request.getParameter("c_sub_s");
String isOpen = request.getParameter("isOpen");

/*예랑 추가*/
if (isOpen.equals("false")){
	%>
	<script>
	window.alert ('영업 시간이 아닙니다. ');
	window.location.href = 'postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>n&c_sub_s=<%=c_sub_s%>';
	</script>	
	<%
	return ; 
}

int food_count = Integer.parseInt(request.getParameter("food_count")); //선택된 value값을 가져온다.
int food_price = Integer.parseInt(request.getParameter("food_price"));
String food_name = request.getParameter("food_name");
int total_price = food_count*food_price;

int num = cdao.insertData(store_idx, c_idx, food_name, food_price, food_count, total_price);
String msg = (num==-1)? "장바구니에 추가되지 않았습니다.": "장바구니에 목록이 추가되었습니다.";
%>
<script>
   window.alert('<%=msg%>');
   location.href='postFood.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>';
</script>



