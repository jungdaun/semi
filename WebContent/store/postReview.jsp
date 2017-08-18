<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="semi.review.*" %>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO"/>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"/>
<jsp:setProperty property="*" name="rdto"/>

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
%>
<style>
thead th{
   background-color:  #2F4038; color: #FEEEA7; font-size: 15px;
   width:25%;
}
thead td{
   background-color:  white; color: #FEEEA7; font-size: 15px;
   width:25%
}
</style>
<script>
function post(){
   
   window.open("postReview_ok.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>", "글 쓰기", "width=410px, height=400px;");
   
   
   //넘겨줄 값 같이 넘겨주기
   //location.href="postReview_ok.jsp"
}
</script>

</head>
<body>

<%@include file="/header.jsp"%>
   <div id="bodywrap">
   <article>
      <legend><h2 style="background-color: #2F4038; color: #FEEEA7;">
         Home >> <%=store_type %> >> <%=c_sub_s %></h2></legend>
         <table>
            <tr style="background-color: white">
               <td rowspan="3" align="center" style="color:white; width:272px;">
               <!-- form name="menu" method="post"-->
                  <!-- input type="hidden" name="menu" value="postMenu"-->
                  <a href="postFood.jsp?store_idx=<%=store_idx %>&store_type=<%=store_type %>">
                  <img src="../img/store/cart.png" style="width:60px; height:50px"/>
               </a></td>
               
               <td rowspan="3" align="center" style="color:white; width:272px;">
               <!-- form name="re" method="post"-->
                  <!-- input type="hidden" name="review" value="postReview"-->
                  <a href="postReview.jsp?store_idx=<%=store_idx %>&store_type=<%=store_type %>">
                  <img src="../img/store/review_one.png" style="width:60px; height:50px"/>
               </a></td>
            </tr>
         </table>

   <h4><input type="button" name="post" value="글쓰기" onclick="post()" style="float: right;"></h4>

   <!-- table border="1" width="450" cellspacing="0" align="center">
      <thead>
      <tr>
         <th>ID</th><td></td>
         <th>평점</th><td></td>
      </tr>
      <tr>
         <th>Date</th><td colspan="3"></td>  
      </tr>
      </thead>
      
      <tbody>
      <tr>
         <td colspan="3" style="color:black; background-color: white; word-break:break-all;">
         &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
         </td>
         <td>사진 있을 경우 사진</td></tr>
      </tbody>
      
   </table-->
   
   <figure class="rev">
   <%
   String r_picture = 
   %>
   	<img>
   </figure>
   
   </article>
   
   </div>

<%@include file="/footer.jsp"%>
</body>
</html>