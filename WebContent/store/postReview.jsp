<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="semi.review.*" %>
<%@ page import="java.util.ArrayList" %>
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
thead th{
   background-color:  #2F4038; color: #FEEEA7; font-size: 15px;
   width:25%;
}
thead td{
   background-color:  white; color: #FEEEA7; font-size: 15px;
   width:25%
}
.rev {

  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  width:315px;
 
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
	width:315px; height:230px;


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
  top: 100px;
}


</style>

  
<%
//String c_name = (String) session.getAttribute("sname");
//String store_idx_s=request.getParameter("store_idx");
//int store_idx = Integer.parseInt(store_idx_s);
int store_idx=21;
String store_type= request.getParameter("store_type");
String c_sub_s = request.getParameter("c_sub_s");

String c_name = "송병훈";

ArrayList<ReviewDTO> arr = rdao.show(store_idx);
%>
<!-- window.open("postReview_ok.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>", "글 쓰기", "width=490px, height=510px;"); -->
<script>
function post(){
   
   
   
   
   //넘겨줄 값 같이 넘겨주기
   location.href="postReview_ok.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>";
}
</script>

</head>
<body>

<%@include file="/header.jsp"%>
   <div id="bodywrap">
   <article >
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
   
   <table>
   <%
   if(arr.size()==0 || arr==null){%>
	   <tr>
	   		<td>
	   			후기가 존재하지 않습니다ㅜ_ㅜ
	   			후기를 남겨주세요^_^!
	   		</td>
	   </tr>
   <%}
   else{
	   for(int i=0; i<arr.size(); i++){
   %>
   		<tr>
   			<td>
   				<figure class="rev">
   				<img src=<%=arr.get(i).getR_picture()%> />
   				<figcaption>
   					<h3><%=arr.get(i).getC_name()%>님의 평점은 
   					<%for(int j=0; j<arr.get(i).getScore_num(); j++){%>
   						★ <%} %> 입니다.</h3>
   					<p> <%=arr.get(i).getReview()%></p>
   				</figcaption>
   				<a href="#"></a>
    			</figure>
   			</td>
   		</tr>
  <% }	}  %>
   </table>
   </article>   
   </div>
<%@include file="/footer.jsp"%>
</body>
</html>