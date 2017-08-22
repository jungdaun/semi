<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.*" %>
<%@ page import="semi.review.*" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO"/>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"/>
<jsp:setProperty property="*" name="rdto"/>

<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />


<%
//String c_name = (String) session.getAttribute("sname");
//Integer c_idx = (Integer) session.getAttribute("c_idx");

Integer c_idx = (Integer)1;
String c_name="송병훈";
String msg=null;
String savePath="C:/Users/JungDaun/git/semi/WebContent/store/img/review";
int store_idx=0;
String store_type="";
int size = 10*1024*1024;

try {
	MultipartRequest mr = new MultipartRequest(request, savePath, size, "utf-8");
	
	String review = mr.getParameter("contents");
	String r_pwd = mr.getParameter("pwd");
	String up_date = mr.getParameter("date");
	String score_num_s = mr.getParameter("score");
	int score_num = Integer.parseInt(score_num_s);
	String store_idx_s=mr.getParameter("store_idx");
	store_idx = Integer.parseInt(store_idx_s);
	store_type= mr.getParameter("store_type");
	String review_num_s = mr.getParameter("review_num");
//	int review_num = Integer.parseInt(review_num_s);
	
	
//	String cstore_s = (String) session.getAttribute("cstore");
//	String sid = (String) session.getAttribute("sid");
//	int cstore = Integer.parseInt(cstore_s);
	String aa = mr.getParameter("a");
	String bb[] = aa.split("\\\\");
	String path = "http://localhost:9090/semi/store/img/review/"+bb[2];

	int result = rdao.postReview(c_idx, c_name, store_idx, up_date, score_num, review, path, r_pwd);
//	System.out.println("result = "+result);
//	System.out.println("path = "+path);
	msg = (result>0)?"리뷰가 등록되었습니다.":"리뷰가 등록되지 않았습니다.";
	
} catch(Exception e) {
	%> 
	<script>
		window.alert("예상치 못한 오류가 발생했습니다.");
		window.self.close();
	</script>
	<%
}
%>
<script>
	location.href="postReview.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>";
</script>