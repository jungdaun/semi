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
<style>
.rev {

  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #141414;
  text-align: left;
  line-height: 1.4em;
  font-size: 16px;
}
.rev * {
 -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;

}

.rev img{
	max-width: 100%;
  vertical-align: top;
}

.rev figcaption{
 position: absolute;
  top: calc(77%);
  width: 100%;
  background-color: #ffffff;
  padding: 15px 25px 65px;
}

.rev figcaption:before{
	position: absolute;
  content: '';
  z-index: 2;
  bottom: 100%;
  left: 0;
  width: 100%;
  height: 80px;
  background-image: -webkit-linear-gradient(top, transparent 0%, #ffffff 100%);
  background-image: linear-gradient(to bottom, transparent 0%, #ffffff 100%);
}

.rev h3 ,
.rev p{
margin: 0 0 10px;
}
.rev h3{
 font-weight: 300;
  font-size: 1.4em;
  line-height: 1.2em;
 
  text-transform: uppercase;
}

.rev p{
 font-size: 0.9em;
  letter-spacing: 1px;
  opacity: 0.9;
}

.rev a{
position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 2;
}
.rev:hover figcaption,
.rev.hover figcaption {
  top: 80px;
}


</style>

  
<%
//String c_name = (String) session.getAttribute("sname");
String store_idx_s=request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);
String store_type= request.getParameter("store_type");
String c_sub_s = request.getParameter("c_sub_s");

String c_name = "na";
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
   
   <figure class="rev">
   <%
//   String r_picture = 
   %>
   	<!--img src="../img/review/<%=store_idx%>_<%=c_name %>.png" /-->
   	<img src="../img/review/2na.png" />
   	<figcaption>
   		<h3><%=c_name%>님의 후기 | 평점 : <%= %></h3>
   		<p>나머지 후기들!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
   	</figcaption>
   	<a href="#"></a>
   </figure>
   <!-- 
   <figure class="rev hover">
   <%
//   String r_picture = 
   %>
   	<!--img src="../img/review/<%=store_idx%>_<%=c_name %>.png" />
   	<img src="../img/review/2na.png" />
   	<figcaption>
   		<h3>second</h3>
   		<p>나머지 후기들!!!!!</p>
   	</figcaption>
   	<a href="#"></a>
   </figure>
    -->
    
    
   </article>
   
   </div>

<%@include file="/footer.jsp"%>
</body>
</html>