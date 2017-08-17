<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
  
    
<jsp:useBean id="vdto" class="semi.voc.VocDTO" /> <!-- 카트(객체를 모두 다 담고 있는 녀석)만들기 -->
<jsp:setProperty property="*" name="vdto"/> <!-- 데이터베이스 테이블과 받아오는 값이 같으면 *로 한꺼번에 가져올 수 있음 그 값을 bdto에 담기-->
<jsp:useBean id="vdao" class="semi.voc.VocDAO" /><!-- 기능 갖고 있는 녀석 만들어서 갖고 오기 session=자원낭비 방지-->
<%


request.setCharacterEncoding("utf-8");
int result = vdao.vocWrite(vdto); //count같은 역할
String msg = result>0?"글쓰기 성공":"글쓰기 실패";//result값이 0보다 크면 등록 성공, 0보다 작으면 등록실패
%>

<script>
//경고창 띄워주기
window.alert('<%=msg%>');
location.href='findMyVoc.jsp'; //이동해야할 페이지
</script>