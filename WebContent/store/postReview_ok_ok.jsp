<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*" %>
<%@ page import="semi.review.*" %>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO"/>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"/>
<jsp:setProperty property="*" name="rdto"/>

<%
//String c_name = (String) session.getAttribute("sname");
//Integer c_idx = (Integer) session.getAttribute("c_idx");
String store_idx_s=request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);
String store_type= request.getParameter("store_type");

Integer c_idx = (Integer)2;
String c_name="kh";

String r_pwd = request.getParameter("pwd");
String score_num_s = request.getParameter("score");//별점
int score_num = Integer.parseInt(score_num_s);
String date_s = request.getParameter("date");//날짜
int date = Integer.parseInt(date_s);

String r_picture = request.getParameter("picture");//사진이름
String review = request.getParameter("contents"); //부분 가져오기

//review table 만들기
int result = rdao.postReview(c_idx, c_name, store_idx, date, score_num, review, r_picture, r_pwd);
String msg = (result>0)?"리뷰가 등록되었습니다.":"리뷰가 등록되지 않았습니다.";
%>
<script>
	window.alert(<%=msg%>);
	location.href="postReview.jsp?store_idx=<%=%>&store_type=<%=%>";
</script>