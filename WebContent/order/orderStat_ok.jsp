<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>    
    
<%
//int sIdx = Integer.parseInt((String) session.getAttribute("cstore"));

int sIdx = 21; 
Calendar now = Calendar .getInstance(); 


int y=0; int m = 0; 
int key = Integer.parseInt(request.getParameter("key"));

String y_s= ( request.getParameter("y"));
String m_s = ( request.getParameter("m"));

if (y_s==null || y_s.equals("") ){
	y = now.get(Calendar.YEAR);
	
}
else {
	y = Integer.parseInt(y_s);
	
}
if (m_s==null || m_s.equals("") ){
	m = now.get(Calendar.MONTH)+1;
}

else {

	m = Integer.parseInt(m_s);
	if (m < 1){
		m= 12; 
		y = y-1; 
	}
	if(m>12){
		m=1 ; y = y+1; 
	}
}

int val = 0; 


	switch (key){
	case 1: val = m; break; 
	case 3: val = y ; break ; 

	}




int arr []= odao.getOrderStat(key, val, sIdx );

//int next = Integer.parseInt(d)+7 ; 
//int back = 0 ; 


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




<%

switch(key){

case 1: %>
<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y%>&m=<%=m-1%>">이전</a><br>
<%=y %>년
<%=m%>월<BR><%break;

case 3: %>



<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y-1%>&m=<%=m%>">이전</a><br>
<%=y%>년<BR><%break;
	

}

for ( int i =0; i< arr.length; i ++){
	%>
	<%=(i+1)%> :<%=arr[i] %><br>
	<%
}
 

switch(key){

case 1: %>
<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y%>&m=<%=m+1%>">다음</a><br>
<%break;

case 3: %>



<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y+1%>&m=<%=m%>">다음</a><br>
<BR><%break;
	

}

%>


<br>
</body>
</html>