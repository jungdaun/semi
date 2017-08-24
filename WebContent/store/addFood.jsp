<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*" %>
<%@ page import="semi.food.*" %>
<%@ page import="semi.cart.*" %>
<jsp:useBean id="fdao" class="semi.food.FoodDAO"></jsp:useBean>
<jsp:useBean id="fdto" class="semi.food.FoodDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>

<jsp:useBean id="sdao" class="semi.store.StoreDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
//String store_idx_s=request.getParameter("store_idx");
//int store_idx = Integer.parseInt(store_idx_s);
String store_type= request.getParameter("store_type");
String c_sub_s = request.getParameter("c_sub_s");
String cstore = (String) session.getAttribute("cstore");
int istore = Integer.parseInt(cstore);
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;

%>

<style>
h3{
	color:white;
}
#addFood{
width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
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
</style>
<script>
function aa() {

	chk = 0;
	
	if(document.image.upload.value == null||document.image.upload.value == "") {
		chk = 1;
		window.alert('이미지를 등록해주세요.');
	}
	if(document.image.food_name.value == null||document.image.food_name.value == "") {
		chk = 1;
		window.alert('음식 이름을 입력해주세요.');
	}
	
	if(document.image.food_price.value == null||document.image.food_price.value == "") {
		chk = 1;
		window.alert('음식 가격을 입력해주세요.');
	}
	
	if(chk==0) {
		document.image.a.value = document.image.upload.value;
		window.alert(document.image.a.value);
		image.submit();
	}
	
	
}
</script>
</head>

<body>
<%@include file="/header.jsp"%>
<div id="bodywrap">
<div id="addFood">
 <div style="display: inline-block; text-align: center;">
<h3>메뉴수정하기</h3>

   <article>
   <form name="image" action="addFood_ok.jsp" method="post" enctype="multipart/form-data">
      
         <table border="1">
         <tr>
		<th>
		음식 사진 
		</th>
		<td style="color: white;">
		

	File:<input type="file" name="upload">
	
	<input type = "hidden" name = "a">
	<input type = "hidden" name = "store_idx" value = "<%=istore%>">

		
		</td>
		</tr>
		
		<tr>
		<th>
		음식 이름
		</th>
		<td>
		<input type = "text" name = "food_name">
		</td>
		</tr>
		
		<tr>
		<th>
		음식 타입
		</th>
		<td>
		  <select name="food_type">
		  <option value="main" selected>main</option>
		  <option value="side">side</option>
               </select>
		</td>
		</tr>
		
		<tr>
		<th>
		음식 가격
		</th>
		<td>
		<input type = "text" name = "food_price">
		</td>
		</tr>
		
		<tr>
		<td colspan = "2">
		<input type = "button" value="메뉴 등록하기" onclick = "aa()">
		</td>
		</tr>
      </table> <br><br><br><br><br>
      </form>
    </article>
  </div>
  </div>
<%@include file="/footer.jsp"%>
</div>
</body>
</html>