<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table img{
width:350px;
height:300px;
}
table{
margin:0px auto;
border-collapse:separate;
border-spacing:10px;
}
table td{
text-align:center;
font-weight:bold;

}
.a{
margin: 0px auto;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>

	<section >
		<article>
		<div id="a">
		<table>
		
		<tr>
		
		<td><a href="store/postStore.jsp?store_type=chicken"><img src="img/chicken.jpg"></a></td>
		<td><a href="#"><img src="img/jang.jpg"></a></td>
		<td><a href="#"><img src="img/pizza.jpg"></a></td>
		<td><a href="#"><img src="img/bunsik.jpg"></a></td>
		</tr>
		
		<tr>
		
		<td><a href="#"><img src="img/jokbal.jpg"></a></td>
		<td><a href="#"><img src="img/sushi.jpg"></a></td>
		<td><a href="#"><img src="img/dakbal.jpg"></a></td>
		<td></td>
		</tr>
		
		
		</table>
		</div>
		
		
		
		</article>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>