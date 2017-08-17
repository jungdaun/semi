

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="vdao" class="semi.voc.VocDAO"></jsp:useBean>







<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<style>
	h2{
		text-align: center;
		color: white; 
		
	}
	table{
		width: 450px;

		  

		
		margin: 0px auto;
		border-spacing: 0px;
		background-color: white ; 
		
	}
	table th{
	
		  			border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		color: black; 
		text-align: center;
	}
	table td{
	
	
		text-align: left
		;
					border-top: 1px solid #BF0920;
		border-bottom: 1px solid #BF0920;
		
		color: black; 
	
		;
	}

	
</style>

</head>





<body>




<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
    <h2 align="center">vocReWrite.jsp</h2>
      <%
      String title = request.getParameter("title");
      String ref=request.getParameter("ref");
      String lev=request.getParameter("lev");
      String turn=request.getParameter("turn");
      int idx = Integer.parseInt(request.getParameter("idx"));
     // String pwd = vdao.getUserPwd(idx);

      
      %>
      <form name="vocReWrite" action="vocReWrite_ok.jsp">
         
         <input type="hidden" name="ref" value="<%=ref %>">
         <input type="hidden" name="lev" value="<%=lev %>">
         <input type="hidden" name="turn" value="<%=turn %>">
        
         
         <table>
         <tr>
            <th>작성자</th>
            <td colspan="3"><input type="text" name="writer" required="required"></td>
            
            
             </tr>
         
         <tr>
            <th>제목</th>
            <td colspan="3">
               <input type="text" name="title" size="45" value="Re:)<%=title%>">
            </td>
         </tr>
         <tr>
            <td colspan="4">
               <textarea rows="10" cols="45" name="content"></textarea>
            </td>
         </tr>
         
         <tr>
            <td colspan="4" align="center">
               <input type="submit" value="글쓰기">
               <input type="reset" value="다시작성">
            </td>
         </tr>
         
         </table>
      </form>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>




  
</body>
</html>