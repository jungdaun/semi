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
메뉴 수정을 하려면 해당 메뉴의 사진을 눌러주세요.
<input type = "button" value = "메뉴 추가하기">

   <article>
      <legend style="background-color: #2F4038; color: #FEEEA7; font-size:22px; font-weight: bold;">
        
         <table>
    
  <% 
         int count=0;
         while(count<arr.size()) {
    %>     <tr> <%
         for(int i=0; i<2; i++){
            if(count<arr.size()){%>
            <td><img src="../img/store/<%=arr.get(count).getFood_name()%>.png" style="width:140px; height:120px;"/></td>
            <td style="background-color: #2F4038; color:white;"><%=arr.get(count).getFood_name() %>
            <br><%=arr.get(count).getFood_price() %>원 </td>
         
            <td>
            <form name="postFood_ok" action="postFood_ok.jsp">
            <input type="hidden" name="c_sub_s" value="<%=c_sub_s %>">
            
               <select name="foodNum"><%
               for(int j=1; j<10; j++){%>
                  <option value="<%=j%>"><%=j %></option>
               <% } %>
               </select>
               
               <input type="hidden" name="store_type" value="<%=store_type%>">
               <input type="hidden" name="store_idx" value="<%=store_idx%>">
               <input type="hidden" name="food_price" value="<%=arr.get(count).getFood_price()%>">
               <input type="hidden" name="food_name" value="<%=arr.get(count).getFood_name()%>">

            </form>
            </td>  
         <% count++;}
         else
            break;
      } %></tr>
 <% }  %>
      </table> <br><br><br><br><br>
    </article>
  </div>
</div>
<%@include file="/footer.jsp"%>
</body>
</html>