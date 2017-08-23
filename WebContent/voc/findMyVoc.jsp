
<%@page import="semi.voc.VocDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:useBean id="vdao" class="semi.voc.VocDAO"></jsp:useBean>




<!DOCTYPE html >
<html>
<head>

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset=UTF-8">
<title>Insert title here</title>

<style>
h2 {
   text-align: center;
   color: white;
}

table {
   width: 450px;
   border-top: 4px double white;
   border-bottom: 4px double white;
   margin: 0px auto;
   border-spacing: 0px;
   background-color: white;
}

table th {
   background: #BF0920;
   color: white;
   text-align: center;
}

table td {
   text-align: center;
}

tfoot {
   border-top: 4px double #BF0920;
}
#myvoc{
width: 850px;
   height: 100%;
   margin-top: 200px;
}
</style>

</head>
<body>



   <%@include file="/header.jsp"%>
   <div id="bodywrap">
   <div id="myvoc">
      <%
         request.setCharacterEncoding("utf-8");

         //   String mySid = request.getParameter("mySid");

         //필수정보4가지
         int totalCnt = vdao.getTotalCnt(sid);
         //총 게시물 수
         //sql : select count (*) from jsp_bbs

         int listSize = 5;
         // 보여줄 게시물 수 

         int pageSize = 5;
         //보여줄 페이지 수 

         String cp_s = request.getParameter("cp");
         if (cp_s == null || cp_s.equals("")) {

            cp_s = "1";
         }
         int cp = Integer.parseInt(cp_s);

         //1. total pg 
         int totalPg = totalCnt / listSize + 1;
         if (totalCnt % listSize == 0) {
            totalPg = totalPg - 1;

         }

         int userGp = cp / pageSize;
         if (cp % pageSize == 0) {
            userGp = userGp - 1;
         }
      %>

      <%
         if (sid == null || sid.equals("")) {
      %>

      <script type="text/javascript">
         window.alert('로그인 하세요');
         window.href = '/semi/index.jsp';
      </script>
      <%
         return;

         }
      %>


      <!-- -------------------------------------------------------------- -->


      <%
         ArrayList<VocDTO> arr = vdao.findMyVoc(sname, cp, listSize);
      %>
      <section>
         <article>
            <h2><%=sname%>님이 작성하신 질문입니다.
            </h2>
            <div style="display: inline-block; text-align: center;">
            <table>
               <thead>
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>글쓴이</th>
                     <th>작성일</th>
                     <!--     <th>turn</th>
            -->


                  </tr>

               </thead>



               <tfoot>

                  <tr>
                     <td colspan="3" align="center">
                        <%
                           if (userGp != 0) {
                        %><a href="vocList.jsp?cp=<%=(userGp - 1) * pageSize + pageSize%>">&lt;&lt;</a>


                        <%
                           }

                           for (int i = userGp * pageSize + 1; i <= userGp * pageSize + pageSize; i++) {
                        %>&nbsp;&nbsp;&nbsp;<a href="findMyVoc.jsp?cp=<%=i%>"><font
                           <%=cp == i ? "color='red'" : ""%>> <%=i%>
                        </font> </a>&nbsp;&nbsp;&nbsp;<%
    if (i == totalPg)
          break;
    }

    if (userGp != (totalPg / pageSize - (totalPg % pageSize == 0 ? 1 : 0))) {
 %><a href="findMyVoc.jsp?cp=<%=(userGp + 1) * pageSize + 1%>">&gt;&gt;</a>
                        <%
                           }
                        %>

                     </td>
                     <td><a href="vocWrite.jsp">글쓰기</a>
                  </tr>


               </tfoot>
               <tbody>

                  <%
                     if (arr == null || arr.size() == 0) {
                  %>
                  <tr>
                     <td colspan="4" align="center">등록된 글이 없습니다.</td>
                  </tr>
                  <%
                     } else {
                        for (int i = 0; i < arr.size(); i++) {
                  %>
                  <tr>
                     <td><%=arr.get(i).getVod_idx()%></td>
                     <td style="text-align: left;">
                        <%
                           for (int j = 0; j < arr.get(i).getLev(); j++) {
                                    out.println("&nbsp;");
                                 }
                        %> <a
                        href="vocContent.jsp?idx=<%=arr.get(i).getVod_idx()%>"><%=arr.get(i).getTitle()%>
                     </a>
                     </td>




                     <td><%=arr.get(i).getWriter()%></td>
                     <td><%=arr.get(i).getWritedate()%></td>
                     <!--        <td><%=arr.get(i).getTurn()%></td> -->
                  </tr>

                  <%
                     }

                     }
                  %>






               </tbody>



            </table>
            </div>


         </article>

      </section>




      <!-- -------------------------------------------------------------- -->
   
   <%@include file="/footer.jsp"%>
   </div>
   </div>


</body>
</html>