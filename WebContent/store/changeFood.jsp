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
#changeFood{
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

<%for(int i = 0; i < arr.size(); i++) {
	
	String i_s = Integer.toString(i);
	
	%>
function fill<%=i%>() {
	
	var a  = document.editMenu2.a<%=i_s%>.value;
	
	if(a==null||a=="") {
		window.alert('이미 선택된 메뉴입니다.');
	}else {
		<%
		for(int j = 0; j < arr.size(); j++) {
		String i_s2 = Integer.toString(j+100);
		
		%>
			if(document.editMenu2.a<%=i_s2%>.value==null || document.editMenu2.a<%=i_s2%>.value == "") {
				document.editMenu2.a<%=i_s2%>.value = a;
				document.editMenu2.a<%=i_s%>.value = "";
				a = "";
				
			}
			
			<%
		}
			%>
	}
	
	
	
}
<%} %>
</script>
</head>

<body>
<%@include file="/header.jsp"%>
<form name = "editMenu2" action = "changeFood_ok.jsp">
<div id="bodywrap">
<div id="changeFood">
<h3>메뉴수정하기</h3>
메뉴 수정을 하려면 해당 메뉴의 사진을 눌러주세요.
<input type = "button" value = "메뉴 추가하기" onclick = "add()">
<input type = "button" value = "메뉴 순서바꾸기" onclick = "change()">
   <article>
     <h3>Main</h3>
     <div>
         <table style="display: inline-block; text-align: center;"> 
    
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
        	  <input type = "text" id = "a<%=i%>"  onclick = "fill<%=i%>()" readonly value = "<%=arr.get(i).getFood_name() %>">
        	  <input type = "text" id = "a<%=i+100%>" readonly value = "" name = "bb">
        	  <input type = "hidden" name = "aa" value = <%=arr.get(i).getFood_num() %>>
        	 </td>
        	 </tr>
        	 <% }
         
 
         
         %><tr><td>
         <input type = "button" value = "순서 변경하기" onclick = "setmenu()">
         <input type = "reset" value = "리셋하기">
        </td> </tr> <%
   } %>
         
      </table> <br><br><br><br><br>
      </div>
    
      
      
    </article>
    
    
    </form>
     
    <script>
    	function setmenu() {
    		editMenu2.submit();
    	}
    </script>
    </div>
<%@include file="/footer.jsp"%>
</div>
</body>
</html>