<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="sdao" class="semi.store.StoreDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<script>
	function findAddress() {
		window.open('/semi/member/findAddress.jsp', 'findAddress', 'width = 800, height = 400');
	}
	
	function aa() {

		var open1 = document.join.ampm.value;
		var open2 = document.join.hour.value;
		var open3 = document.join.minute.value;
		
		var open = open1+open2+open3;
		
		document.join.open_time.value = open;
		
		var close1 = document.join.ampm2.value;
		var close2 = document.join.hour2.value;
		var close3 = document.join.minute2.value;
		
		var close = close1+close2+close3;
		
		var tel1 = document.join.tel1.value;
		var tel2 = document.join.tel2.value;
		var tel3 = document.join.tel3.value;
		
		document.join.store_phone.value = tel1+tel2+tel3;
		
		document.join.close_time.value = close;
		
		document.join.store_addr.value = document.join.address.value;
		document.join.store_addr2.value = document.join.address2.value;
		join.submit();
		

	}

	
</script>
<style>
#add_Store{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 50px;
	margin-left: 30px;
   margin-right: 30px;
}
th{
height: 25px;
font-size: 15px;
text-align: left;
border: 1px solid black;
background-color: #e4e4e4;
}

td{
text-align: left;
}
#aa{
text-align: center;
}
</style>
</head>    

<body>
<%@include file="/header.jsp"%>
<%
String cstore = (String) session.getAttribute("cstore");
%>
		<div id="bodywrap">
		<div id="add_Store">
			<h3 style="color: white;">가게 기본 정보 입력하기</h3>
			<div style="display: inline-block; text-align: center;">
			<form name = "join" action = "add_Store_ok.jsp">
			<table id="maintable" style="margin: 0px auto; background-color: white;">
           	

            <tr>
               <th>이름<input type = "hidden" value = <%=cstore%> name = "store_idx"></th>
               <td><input type="text" name="store_name" required="required" size="27"></td>
            </tr>
            
            <tr>
            	<th>음식 종류</th>
            	<td><select name="store_type">
                     <option value="chicken">치킨</option>
                     <option value="pizza">피자</option>
                     <option value="meat">족발/보쌈</option>
                     <option value="etc">야식</option>
                     <option value="bread">빵</option>
               </select></td>
            </tr>

            <tr>
               <th>전화번호</th>
               <td><select name="tel1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="017">017</option>
               </select> - <input type="text" name="tel2" size="4" maxlength="4" required="required"> -
                  <input type="text" name="tel3" size="4" maxlength="4" required="required">
                  <input type="hidden" name="store_phone">
                  </td>
            </tr>
            
            <tr>
            	<th>가게 오픈 시간</th>
            	<td>
            	<select name="ampm">
                     <option value="am">오전</option>
                     <option value="pm">오후</option>
               </select>
               <select name="hour">
                     <option value="01">1</option>
                     <option value="02">2</option>
                     <option value="03">3</option>
                     <option value="04">4</option>
                     <option value="05">5</option>
                     <option value="06">6</option>
                     <option value="07">7</option>
                     <option value="08">8</option>
                     <option value="09">9</option>
                     <option value="10">10</option>
                     <option value="11">11</option>
                     <option value="12">12</option>
               </select>
               <select name="minute">
                     <option value="00">00</option>
                     <option value="30">30</option>
               </select>
               <input type = "hidden" name = "open_time">
            	</td>
            </tr>
            
             <tr>
            	<th>가게 닫는 시간</th>
            	<td>
            	<select name="ampm2">
                     <option value="am">오전</option>
                     <option value="pm">오후</option>
               </select>
               <select name="hour2">
                     <option value="01">1</option>
                     <option value="02">2</option>
                     <option value="03">3</option>
                     <option value="04">4</option>
                     <option value="05">5</option>
                     <option value="06">6</option>
                     <option value="07">7</option>
                     <option value="08">8</option>
                     <option value="09">9</option>
                     <option value="10">10</option>
                     <option value="11">11</option>
                     <option value="12">12</option>
               </select>
               <select name="minute2">
                     <option value="00">00</option>
                     <option value="30">30</option>
               </select>
               <input type = "hidden" name = "close_time">
            	</td>
            </tr>

            <tr>
               <th>주소</th>
               <td><input type="text" name="address" size="27" readonly="readonly" onclick="findAddress()"></td>
               <td><input type="button" value="주소찾기" onclick="findAddress()">
               <input type = "hidden" name = "store_addr">
               </td>
            </tr>

            <tr>
               <th>상세주소</th>
               <td><input type="text" name="address2" size="27" readonly="readonly">
               <input type = "hidden" name = "store_addr2">
               </td>
            </tr>

            <tr>
               <td id="aa"align="center" colspan="3"><input type="button" onclick="javascript:aa()"value="가게등록">&nbsp&nbsp&nbsp&nbsp&nbsp<input
                  type="reset" value="다시작성"></td>
            </tr>
         </table>
			</div>
			</form>
		</div>
<%@include file="/footer.jsp"%>
</div>
</body>
</html>