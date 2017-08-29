<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<jsp:useBean id="fdto" class="semi.food.FoodDTO" />
<jsp:setProperty property="*" name="fdto" />
<jsp:useBean id="fdao" class="semi.food.FoodDAO" />
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />

<%
String cstore = (String) session.getAttribute("cstore");
int istore = Integer.parseInt(cstore);

String savePath=wf.USERS_HOME + "img/upload/" + wf.getCrpath();


System.out.print(savePath);

try {
	MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8", new DefaultFileRenamePolicy());
	String cstore_s = (String) session.getAttribute("cstore"); //ceo idx
	String sid = (String) session.getAttribute("sid"); //ceo id
	String aa = mr.getParameter("a"); //img 불러올때 사용
	String food_nums = mr.getParameter("b");
	int food_num = Integer.parseInt(food_nums);
	String bb[] = aa.split("\\\\");
	String path = "http://192.168.20.168:9090/semi/img/upload/" + sid + "/" + bb[2];
	
	wf.setImage2(path, istore, food_num-1);
	
} catch(Exception e) {
	e.getStackTrace();
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
	opener.location.reload();
</script>