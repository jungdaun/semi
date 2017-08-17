<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
<jsp:useBean id="vdto" class="semi.voc.VocDTO" scope="page"/> 
<!-- 1회성 data 마트 카트같은거: scope=page -->

<jsp:setProperty property="*" name="vdto"/>
<jsp:useBean id="vdao" class="semi.voc.VocDAO" scope="session"/> 


<%
request.setCharacterEncoding("utf-8");


String idx_s= request.getParameter("voc_idx");
int idx= Integer.parseInt(idx_s);
//String userPwd = request.getParameter("pwd");


int res = vdao.vocDel(idx);

String msg ="";

 if (res>0){
	msg = "글이 삭제되었습니다.";
	
}
else msg = "error!";





%>


<script>
window.alert ('<%=msg%>');
location.href='findMyVoc.jsp';


</script>
