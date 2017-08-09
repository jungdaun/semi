<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	height: 100%;
	min-height: 100%;
	width: 100%;
	
	text-align: center;
	margin: 0px auto;
	
	background-repeat: no-repeat;
	background-image: url("img/backgroundImg.jpg");
	background-size: 100%;
	}

#wrap {
	width: 100em;
	height: 100em;
	display: inline-block;
	margin: 0px auto;
	
	
	
}

#bodyList>ul {
	text-align: left;
	list-style: none;
	font-size: 25px;
	font-family: "배달의민족 도현";
	float: left;
	display: inline-block;
	margin-top: 70px;
	margin-right: 0px;
}

#bodyImg img {
	width: 200px;
	height: 200px;
	border: 3px solid white;
}

#bodyImg {
	float: left;
	margin-left: 50px;
	margin-top: 30px;
}
</style>
</head>
<body>
	<div id="wrap">
		<%@include file="header.jsp" %>
		<div id=bodywrap>
			<div id="bodyList">
				<ul>
					<li>공지사항</li>
					<br>
					<br>
					<li>쿠폰함</li>
					<br>
					<br>
					<li>고객센터</li>
				</ul>
			</div>
			<div id="bodyImg">
				<table>

					<tr>
						<td><a href="#"><img src="img/chicken.jpg"></a></td>
						<td><a href="#"><img src="img/jang.jpg"></a></td>
						<td><a href="#"><img src="img/pizza.jpg"></a></td>
						<td><a href="#"><img src="img/bunsik.jpg"></a></td>
					</tr>
					<tr>
						<td><a href="#"><img src="img/jokbal.jpg"></a></td>
						<td><a href="#"><img src="img/sushi.jpg"></a></td>
						<td><a href="#"><img src="img/dakbal.jpg"></a></td>
						<td><img src="img/do2.jpg"></td>
					</tr>


				</table>
			</div>
			
</body>
</html>