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
//ArrayList<FoodDTO> arr = fdao.showStore(store_idx);
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;

int foodnum = Integer.parseInt(request.getParameter("foodnum"));


FoodDTO dto = fdao.foodUpdate(fdto, store_idx, foodnum);


%>

<style>
h2{
	color:white;  
}
#editFood{
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

</style>
<script>
function show() {
	
	var ask = '<%=dto.getFood_type()%>';
	z = document.update.food_type.length;
	for(i = 0; i < z; i++) {
		if(document.update.food_type[i].value==ask) {
			document.update.food_type.options[i].selected = true;
		}
	}
}
function image() {
	window.open('/semi/store/foodimage.jsp?foodnum=<%=foodnum%>', 'image', 'width=550, height=150');
}
function update_ok() {
	update.submit();
}
</script>
</head>

<body onload = "show()">
<%@include file="/header.jsp"%>
<div id="bodywrap">
<div id="editFood">
<h2>메뉴수정하기</h2>

   <article>
   <div style="display: inline-block; margin-left: -60px;">
   <form name = "update" action = "editfood_ok.jsp">
     
        
         <table border="1">
         <tr>
		<th>
		음식 사진 
		</th>
		<td>
		 <img src="<%=dto.getFood_image()%>" style="width:110px; height:128px; margin-left: -30px;">
		</td>
		</tr>
		
		<tr>
		<td colspan = "2">
		<input type = "button" value = "이미지 수정하기" onclick = "image()" style="margin-left: 80px;">
		<input type = "hidden" name = "store_idx" value = "<%=store_idx%>">
		<input type = "hidden" name = "food_num" value = "<%=foodnum%>">
		</td>
		</tr>
		
		<tr>
		<th>
		음식 이름
		</th>
		<td>
		<input type = "text" name = "food_name" value = "<%=dto.getFood_name()%>">
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
		  <option value="etc">etc</option>
               </select>
		</td>
		</tr>
		
		<tr>
		<th>
		음식 가격
		</th>
		<td>
		<input type = "text" name = "food_price" value = "<%=dto.getFood_price()%>">
		</td>
		</tr>
		
		<tr>
		<td colspan = "2">
		<input type = "button" value = "수정하기" onclick = "update_ok()">
		<input type = "button" value = "삭제하기" onclick = "javascript:location.href='deletemenu.jsp?food_num=<%=foodnum%>&store_idx=<%=store_idx%>'">
		</td>
		</tr>
		
      </table> <br><br><br><br><br>
        </form>
        </div>
    </article>
  
  </div>
<%@include file="/footer.jsp"%>
</div>
</body>
</html>

