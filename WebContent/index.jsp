<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">

</head>    

<body onload = "check()">
<%@include file="header.jsp"%>

<script>
function check() {
	var tt = '사장';
	var tt2 = '<%=stype%>';
	if(tt == tt2) {
		location.href = '/semi/index_ceo.jsp';
	}
}
</script>
		<div id="bodywrap">
			<div id="maintitle">
				<div id="maintitle1"><a href="/semi/notice/noticeList.jsp"><img src="img/notice.jpg" style="width:450px; height:200px;"></a></div>
				<div id="maintitle2">
					<div id="find"><br><br><input type="text" style="height:22px; margin-top:12px;"><input type="button" value = "  " style="background: url(/semi/img/1.jpg); width:35px; height:30px;"></div>
					<div id="coupon_board"><a href="/semi/coupon/couponList.jsp"><img src="img/coupon.jpg" style="width:350px; height:90px;"></a></div>
				</div>
			</div>
			<div id="mainbody">
				<div id="mainbody1"><a href="store/postStore.jsp?store_type=chicken"><img src="img/chicken.jpg" style="width:240px; height:200px;"></a></div>
				
				<div id="mainbody2"><img src="img/pizza.jpg" style="width:240px; height:200px;"></div>
				<div id="mainbody3"><img src="img/jokbal.jpg" style="width:240px; height:200px;"></div>
			</div>
			<div id="mainbottom">
				<div id="mainbottom1"><img src="img/dakbal.jpg" style="width:390px; height:195px;"></div>
				<div id="mainbottom2"><img src="img/bbang.jpg" style="width:390px; height:195px;"></div>
			</div>
		</div>
<%@include file="footer.jsp"%>
</body>
</html>