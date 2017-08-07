<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String add1 = request.getParameter("si");
	String add2 = request.getParameter("gu");
	String add3 = request.getParameter("dong");
	String address2 = request.getParameter("address2");
	
	

	if (!add1.equals("0") && !add2.equals("0") && !add3.equals("0")) {

		String totaladd = add1 + "/"+ add2 + "/" + add3;
%>

<script>
	opener.document.join.address.value = '<%=totaladd%>';
	opener.document.join.address2.value = '<%=address2%>';
	window.self.close();
</script>

<%
	} else {
%>
<script>
	window.alert('주소를 모두 선택해주세요.');
	location.href = 'findAddress.jsp';
</script>
<%
	}
%>
