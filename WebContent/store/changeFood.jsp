<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
ArrayList<FoodDTO> arr = fdao.showStore1(store_idx);
ArrayList<FoodDTO> arr2 = fdao.showStore2(store_idx);
ArrayList<FoodDTO> arr3 = fdao.showStore3(store_idx);
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;

/*예랑*/
boolean isOpen = sdao.isOpen(store_idx);
%>

<style>
h3{
	color:white;
}
#editMenu{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
}
</style>
<script>
function add() {
	location.href = 'addFood.jsp';
}

function change() {
	location.href = 'changeFood.jsp';
}

<%
for(int i = 0; i < arr.size(); i++) {
%>
function fill<%=i%>() {
	window.alert('지금 선택한 것은');
	
	document.
	window.alert(<%=i%>);
}
<%
}
%>

</script>
</head>

<body>
<%@include file="/header.jsp"%>
<div id="bodywrap">
<div id="editMenu">
<h3>메뉴수정하기</h3>
메뉴 수정을 하려면 해당 메뉴의 사진을 눌러주세요.
<input type = "button" value = "메뉴 추가하기" onclick = "add()">
<input type = "button" value = "메뉴 순서바꾸기" onclick = "change()">
   <article>
 <div style="display: inline-block; text-align: center;">
   <form name = "editMenu">
     <h3>Main</h3>
         <table>
    
  <% if(arr.equals("") || arr.size()==0){%>
         <tr style="color:white; font-size: 30px;">
            <td rowspan="6" align="center" style="font-size:25px; color:white;">
        	<br><img src="../img/store/sad.png" style="width:250px; height:250px "/><br>
        	음식을 등록해주세요!
         </td>
         </tr>   
   <% }
   else{
         
         for(int i = 0; i < arr.size(); i++) {
        	 %>     <tr> <td>
        	 
        	  <input type = "text" name = "<%=i%>" onclick = "fill<%=i%>()" readonly value = "<%=i+1%>.<%=arr.get(i).getFood_name() %>">
        	  <input type = "text" name = "<%=i*10%>" readonly>
        	 </td>
        	 </tr>
        	 <%
        	 
         } } %>
         <tr><td>
         <input type = "button" value = "순서 변경하기">
        </td> </tr>
      </table> <br><br><br><br><br>
      
    
      </form>
      </div>
    </article>
    </div>
    
<%@include file="/footer.jsp"%>
</div>
</body>
</html>