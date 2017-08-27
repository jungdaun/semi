<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:useBean id="fdto" class="semi.food.FoodDTO" />
<jsp:setProperty property="*" name="fdto" />
<jsp:useBean id="fdao" class="semi.food.FoodDAO" />
<%
	//모든 값 검증..
	

	
	
	
		int num = 0;
		String name = "";
		String[] aa = request.getParameterValues("aa");
		String[] bb = request.getParameterValues("bb");
		
		
		for(int i = 0; i < aa.length; i++) {
			System.out.print("aa의 길이" + aa.length);
			System.out.print("bb의 길이" + bb.length);
			System.out.println("aa는" + aa[i] + "bb는"+ bb[i]);
			
			fdao.changeNum(bb[i], Integer.parseInt(aa[i]));
		}
		
		

		String msg = "순서 변경 성공!";
		
		
		%>

		<script>window.alert('<%=msg%>');
			location.href = '/semi/index.jsp';
		</script>

	

