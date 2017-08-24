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
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;

/*예랑*/
boolean isOpen = sdao.isOpen(store_idx);
%>

<style>
h3{
	color:white;
}
</style>
<script>
function add() {
	location.href = 'addFood.jsp';
}
function show() {
	window.alert
}
</script>
</head>

<body onload = "show()">
<%@include file="/header.jsp"%>
<div id="bodywrap">
<h3>메뉴수정하기</h3>
메뉴 수정을 하려면 해당 메뉴의 사진을 눌러주세요.
<input type = "button" value = "메뉴 추가하기" onclick = "add()">
   <article>
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
         int count=0;
         while(count<arr.size()) {
    %>     <tr> <%
         for(int i=0; i<4; i++){
            if(count<arr.size()){%>
            <td><a onclick = "javascript:location.href = 'editFood.jsp?foodnum=<%=arr.get(count).getFood_num()%>';"><img src="<%=arr.get(count).getFood_image()%>" style="width:140px; height:120px;"/></a></td>
            <td style="background-color: #2F4038; color:white;"><%=arr.get(count).getFood_name() %>
            <br><%=arr.get(count).getFood_price() %>원 </td>
         
            <td>
            <!-- 예랑 --> 
            <input type="hidden" name="isOpen" value="<%=isOpen%>">
            <input type="hidden" name="c_sub_s" value="<%=c_sub_s %>">
               
               <input type="hidden" name="store_type" value="<%=store_type%>">
               <input type="hidden" name="store_idx" value="<%=store_idx%>">
               <input type="hidden" name="food_price" value="<%=arr.get(count).getFood_price()%>">
               <input type="hidden" name="food_name" value="<%=arr.get(count).getFood_name()%>">
		
            </td>  
         <% count++;}
         else
            break;
      } %></tr>
 <% } } %>
      </table> 
      
      <ol>
    <li>순서 있는 목록의 아이템 1</li>
    <li>순서 있는 목록의 아이템 2</li>
    <li>순서 있는 목록의 아이템 3</li>
	</ol>
      
      

      </form>
    </article>
    </div>
    
<%@include file="/footer.jsp"%>
</body>
</html>