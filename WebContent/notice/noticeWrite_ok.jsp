<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");%>
    
<jsp:useBean id="ndto" class="semi.notice.NoticeDTO" scope="page"/> 
<!-- 1회성 data 마트 카트같은거: scope=page -->

<jsp:setProperty property="*" name="ndto"/>
<jsp:useBean id="ndao" class="semi.notice.NoticeDAO" scope="session"/> 

<!-- 실제 기능을 가지고있는거 /앞으로 계속 사용할거기때문에 scope = session  
 -->

<%
int result=ndao.noticeWrite(ndto); //입력데이터 넘기기  
String msg=result>0?"공지사항이 등록되었습니다.":"공지사항 쓰기 실패";
%>


<script>
window.alert('<%=msg%>');
location.href='noticeList.jsp';



</script>
