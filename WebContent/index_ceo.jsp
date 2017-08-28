<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="sdao" class="semi.store.StoreDAO" scope="page" />
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
	function addstore() {
		location.href = "/semi/store/add_Store.jsp"
	}
	function image() {
		window.open('/semi/store/image.jsp', 'image', 'width=550, height=150');
	}
	function menumanager() {
		location.href = "/semi/store/editMenu.jsp"
	}
	
</script>
<style>
h2 {
	color: white;
}

#index_ceo {
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
}
</style>
</head>

<body>
	<%@include file="header.jsp"%>
	<div id="bodywrap">
	<div id="index_ceo">
		<%
			String my_idx = sdao.get_myIdx(sid);

			if (sdao.check_store(my_idx)) {
				wf.setUserid(sid);
				wf.userFolderExixts();
				wf.setCrpath(wf.getUserid());
		%><h2>사진업로드</h2>
		<input type="button" value="가게사진등록하기" onclick="image()"> <input
			type="button" value="메뉴수정하기" onclick="menumanager()">
			
			<input type="button" value="가게 시간 바꾸기" onclick="changeTime()">
		<%
			} else {
		%><h3>등록된 가게가 없습니다.</h3>
		<input type="button" value="등록하기" onclick="addstore()">
		<%
			}
		%>
	</div>
	<%@include file="footer.jsp"%>
	</div>
	<script>
	function changeTime() {
		location.href = "/semi/store/changeTime.jsp?idx=<%=my_idx%>"
	}
	</script>
</body>
</html>