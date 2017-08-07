<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function showdong() {
		if (document.findAddress.gu.value == '노원구') {
			document.findAddress.dong.length = 1;
			document.findAddress.dong.options[1] = new Option("중계동", "중계동");
			document.findAddress.dong.options[2] = new Option("하계동", "하계동");

		} else if (document.findAddress.gu.value == '중랑구') {
			document.findAddress.dong.length = 1;
			document.findAddress.dong.options[1] = new Option("묵동", "묵동");
			document.findAddress.dong.options[2] = new Option("중화동", "중화동");
		} else {
			document.findAddress.dong.length = 1;
		}
	}
	
	function showgu() {
		if (document.findAddress.si.value == '서울시') {
			document.findAddress.gu.length = 1;
			document.findAddress.gu.options[1] = new Option("노원구", "노원구");
			document.findAddress.gu.options[2] = new Option("중랑구", "중랑구");

		} else {
			document.findAddress.gu.length = 1;
		}
	}
</script>

</head>
<body>
	<form name="findAddress" action="findAddress_ok.jsp">
		<fieldset>
			<legend>주소찾기</legend>
			<select name="si" onchange="showgu()">
				<option value="0">주소를 선택해주세요.</option>
				<option value="서울시">서울시</option>
			</select> 
			<select name="gu" onchange="showdong()">
				<option value="0">구를 선택해주세요.</option>
			</select> <select name="dong">
				<option value="0">동을 선택해주세요.</option>
			</select> <input type="submit" value="확인">
			
			<br>
			<label>상세주소</label><input type = "text" name = "address2" required="required">
		</fieldset>


	</form>

</body>
</html>