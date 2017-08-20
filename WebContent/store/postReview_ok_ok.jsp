<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*" %>
<%@ page import="semi.review.*" %>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO"/>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"/>
<jsp:setProperty property="*" name="rdto"/>

<%@ page import="com.oreilly.servlet.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />


<%
//String c_name = (String) session.getAttribute("sname");
//Integer c_idx = (Integer) session.getAttribute("c_idx");
//String store_idx_s=request.getParameter("store_idx");
//int store_idx = Integer.parseInt(store_idx_s);
String store_type= request.getParameter("store_type");

int store_idx=21;
Integer c_idx = (Integer)1;
String c_name="송병훈";

String r_pwd = request.getParameter("pwd");
String score_num_s = request.getParameter("score");//별점
int score_num = Integer.parseInt(score_num_s);
String up_date = request.getParameter("date");//날짜
String review = request.getParameter("contents"); //부분 가져오기



//String r_picture = request.getParameter("a");//사진이름
String msg=null;
System.out.println("1111111111111");
String savePath=wf.USERS_HOME + "/" + wf.getCrpath();
try {
	System.out.println("2222222222222222");
	MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");
	String cstore_s = (String) session.getAttribute("cstore");
	String sid = (String) session.getAttribute("sid");
	int cstore = Integer.parseInt(cstore_s);
	String aa = mr.getParameter("a");
	String bb[] = aa.split("\\\\");
	String path = "http://localhost:9090/semi/store/img/upload/" + sid + "/" + bb[2];
	
	
	
	
	
	
	
	
	
	wf.setImage(path, cstore);
	System.out.println("33333333333");
	int result = rdao.postReview(c_idx, c_name, store_idx, up_date, score_num, review, aa, r_pwd);
	System.out.println("result = "+result);
	msg = (result>0)?"리뷰가 등록되었습니다.":"리뷰가 등록되지 않았습니다.";
	
} catch(Exception e) {

}

//review table 만들기

%>

<script>
	window.alert(<%=msg%>);
	location.href="postReview.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>";
</script>