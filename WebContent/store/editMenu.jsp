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

/*예랑*/
boolean isOpen = sdao.isOpen(store_idx);
%>

<style>
h3{
	color:white;
}
</style>
<script>
function edit() {
	location.href = 'editFood.jsp';
}
function add() {
	location.href = 'addFood.jsp';
}
function selectnum() {
	window.alert(document.editMenu.food_num.value);
	
	bool = window.confirm('메뉴 순서를 바꾸시겠습니까');
	if(bool) {
		window.alert('바꾸겠습니다.');
	}
	
	window.alert(document.editMenu.food_num.value);


}
</script>
</head>

<body>
<%@include file="/header.jsp"%>
<div id="bodywrap">
<h3>메뉴수정하기</h3>
메뉴 수정을 하려면 해당 메뉴의 사진을 눌러주세요.
<input type = "button" value = "메뉴 추가하기" onclick = "add()">
   <article>
   <form name = "editMenu">
     
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
         for(int i=0; i<2; i++){
            if(count<arr.size()){%>
            <td><a onclick = "edit()"><img src="../img/store/<%=arr.get(count).getFood_name()%>.png" style="width:140px; height:120px;"/></a></td>
            <td style="background-color: #2F4038; color:white;"><%=arr.get(count).getFood_name() %>
            <br><%=arr.get(count).getFood_price() %>원 </td>
         
            <td>
            <!-- 예랑 --> 
            <input type="hidden" name="isOpen" value="<%=isOpen%>">
            <input type="hidden" name="c_sub_s" value="<%=c_sub_s %>">
            
               <select name="food_num2" onchange = "selectnum2()"><%
               for(int j=1; j <= fdao.maxfoodnum(store_idx); j++){%>
                  <option value="<%=j%>" 
                  <%
                  if(j==arr.get(count).getFood_num()) {
                	 %>selected<%
                  }
                  %> ><%=j %></option>
               <% } %>
               </select>
               
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
      </table> <br><br><br><br><br>
      </form>
    </article>
    </div>
    
<%@include file="/footer.jsp"%>
</body>
</html>