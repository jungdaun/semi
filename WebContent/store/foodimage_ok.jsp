<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="wf" class="semi.image.ImageDAO" scope="session" />
<jsp:useBean id="fdto" class="semi.food.FoodDTO" />
<jsp:setProperty property="*" name="fdto" />
<jsp:useBean id="fdao" class="semi.food.FoodDAO" />
<%



String savePath=wf.USERS_HOME + "/food/" + wf.getCrpath();




try {
	MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");
	String cstore_s = (String) session.getAttribute("cstore"); //ceo idx
	String sid = (String) session.getAttribute("sid"); //ceo id
	int cstore = Integer.parseInt(cstore_s);
	String aa = mr.getParameter("a"); //img 불러올때 사용
	String bb[] = aa.split("\\\\");
	String path = "http://localhost:9090/semi/store/img/upload/food/" + sid + "/" + bb[2];
	wf.setImage(path, cstore);
	
	String fn = mr.getParameter("food_name");
	String ft = mr.getParameter("food_type");
	String fp = mr.getParameter("food_price");
	
	
	
	
	
	
} catch(Exception e) {
	%> 
	<script>
		window.alert("예상치 못한 오류가 발생함!");
		window.self.close();
	</script>
	<%
	
}

int result = fdao.foodJoin(fdto);

String msg = result > 0 ? "회원가입성공" : "회원가입실패";


%>

<script>
	window.alert(('<%=msg%>'););
	window.self.close();
</script>