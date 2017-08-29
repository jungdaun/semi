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

<%
String c_name = (String) session.getAttribute("sname");
Integer c_idx = Integer.parseInt((String)session.getAttribute("c_idx"));
String msg=null;
String savePath="C:/Users/song/git/semi/WebContent/img/review";
int store_idx=0;
String store_type=null;
int size = 10*1024*1024;
String c_sub_s=null;

try {
	MultipartRequest mr = new MultipartRequest(request, savePath, size, "utf-8");
	
	String review = mr.getParameter("contents");
	String r_pwd = mr.getParameter("pwd");
	c_sub_s = mr.getParameter("c_sub_s");
	String up_date = mr.getParameter("date");
	int score_num = Integer.parseInt(mr.getParameter("score"));
	store_idx = Integer.parseInt(mr.getParameter("store_idx"));
	store_type= mr.getParameter("store_type");
	String sid = (String) session.getAttribute("sid");
	String img_name = mr.getParameter("f");
	String bb[] = img_name.split("\\\\");
	String path = "http://192.168.20.168:9090/semi/img/review/"+bb[2];

	int result = rdao.postReview(c_idx, c_name, store_idx, up_date, score_num, review, path, r_pwd);
	msg = (result>0)?"리뷰가 등록되었습니다.":"리뷰가 등록되지 않았습니다.";
} 
catch(Exception e) {
	%> 
	<script>
		window.alert("예상치 못한 오류가 발생했습니다.");
		window.self.close();
	</script>
	<%
}
%>
<script>
	location.href="postReview.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>&c_sub_s=<%=c_sub_s%>";
</script>