<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.voc.*" %>
    <jsp:useBean id="vdao" class="semi.voc.VocDAO" scope="session"/> 
    <%
    String idx_s=request.getParameter("idx");
    if(idx_s==null||idx_s.equals("")){
    	idx_s="0";
    }
    int idx=Integer.parseInt(idx_s);
    VocDTO dto=vdao.vocContent(idx);
    
    if(dto==null){
    %>
    <script>
    window.alert('잘못된 접근 또는 삭제된 게시글입니다.');
    location.href='vocList.jsp';
    </script>
    <%
    return;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>voc 본문보기</h2>

<table >
<tr>
<th>번호</th>
<th><%=dto.getVod_idx() %></th>
<th>날짜</th>
<th><%=dto.getWritedate() %></th>

</tr>

<tr>
<th colspan="2">작성자</th>
<td><%=dto.getWriter() %></td>


</tr>

<tr>
<th colspan="1">제목</th>
<td colspan="3"><%=dto.getTitle() %></td>
</tr>

<tr height="200">
<td colspan="4" align="left" valign="top"><%=dto.getContent().replaceAll("\n","<br>") %></td>
</tr>
<tr>
<td colspan="4" align="center">목록으로||

<%
               //////////// the people who has admin id can write notice 
				String sid = (String)session.getAttribute("sid");
				
               
               if (sid !=null ){
                   System.out.println (sid);
   				if (sid.equals("admin")){
   					System.out.println ("true");
   					out.println (" <a href='vocReWrite.jsp?title="+dto.getTitle()+"&ref="+dto.getRef()+"&lev="+dto.getLev()+"&turn="+dto.getTurn()+"&idx="+dto.getVod_idx()+">답변쓰기</a>||");
   					
   					
   				}
   				
               }
  


%>


<a href="vocDel.jsp?voc_idx=<%=dto.getVod_idx()%>">글삭제</a>||<a href="vocUpdate.jsp?idx=<%=dto.getVod_idx()%>">수정</a>


</td>
</tr>
</table>
</body>
</html>