<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

th{
   background-color:  #2F4038; color: #FEEEA7; font-size: 15px;
   width:25%;
}
thead td{
   font-weight:bolder;
   background-color:  white; color: black; font-size: 15px;
   width:25%
}
</style>
</head>
<%
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;
%>
<body>
   <table>
      <thead>
      <tr>
         <th>ID</th> <td><%= c_idx%></td>
         <th>Password</th> <td><input type="password" value="4자리 숫자 입력" name="pwd"></td>
      </tr>
      <tr>
         <th>별점주기</th>
         <td><select name="start">
         <% for(int i=1; i<6; i++){%>
            <option value="<%=i%>"><%=i %></option>
         <%}
         %>
         </select></td>
         <th>날짜</th> <td>자동으로 날짜 올리기</td>
      </tr></thead>
      
      <tbody>
      <tr>
         <th>사진 올리기  </th> <td colspan="3">사진 찾아서 upload</td>
      </tr>
      <tr>
         <td colspan="4">
         <textarea rows="25%" cols="65%" name="contents"></textarea>
         </td>
      </tr>
      </tbody>
      
      <tfoot>
         <tr>
            <td colspan="2" align="center"><input type="reset" value="다시 작성"></td>
            <td colspan="2" align="center"><input type="submit" value="등록"></td>
         </tr>
      </tfoot>
   </table>

</body>
</html>