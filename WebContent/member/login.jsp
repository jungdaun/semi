<%@page import="java.net.URLDecoder"%>
<%@page import="com.sun.xml.internal.fastinfoset.Decoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset li {
	list-style-type: none;
}
fieldset label {
	width: 90px; 
	float: Left;
}
fieldset p {
	text-align: right;
}
</style>
<script>

<%
Cookie cks[] = request.getCookies();
String saveid = "";

%>


function set() {
	<%
	if(cks.length>1) {
		for(int i = 0; i < cks.length; i++){
			if(cks[i].getName().equals("savetype")) {
				for(int j = 0; j < cks.length; j++){
					if(cks[j].getName().equals("saveid")) {
						%>
						document.login.userid.value = '<%=cks[j].getValue()%>';
						document.login.saveid.checked = true;
						<%
					}
				}
			}
		}
	}%>
}

<%
String title = "고객";
%>
	function findId() {
		window.open('findId.jsp', 'findId', 'width = 600, height = 200');
		
	}
	function findPwd() {
		window.open('findPwd.jsp', 'findPwd', 'width = 600, height = 200');
	}
	function a() {
		
		if(document.login.what.value=="고객") {
			document.login.userid.value = '';
			document.login.saveid.checked = false;
			document.login.whatsrc.src = "/semi/img/222.jpg"
				<%
				if(cks.length>1) {
					
					for(int i = 0; i < cks.length; i++){
						
						if(cks[i].getName().equals("savetype")) {
							
							
							for(int j = 0; j < cks.length; j++){
								if(cks[j].getName().equals("saveid")) {
									%>
									document.login.userid.value = '<%=cks[j].getValue()%>';
									document.login.saveid.checked = true;
									<%
								}
							}
						}
					}
				}
				%>
		}
		else if(document.login.what.value=="사장") {
			document.login.whatsrc.src = "/semi/img/111.jpg"
			document.login.userid.value = '';
			document.login.saveid.checked = false;
			<%
			if(cks.length>1) {
				
				for(int i = 0; i < cks.length; i++){
					
					if(cks[i].getName().equals("savectype")) {
						
						
						for(int j = 0; j < cks.length; j++){
							if(cks[j].getName().equals("savecid")) {
								%>document.login.userid.value = '<%=cks[j].getValue()%>';
								document.login.saveid.checked = true;
								<%
							}
						}
					}
				}
			}
			%>
		}
		
	}
</script>
</head>

<body onload = "set()">
	<form name="login" action="login_ok.jsp" method="post">
		<!-- 주소창에 비밀번호 안보이게 하려겅 -->
		<fieldset>
			<img name = "whatsrc" src = "/semi/img/222.jpg" height = "35px" width = "140px">
			<ul>
				<li><input type = "radio" name = "what" value = "고객" checked="checked" onchange = "a()">고객<input type = "radio" name = "what" value = "사장" onchange = "a()">사장</li>
				<li><input type="text" name="userid" placeholder="아이디" value = "<%=saveid%>">
				</li>
				<li><input type="password" name="userpwd" placeholder="비밀번호">
				</li>
			</ul>
			<input type="checkbox" name="saveid" value="on"> ID 기억하기
			<p><input type = "submit" value = "Login"></p>
			
			<input type = "button" value = "아이디 찾기" onclick = "findId()"> <input type = "button" value = "비밀번호 찾기" onclick = "findPwd()">
		</fieldset>



	</form>

</body>
</html>