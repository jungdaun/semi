<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="semi.cart.*" %>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>

 
<%
String store_idx_s = request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);
Integer c_idx = (Integer) session.getAttribute("c_idx");

ArrayList<CartDTO> arr = cdao.showData(store_idx, c_idx);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section>
<article>

	<fieldset>
		<legend>장바구니</legend>
		<table>
		<%
		if(arr.size()==0 || arr==null){%>
		<tr>
			<td>주문 내역이 없습니다.</td>
		</tr>
		<% }
		else{%>
		<tr>
			<th></th>
			<!-- 어떤 스타일의 table을 만들지 생각하기 -->
		</tr>
			<% 
			for(int i=0; i<arr.size(); i++){
				%><tr>
				
				
			</tr><%
			}
		}
		%>
		</table>
	</fieldset>
</article>
</section>

</body>
</html>