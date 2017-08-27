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
String cstore = (String) session.getAttribute("cstore");
int istore = Integer.parseInt(cstore);
int maxnum = fdao.maxfoodnum(istore);
String food_name = null;
String food_type = null;
int food_price = 0;
int food_num = fdao.maxfoodnum(istore);
String savePath=wf.USERS_HOME + "img/upload/" + wf.getCrpath();
String path = null;


System.out.print("음식 더할떄 : " + savePath);


try {
	MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");
	String cstore_s = (String) session.getAttribute("cstore"); //ceo idx
	String sid = (String) session.getAttribute("sid"); //ceo id
	String aa = mr.getParameter("a"); //img 불러올때 사용
	String bb[] = aa.split("\\\\");
	path = "http://localhost:9090/semi/img/upload/" + sid + "/" + bb[2];
	food_name = mr.getParameter("food_name");
	food_type = mr.getParameter("food_type");
	food_price = Integer.parseInt(mr.getParameter("food_price"));
	
	
	
	
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

<%

		int result = fdao.foodJoin(istore, food_name, food_type, food_price, food_num);
		wf.setImage2(path, istore, food_num);
		String msg = result > 0 ? "음식등록성공" : "음식등록실패";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/store/editMenu.jsp';
		</script>
	