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
thead th {
	background-color: #2F4038;
	color: #FEEEA7;
	font-size: 13px;
	width: 25%;
}

thead td {
	background-color: white;
	color: #FEEEA7;
	font-size: 15px;
	width: 25%
}

#postReview {
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
}

.rev {
	position: relative;
	float: left;
	overflow: hidden;
	margin: 10px 1%;
	width: 315px;
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

.rev img {
	width: 330px;
	height: 230px;
	vertical-align: top;
}

.rev figcaption {
	position: absolute;
	top: calc(77%);
	width: 100%;
	background-color: #ffffff;
	padding: 15px 25px 65px;
}

.rev figcaption:before {
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

.rev h3, .rev p {
	margin: 0 0 10px;
}

.rev h3 {
	font-weight: 300;
	font-size: 1.4em;
	line-height: 1.2em;
	text-transform: uppercase;
}

.rev p {
	font-size: 0.9em;
	letter-spacing: 1px;
	opacity: 0.9;
}

.rev a {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 2;
}

.rev:hover figcaption, .rev.hover figcaption {
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
   <div id="postReview">
   <article >
      <legend><h2 style="background-color: #2F4038; color: #FEEEA7;">
         Home >> <%=store_type %> >> <%=c_sub_s %></h2></legend>
         <div style="display: inline-block; text-align: center;">
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
</div>
   <h4><input type="button" name="post" value="글쓰기" onclick="post()" style="float: right;"></h4>
   
   <script>
   	function dele(obj){
   		var ref = window.confirm('소중한 리뷰를 정말로 삭제하시겠습니까?');
   		if(ref==true){
   			var num = document.getElementsByName(obj);
   			for(var i=0; i<num.length; i++){
   				if(num[i].checked==true){
   					window.alert('들어옴');
   					location.href="deleteReview_ok.jsp?i="+i+"&store_idx="+<%=store_idx%>;
   					break;
   				}
   			}
   		}
   		else{
   			window.alert('삭제를 취소했습니다.');
   		}
   	}
   	
   	function modi(obj){
   		location.href="postReview.jsp"
   		
   	}
   	</script>
   		<div style="display: inline-block; text-align: center;">
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
   					<h3 align="center"><%=arr.get(i).getC_name()%>님의 별은 
   					<%for(int j=0; j<arr.get(i).getScore_num(); j++){%>
   						★ <%} %> 입니다.</h3>
   					<p> <%=arr.get(i).getReview()%></p>
   				</figcaption>
   				<a href="#"></a>
    			</figure>
   			</td>
   		</tr>
   		
   		<tr >
   			<td>
   			<!-- form name="frm"-->
   				<input type="checkbox" name="chk[]" value="<%=i%>">
   				<input type="button" name="modi" value="게시물 수정" onclick="modi('chk[]')">
   				<input type="button" name="dele" value="게시물 삭제" onclick="dele('chk[]')">
   			<!-- /form--></td>
   		</tr>
  <% }	}  %>
   </table>
   </div>
   </article>   
   </div>
<%@include file="/footer.jsp"%>
</div>
</body>
</html>