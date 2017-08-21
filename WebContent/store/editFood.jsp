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
String cstore = (String) session.getAttribute("cstore");
int store_idx = Integer.parseInt(cstore);
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
      <legend style="background-color: #2F4038; color: #FEEEA7; font-size:22px; font-weight: bold;"/>
        
         <table>
         <tr>
		<th>
		음식 사진 
		</th>
		<td>
		 <img src="../img/store/dd.png" style="width:110px; height:128px"/>
		</td>
		</tr>
		
		<tr>
		<th>
		음식 이름
		</th>
		<td>
		chicken
		</td>
		</tr>
		
		<tr>
		<th>
		음식 타입
		</th>
		<td>
		  <select name="food_type">
		  <option value="main">main</option>
		  <option value="side">side</option>
               </select>
		</td>
		</tr>
		
		<tr>
		<th>
		음식 가격
		</th>
		<td>
		17000
		</td>
		</tr>
		
		
      </table> <br><br><br><br><br>
      </legend>
    </article>
  </div>
<%@include file="/footer.jsp"%>
</body>
</html>

