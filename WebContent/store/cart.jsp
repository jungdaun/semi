<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%@page import="semi.cart.*" %>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>

 
<%
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;
String store_idx_s = request.getParameter("store_idx");
int store_idx = Integer.parseInt(store_idx_s);

ArrayList<CartDTO> arr = cdao.showData(store_idx, c_idx);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language='javascript'>
function change(){
	
	var count = document.frm.count.value;
	var price = document.frm.price.value;
	System.out.println("count = "+count+", price = "+price);
	
}
	
	//cdao.changeData(store_idx, c_idx, count, price);
	//System.out.println("444444");
	//arr = cdao.showData(store_idx, c_idx);

</script>
</head>
<body>

   <table border="1" width="450" cellspacing="0">
      <thead>
         <tr>
         	<th>선택</th>
            <th>음식명</th>
            <th>음식 가격</th>
            <th>개수</th>
            <th>총 가격</th>
         </tr>
      </thead>
      <tbody style="background-color: white">
         <%
         if(arr==null||arr.size()==0){
            %>
            <tr>
             <td colspan="5" align="center">검색된 사원이 없습니다.</td>
            </tr>
            <% 
         }
         else{
            for(int i=0; i<arr.size(); i++){
               %>
               
               <tr>
               
               	<td><input type="checkbox" value="<%=i%>" name="chk"></td>
                <td><%=arr.get(i).getFood_name()%></td>
                <td><%=arr.get(i).getFood_price()%></td>
                <td>
                	<form id="frm" name="frm" method="POST" onSubmit="change()">
                		<input type="hidden" name="price" value="<%=arr.get(i).getFood_price() %>">
                		<input type="text" name="count" value="<%=arr.get(i).getFood_count()%>" size="1">
                		<input type="submit" value="수정" name="submit">
                	</form>
                </td>
                <td><%=arr.get(i).getTotal_price()%></td>
               
               </tr>
              
               <% 
            }%>
            <tr>
            	<td colspan="4" align="center"><input type="button" value="쇼핑계속하기" ></td>
            	<td align="center"><input type="button" value="상품결제하기" ></td>
            </tr>
         <% }%>
      </tbody>
   </table>
   
</body>
</html>