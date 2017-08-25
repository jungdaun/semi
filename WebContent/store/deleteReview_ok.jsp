<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="semi.review.*" %>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"></jsp:useBean>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>

<%
int i = Integer.parseInt(request.getParameter("i"));
int store_idx=Integer.parseInt(request.getParameter("store_idx"));

ArrayList<ReviewDTO> brr = rdao.show(store_idx);
int result = rdao.deleteReview(store_idx, brr.get(i).getC_idx(), brr.get(i).getR_idx(), brr.get(i).getScore_num());
String msg = (result>0)?"리뷰가 삭제되었습니다.":"리뷰가 삭제되지 않았습니다.";
%>
<script>
	window.alert('<%=msg%>');
	location.href="postReview.jsp?store_idx=<%=store_idx%>";
</script>