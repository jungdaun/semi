<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<jsp:useBean id="fdto" class="semi.food.FoodDTO" />
<jsp:setProperty property="*" name="fdto" />
<jsp:useBean id="fdao" class="semi.food.FoodDAO" />
<%
	//모든 값 검증..
	
	boolean chk = true;



if (request.getParameter("food_name") == null || request.getParameter("food_name").equals("")) {
	chk = false;
	%>
	<script>
		window.alert("이름을 입력해주세요.");
		history.back();
	</script>
	
	<%
}
else if (request.getParameter("food_type") == null || request.getParameter("food_type").equals("")) {
	chk = false;
	%>
	<script>
		window.alert("전화번호를 입력해주세요.");
		history.back();
	</script>
	
	<%

}
else if (request.getParameter("food_price") == null || request.getParameter("food_price").equals("")) {
	chk = false;
	%>
	<script>
		window.alert("전화번호를 입력해주세요.");
		history.back();
	</script>
	
	<%

}


if(chk) {
	int result = fdao.foodupdate(fdto);

	String msg = result > 0 ? "음식정보수정성공" : "음식정보수정실패";
	
	
	%>

	<script>window.alert('<%=msg%>');
		location.href = '/semi/index.jsp';
	</script>
	<%
} 
	%>



