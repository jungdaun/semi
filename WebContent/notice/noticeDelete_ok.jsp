<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<jsp:useBean id="ndto" class="semi.notice.NoticeDTO" scope="page"/> 
<!-- 1회성 data 마트 카트같은거: scope=page -->

<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"/> 


<%
String idx_s= request.getParameter("notice_idx");
int idx= Integer.parseInt(idx_s);

int res = ndao.noticeDel(idx);
String msg ="";

 if (res>0){
	msg = "공지사항을 삭제했습니다.";
	
}
else msg = "error!";





%>


<script>
window.alert ('<%=msg%>');
location.href='noticeList.jsp';


</script>
