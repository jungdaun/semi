<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>    
    
<%
/*
String start = request.getParameter("startDate");
String end = request.getParameter("endDate");

int res = odao.getStat(start, end);


*/


Calendar now = Calendar .getInstance(); 
int y = now.get(Calendar.YEAR);
int m = now . get(Calendar.MONTH)+ 1; 
int d = now . get(Calendar.DATE);

String start = request.getParameter("start");
if (start == null || start .equals("") ){
	start = y +"-"+m+"-"+d;
	
	
}


int key = Integer.parseInt(request.getParameter("key"));
int arr []= odao.getOrderStat(key, start);

%>
<!DOCTYPE html >


<html>
<head>
<script type="text/javascript">


</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="">
<a>이전7일</a><br>

<%
for ( int i =0; i< arr.length; i ++){
	%>
	<%=22-i%>:<%=arr[i] %><br>
	<%
}
 

%>

<a>다음7일</a>
<br>
</form>
</body>
</html>