



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
int store_idx=21;
String store_type= request.getParameter("store_type");
String c_sub_s = request.getParameter("c_sub_s");
ArrayList<FoodDTO> arr = fdao.showStore(store_idx);
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;

%>

<style>
h3{
	color:white;
}
</style>
</head>

<body>
<%@include file="/header.jsp"%>
<div id="bodywrap">
<h3>메뉴수정하기</h3>

   <article>
   <form name="image" action="foodimage_ok.jsp" method="post" enctype="multipart/form-data">
      <legend style="background-color: #2F4038; color: #FEEEA7; font-size:22px; font-weight: bold;"/>
        
         <table>
         <tr>
		<th>
		음식 사진 
		</th>
		<td>
		
<fieldset>
	<legend>파일 선택하기</legend>
	File:<input type="file" name="upload">
	
	<input type = "hidden" name = "a">
	
</fieldset>

		
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
      </legend>
      </form>
    </article>
  </div>
<%@include file="/footer.jsp"%>
</body>
</html>