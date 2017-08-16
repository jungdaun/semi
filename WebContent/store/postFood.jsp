<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*" %>
<%@ page import="semi.food.*" %>
<%@ page import="semi.cart.*" %>
<%@ page import="semi.store.*" %>
<jsp:useBean id="fdao" class="semi.food.FoodDAO"></jsp:useBean>
<jsp:useBean id="fdto" class="semi.food.FoodDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>

<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>

<jsp:useBean id="sdao" class="semi.store.StoreDAO"></jsp:useBean>
<jsp:useBean id="sdto" class="semi.store.StoreDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
String store_idx_s=request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);
String store_type= request.getParameter("store_type");
String c_sub_s = request.getParameter("c_sub_s");
ArrayList<FoodDTO> arr = fdao.showStore(store_idx);
//int c=1;
String str = "a";
//session.setAttribute("value", "a");
%>
<script>
//function chan(){
	<%
	//c=2;
//	session.removeAttribute("value");
//	session.setAttribute("value", "b");
//	System.out.println("현재는? "+session.getAttribute("value"));
	%>
	//document.getElementById("re").reload();
	//history.go(0);
//	location.href="#re";
//}
//function chan2(){
	<%
	//c=1;
//	session.removeAttribute("value");
//	session.setAttribute("value", "a");
//	System.out.println("현재는? "+session.getAttribute("value"));
	%>
	//document.getElementById("re").reload();
	//history.go(0);
//	location.href="#re";
//}

    function chan(str){
   	 var str_s = str;
   	 System.out.println("str = "+str_s);
   	 location.href="#re";
   	 
    }

</script>

</head>
<body>

<%@include file="/header.jsp"%>
   <div id="bodywrap">
   <article>
      <legend><h2 style="background-color:  #2F4038; color: #FEEEA7;">
         Home >> <%=store_type %> >> <%=c_sub_s %></h2></legend>
         <table>
            <tr style="background-color: white">
               <td rowspan="3" align="center" style="color:white; width:272px;"><a href="#" onclick="chan(b)">
               <img src="../img/store/cart.png" style="width:60px; height:50px" /></a></td>
               
               <td rowspan="3" align="center" style="color:white; width:272px;"><a href="#" onclick="chan(<%='a'%>)">
               <img src="../img/store/review_one.png" style="width:60px; height:50px" /></a></td>
            </tr>
         </table>
         <a id="re">
         
          <%
         // String str = (String)session.getAttribute("value");
          
          System.out.println("재입장?");
          if(str.equals("a")) {
          System.out.println("a");
          %>
         	<%@include file="postMenu.jsp" %>
         	<%}
          else if(str.equals("b")){
          System.out.println("b");%>
        	 <%@include file="postReview.jsp" %> 
         <%}%>
  
     </a><br><br><br><br><br>
    </article>

    <article>
   <%
   //Integer c_idx = (Integer) session.getAttribute("c_idx");
   Integer c_idx = (Integer)2;
   ArrayList<CartDTO> brr = cdao.showData(store_idx, c_idx);   
   %>
         <fieldset style="background-color: #BF0920; color: white; font-size: 30px; line-height: 40%;">장바구니</fieldset>
         <table>
         <%
         if(brr.size()==0 || brr==null){%>
            <tr>
            <td>주문 내역이 없습니다.</td>
            </tr>
         <% }
         else{
            %>
            <jsp:include page="cart.jsp?store_idx=<%=store_idx %>&store_type=<%=store_type %>"/>
         <% }
         %>
         </table>
   </article>

</div>


<%@include file="/footer.jsp"%>
</body>
</html>