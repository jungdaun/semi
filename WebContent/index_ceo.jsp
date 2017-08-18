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

</script>
</head>    

<body>
<%@include file="header.jsp"%>
		<div id="bodywrap">
			<%
			String my_idx = sdao.get_myIdx(sid);
			
			if(sdao.check_store(my_idx)) {
				wf.setUserid(sid);
				wf.userFolderExixts();
				wf.setCrpath(wf.getUserid());
				%><h3>사진업로드</h3>
				<input type = "button" value = "사진등록하기" onclick = "image()"><%
			} else {
				%><h3>등록된 가게가 없습니다.</h3>
				<input type = "button" value = "등록하기" onclick = "addstore()"><%
			}
			%>
		</div>
<%@include file="footer.jsp"%>
</body>
</html>