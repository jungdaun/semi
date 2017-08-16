<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>


<table>
   <% 
   if(arr.equals("") || arr.size()==0){%>
         <tr style="color:white; font-size: 30px;">
            <td colspan="3" align="center">
            <br>등록된 음식이 없습니다ㅜ_ㅜ<br>음식을 등록해 주세요~
           </td>
         </tr>   
   <% }
   else{
         int count=0;
         while(count<arr.size()) {
    %>
         <tr>
         <%
         for(int i=0; i<2; i++){
            if(count<arr.size()){%>
            <td><img src="../img/store/<%=arr.get(count).getFood_name()%>.png" style="width:120px; height:120px;"/></td>
            <td style="background-color: #2F4038; color:white;"><%=arr.get(count).getFood_name() %>
            <br><%=arr.get(count).getFood_price() %>원 </td>
         
            <td>
            <form name="postFood_ok" action="postFood_ok.jsp">
               <select name="food_count"><%
               for(int j=1; j<10; j++){%>
                  <option value="<%=j%>"><%=j %></option>
               <% } %>
               </select>
               
               <input type="hidden" name="store_type" value="<%=store_type%>">
               <input type="hidden" name="store_idx" value="<%=store_idx%>">
               <input type="hidden" name="food_price" value="<%=arr.get(count).getFood_price()%>">
               <input type="hidden" name="food_name" value="<%=arr.get(count).getFood_name()%>">
               <input type="submit" value="Pick">
            </form>
            </td>
         
         <%count++;}
         else
            break;
      }
        %></tr>
      <% }
   
   }%>
      </table>