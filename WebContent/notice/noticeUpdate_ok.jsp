<%@page import="semi.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="ndto" class="semi.notice.NoticeDTO"/>
<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"/>
<%request.setCharacterEncoding("utf-8");%>
    
<%

String idx_s = request.getParameter("notice_idx");
int idx = Integer.parseInt(idx_s);

String title = request.getParameter("notice_title");
String content = request.getParameter("notice_content");

System.out.println (idx);


/*
System.out.println (userPwd);
*/


%>
    




<%
int res = ndao.noticeUpdate(title, content, idx);

String msg = res>0?"수정이 완료되었습니다.":"오류";


%>


<script>
	window.alert ('<%=msg%>');
	location.href='noticeList.jsp';
	
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