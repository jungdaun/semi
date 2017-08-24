<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="fdao" class="semi.food.FoodDAO" />
<%
int a = Integer.parseInt(request.getParameter("store_idx"));

int b = Integer.parseInt(request.getParameter("food_num"));

	
	
		int result = fdao.foodOut(a, b);

		String msg = result > 0 ? "메뉴삭제성공" : "메뉴삭제실패";
		

		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>
		<%
	
		%>


	

