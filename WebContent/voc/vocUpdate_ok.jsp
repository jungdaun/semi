<%@page import="semi.voc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="vdto" class="semi.voc.VocDTO"/>
<jsp:setProperty property="*" name="vdto"/>
<jsp:useBean id="vdao" class="semi.voc.VocDAO" scope="session"/>
<%request.setCharacterEncoding("utf-8");%>
    
<%

String idx_s = request.getParameter("voc_idx");
int idx = Integer.parseInt(idx_s);

//String pwd = request.getParameter("pwd");



/*
System.out.println (userPwd);
*/


%>
    




<%
int res = vdao.vocUpdate(vdto, idx);

String msg = res>0?"글이 수정되었습니다.":"fail";


%>


<script>
	window.alert ('<%=msg%>');
	location.href='findMyVoc.jsp';
	
</script>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>





</body>
</html>