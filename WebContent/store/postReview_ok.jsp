<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.io.*" %>
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
th{
   background-color:  #2F4038; color: #FEEEA7; font-size: 15px;
   width:25%;
}
thead td{
   font-weight:bolder;
   background-color:  white; color: black; font-size: 15px;
   width:25%
}
#postReview_ok{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 50px;
	margin-left: 30px;
   margin-right: 30px;
}
</style>
<script>
	function load(){
		document.post_review.f.value = document.post_review.upload.value;
		f.submit();	
	}
</script>
</head>
<%
String c_name = (String) session.getAttribute("sname");
int store_idx=	Integer.parseInt(request.getParameter("store_idx"));
String store_type= request.getParameter("store_type");
Integer c_idx = Integer.parseInt((String)session.getAttribute("c_idx"));

//Calendar cal = Calendar.getInstance(); ->이걸 받아서 string으로 다시
String date = "pm0930";
%>
<body>
<%@include file="/header.jsp" %>
<div id="bodywrap">
<div id="postReview_ok">
<div style="display: inline-block; text-align: center;">
	<form name="post_review" action="postReview_ok_ok.jsp" method="post" enctype="multipart/form-data">
	
    <table>
      <thead>
      <tr>
         <th>Name</th> <td><%= c_name%></td>
         <th>Password</th> <td><input type="password" value="4자리 숫자 입력" name="pwd"></td>
      </tr>
      <tr>
         <th>별점주기</th>
         <td><select name="score">
         <% for(int i=1; i<6; i++){%>
            <option value="<%=i%>"><%=i %></option>
         <%}	%>
         </select></td>
         <th>날짜</th> <td>자동으로 날짜 올리기</td>
      </tr></thead>
      
      <tbody>
      <tr>
         <th>사진 올리기  </th>
         <td colspan="3" style="background-color: white;">
         File:<input type="file" name="upload" onchange="load(this)">
         <input type="hidden" name="f">
         </td>
      </tr>
      <tr>
         <td colspan="4">
         <textarea rows="25%" cols="60%" name="contents"></textarea>
         </td>
      </tr>
      </tbody>
      
      <tfoot>
         <tr>
            <td colspan="4" align="right;"><input type="reset" value="다시 작성">
           <input type="submit" value="등록"></td>
         </tr>
      </tfoot>   
   </table>
   
   <input type="hidden" name="date" value="<%=date%>">
   <input type="hidden" name="store_type" value="<%=store_type%>">
   <input type="hidden" name="store_idx" value="<%=store_idx%>">
   </form>
   </div>
   </div>
   <%@include file="/footer.jsp" %>
   </div>
</body>
</html>