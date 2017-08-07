<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2 {
	text-align: center;
}

fieldset {
	width: 450px;
	margin: 0px auto;
}

section li {
	list-style-type: none;
}

label {
	width: 130px;
	float: left;
}

section p {
	text-align: center;
}
</style>
<script>
	function openIdCheck() {
		window.open('idCheck.jsp', 'idCheck', 'width = 400, height = 200');
	}
	function findAddress() {
		window.open('findAddress.jsp', 'findAddress', 'width = 800, height = 400');
	}
	
	function aa() {

		var a = document.join.password.value;
		var b = document.join.pwd2.value;
		
		
		var tel1 = document.join.tel1.value;
		var tel2 = document.join.tel2.value;
		var tel3 = document.join.tel3.value;
		
		var email1= document.join.email1.value;
		var email2 = document.join.email2.value;


		if (a == b) {
			
			document.join.tel.value = tel1+tel2+tel3;
			document.join.email.value = email1 + "@" + email2;
			
			join.submit();
		} else {
			window.alert('鍮꾨�踰덊샇�� 鍮꾨�踰덊샇�솗�씤 媛믪씠 �떎由낅땲�떎.');
		}

	}
	
	function selectEmail() {
		
		if(document.join.email3.value!="0") {
			document.join.email2.value = document.join.email3.value;
			document.join.email2.readOnly = true;
		} else {
			document.join.email2.value = "";
			document.join.email2.readOnly = false;
		}
		
		
		
	}
	
</script>

</head>
<body>

	<section>
		<article>
			<h2>怨좉컼�쉶�썝媛��엯</h2>
			<form name="join" action="join_ok.jsp" method = "post">
				<fieldset>
					<legend>�쉶�썝 媛��엯 �젙蹂�</legend>
					<ul>
						<li><label>ID</label> <input type="text" name="id"
							readonly="readonly" onclick="openIdCheck()"> <input type="button" value="以묐났寃��궗"
							onclick="openIdCheck()"></li>


						<li><label>�씠由�</label> <input type="text" name="name" required="required">
						</li>

						<li><label>鍮꾨�踰덊샇</label> <input type="password" name="password" required="required"> <font size=1px;>�쁺臾� �닽�옄 議고빀</font>
						</li>

						<li><label>鍮꾨�踰덊샇�솗�씤</label> <input type="password" name="pwd2" required="required"> <font size=1px;>8~12�옄</font>
						</li>
						
						<li><label>�쟾�솕踰덊샇</label>
						<select name = "tel1">
							<option value = "010">010</option>
							<option value = "011">011</option>
							<option value = "017">017</option>
						</select> 
						-<input type="text" name="tel2" size = "4" required="required">-<input type="text" name="tel3" size = "4" required="required">
						<input type="hidden" name="tel">
						</li>

						<li><label>二쇱냼</label> <input type="text" name="address"
						readonly="readonly" onclick="findAddress()">
						<input type="button" value="二쇱냼李얘린" onclick="findAddress()"></li>
						
						<li><label>�긽�꽭二쇱냼</label><input type="text" name="address2" readonly="readonly"></li>
						
						<li><label>�씠硫붿씪</label> <input type="text" name="email1" required="required" size = "10">@</li>
						
						<li><label>&nbsp;&nbsp;&nbsp;</label>
						<input type = "text" name = "email2" required="required">
						<select name = "email3" onchange = "selectEmail()">
						
						<option value = "0">吏곸젒�엯�젰</option>
						<option value = "naver.com">�꽕�씠踰�</option>
						<option value = "daum.net">�떎�쓬</option>
						</select>
						<input type="hidden" name="email"></li>
						
						
						
						
						<li><label>2李⑤퉬諛�踰덊샇吏덈Ц</label>
						<select name = "ask">
							<option value = "�굹�쓽 泥� �궗�옉��?">�굹�쓽 泥� �궗�옉��?</option>
							<option value = "�굹�쓽 異쒖떊 珥덈벑�븰援먮뒗?">�굹�쓽 異쒖떊 珥덈벑�븰援먮뒗?</option>
							<option value = "�궡 蹂대Ъ 1�샇�뒗?">�궡 蹂대Ъ 1�샇�뒗?</option>
						</select></li>
						
						<li><label>2李⑤퉬諛�踰덊샇�떟蹂�</label> <input type="text" name="ans" required="required"></li>
					</ul>

					<p>
						<input type="button" onclick="javascript:aa()" value="�쉶�썝媛��엯">
						<input type="reset" value="�떎�떆�옉�꽦">
					</p>
				</fieldset>
			</form>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>