<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />

<%



String savePath=wf.USERS_HOME + "/" + wf.getCrpath();




try {
	MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");
	String cstore_s = (String) session.getAttribute("cstore");
	String sid = (String) session.getAttribute("sid");
	int cstore = Integer.parseInt(cstore_s);
	String aa = mr.getParameter("a");
	String bb[] = aa.split("\\\\");
	String path = "http://localhost:9090/semi/store/img/upload/" + sid + "/" + bb[2];
	wf.setImage(path, cstore);
	
	
	
} catch(Exception e) {
	%> 
	<script>
		window.alert("예상치 못한 오류가 발생함!");
		window.self.close();
	</script>
	<%
	
}


%>

<script>
	window.alert("파일 올리기 성공!");
	window.self.close();
</script>