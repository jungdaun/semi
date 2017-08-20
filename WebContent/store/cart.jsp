<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="semi.cart.*" %>
<jsp:useBean id="cdto" class="semi.cart.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"></jsp:useBean>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>
 
<%
//Integer c_idx = (Integer) session.getAttribute("c_idx");
Integer c_idx = (Integer)2;
//int c_idx =mdao.getMemIdx((String)session.getAttribute("sid"));
String store_idx_s = request.getParameter("store_idx");
String store_type=request.getParameter("store_typpe");
int store_idx = Integer.parseInt(store_idx_s);
ArrayList<CartDTO> arr = cdao.showData(store_idx, c_idx);

/*예랑 추가*/
int oIdx =odao.makeOrderIdx()+1;
if (odao.hasOIdx(store_idx, c_idx)){
	//true	
	System.out.println ("true");
	oIdx = odao.getOrderIdx(store_idx, c_idx);	
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function del(obj){
   var tag="";
   var chk = document.getElementsByName(obj);
   for(var j=0; j<chk.length; j++){
      if(chk[j].checked==true){
         tag = tag +' '+ chk[j].value;
      }
   }
   location.href="delete_ok.jsp?store_idx=<%=store_idx%>&store_type=<%=store_type%>&str="+tag;   
}
</script>
</head>
<body>

   <table border="1" width="450" cellspacing="0" align="center"><br>
      <thead style="background-color:  #2F4038; color: #FEEEA7; font-size: 15px;">
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
             <td colspan="5" align="center">장바구니가 비어있습니다.</td>
            </tr>
            <% 
         }
         else{
            for(int i=0; i<arr.size(); i++){
               %>
               <tr>
                  <td>
                  <form name="frm">
                  	<input type="checkbox" value="<%=arr.get(i).getFood_name()%>" name="chk[]">
                  </form></td>
                  <td><%=arr.get(i).getFood_name()%></td>
                  <td><%=arr.get(i).getFood_price()%>원</td>
                  <td>
                   <form name="change" action="change_ok.jsp">
                      <input type="hidden" name="store_type" value="<%=store_type%>">
                      <input type="hidden" name="food_name" value="<%=arr.get(i).getFood_name()%>">
                      <input type="hidden" name="price" value="<%=arr.get(i).getFood_price()%>">
                      <input type="hidden" name="store_idx" value="<%=store_idx%>">
                      <input type="text" name="count" value="<%=arr.get(i).getFood_count()%>" size="1">
                      <input type="submit" value="수정">
                   </form>
                  </td>
                <td><%=arr.get(i).getTotal_price()%>원</td>
               </tr> <% 
            } %>

               <tr>
               	<td><input type="button" value="삭제" onclick="del('chk[]')"></td>
               	<td colspan="3" align="center"></td>
                <td align="center"><input type="button" value="결제하기" onclick="location.href = '/semi/pay/payMain.jsp?oIdx=<%=oIdx %>&sIdx=<%=store_idx %>&cIdx=<%=c_idx %>' " ></td>
            </tr>
         <% }%>
      </tbody>
   </table>
   
</body>
</html>