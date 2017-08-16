<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*" %>
<%@ page import="semi.food.*" %>
<%@ page import="semi.cart.*" %>
<jsp:useBean id="fdao" class="semi.food.FoodDAO"></jsp:useBean>
<jsp:useBean id="fdto" class="semi.food.FoodDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>

<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function post(){
	
	window.open("postReview_ok.jsp", "글 쓰기", "width=400px, height=400px;");
	
	
	//넘겨줄 값 같이 넘겨주기
	//location.href="postReview_ok.jsp"
}
</script>
</head>
<body>
	<h4><input type="button" name="post" value="글쓰기" onclick="post()"></h4>
<%


%>
	<table style="width:544px; backgroung-color:black;">
		<thead><tr>
			<th>ID</th>
			<th>평점</th>
			<th>Date</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr></thead>
		
		<tbody>
			<td colspan="3" style="color:black; background-color: white">
			<td>사진 있을 경우 사진 & 글</td>
		</tbody>
	</table>

</body>
</html>