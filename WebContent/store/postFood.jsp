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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">

</head>
<body>
<div id="wrap">
<%@include file="/header.jsp"%>



<section align="center">
<article>
<%
String store_idx_s=request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);
ArrayList<FoodDTO> arr = fdao.showStore(store_idx);
String store_type= request.getParameter("store_type");
%>
   <legend><h1><br><br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home >> <%=store_type %></h1><br></legend>
   <table>
<% 
if(arr.equals("") || arr.size()==0){%>
      <tr>
         <td colspan="3" align="center">
         현재 등록된 음식이 없습니다.
         음식을 등록해 주세요.
         </td>
      </tr>   
<% }
else{
   int count=0;
   while(count<arr.size()) {
   %>
      <tr><%
      for(int i=0; i<2; i++){
         if(count<arr.size()){%>
         <td><img src="../img/store/<%=arr.get(count).getFood_name()%>.png" style="width:200px; height:200px; border-top:1px solid black; border-bottom:1px solid black;border-left: 1px solid black;"/></td>
         <td><%=arr.get(count).getFood_name() %>
         <br><%=arr.get(count).getFood_price() %>원 </td>
         
         <td>
            <form name="postFood_ok" action="postFood_ok.jsp">
               <select name="food_count"><%
               for(int j=1; j<10; j++){%>
                  <option value="<%=j%>"><%=j %></option>
               <% } %>
               </select>
               
               <input type="hidden" name="store_type" value="<%=store_type%>">
               <input type="hidden" name="store_idx" value="<%=store_idx%>">
               <input type="hidden" name="food_price" value="<%=arr.get(count).getFood_price()%>">
               <input type="hidden" name="food_name" value="<%=arr.get(count).getFood_name()%>">
               <input type="submit" value="장바구니">
            </form>
         </td>
         
      <%count++;
      }
         else
            break;
      }
     %></tr>
<% }
   
}%>
   </table>
   <br><br><br><br><br>
</article>

<article>
<%
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;
System.out.println("c_idx = "+c_idx);
ArrayList<CartDTO> brr = cdao.showData(store_idx, c_idx);
%>
   <fieldset>장바구니</fieldset>
   <table>
      <%
      if(brr.size()==0 || brr==null){%>
      <tr>
         <td>주문 내역이 없습니다.</td>
      </tr>
      <% }
      else{
         %>
         <jsp:include page="cart.jsp?store_idx=<%=store_idx %>"/>
         <% 
      }
      %>
      </table>
</article>

</section>



<%@include file="/footer.jsp"%>
</div>
</body>
</html>