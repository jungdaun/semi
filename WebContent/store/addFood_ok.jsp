<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>

<jsp:useBean id="fdto" class="semi.food.FoodDTO" />
<jsp:setProperty property="*" name="fdto" />
<jsp:useBean id="fdao" class="semi.food.FoodDAO" />
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />

<%

		int result = fdao.foodJoin(fdto);

		String msg = result > 0 ? "음식등록성공" : "음식등록실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/store/editMenu.jsp';
		</script>
	<%



String savePath=wf.USERS_HOME + "/" + wf.getCrpath();




try {
	MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");
	String cstore_s = (String) session.getAttribute("cstore"); //ceo idx
	String sid = (String) session.getAttribute("sid"); //ceo id
	int cstore = Integer.parseInt(cstore_s);
	String aa = mr.getParameter("a"); //img 불러올때 사용
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

