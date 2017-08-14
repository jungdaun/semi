<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
* {
	margin: 0px;
	padding: 0px;
}

body p {
	text-align: right;
	font-size: 15px;
	margin-right: 100px;
	back
}

.menu-wrap {
	width: 2200px;
	margin: 0 auto;
}

.menu {
	float: left;
	text-align: center;
}

.menu li {
	display: inline-block;
	text-align: center;
	margin-left: 20px;
}
</style>

<%
	String sname = (String) session.getAttribute("sname");
	String sid = (String) session.getAttribute("sid");
	String stype = (String) session.getAttribute("stype");

	if (stype == null || stype.equals("")) {
		stype = "테스트";
	}
%>

<script>
	function openLogin() {
		window.open("/semi/member/login.jsp", "login", "width=440,height=330");
	}
	function usermod() {

		var whattype = '<%=stype%>';
		
		if(whattype=="고객") {
			location.href = '/semi/member/memberUpdate.jsp';
		} else {
			location.href = '/semi/member/ceoUpdate.jsp';
		}
		

	}
</script>
<body>

	<%
		if (sname == null || sname.equals("")) {
	%>
	<p>
		<a href="javascript:openLogin()">로그인</a> | <a
			href="/semi/member/joinselect.jsp">회원가입</a>
	</p>
	<%
		} else {
	%>
	<p><%=sname%>님 로그인중... | <a href="javascript:usermod()">회원정보수정</a>
		|<a href="/semi/member/logout.jsp">로그아웃</a>
	</p>
	<%
		}
	%>

	<div id="header">

		<div class="header_wrap">
			<div class="header_inner">

				<h1>
					<img src="/semi/img/badal.jpg">
				</h1>

				<ul class="badalList">
					<li><h2>
							<a href="/semi/notice/noticeList.jsp">공지사항</a>
						</h2></li>
					<li><h2>
							<a href="/semi/coupon/couponList.jsp">쿠폰함</a>
						</h2></li>
					<li><h2>
							<a href="#">고객센터</a>
						</h2></li>
				</ul>



			</div>
		</div>
	</div>

</body>