<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.store.*" %>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="sdao" class="semi.store.StoreDAO"></jsp:useBean>
<jsp:useBean id="sdto" class="semi.store.StoreDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>

<%@include file="/header.jsp"%>
<div id="bodywrap">
<section>
<%
//String saddr = (String)session.getAttribute("saddr");
String store_type=request.getParameter("store_type");
String saddr = "서울시 관악구 낙성대";
String[] c_sub = saddr.split(" ");
String c_sub_s = c_sub[2];

ArrayList<StoreDTO> arr = sdao.findStore(store_type);
Iterator<StoreDTO> list = arr.iterator();

/**같은 동네 가게들만 보이게 하는 부분*/
while(list.hasNext()){
   String s_addr = list.next().getStore_addr();
   
   if(!s_addr.contains(c_sub_s)){
      list.remove();
   }
}
%>
   <legend><h2 style="background-color:#2F4038; color:#FEEEA7;">
   Home >> <%=store_type %> >> <%=c_sub_s %></h2></legend>
   <table>
<% 
if(arr.equals("") || arr.size()==0){%>
      <tr>
         <td rowspan="6" align="center">
         현재 등록된 가게가 없습니다.<br>
         사장님이라면 가게를 등록해주세요~<br>
         손님들이 배고파서 기다리고 있습니다!!!!!
         </td>
      </tr>   
<% }
else{
   int count=0;
   while(count<arr.size()) {
   %> <tr><%
      for(int i=0; i<5; i++){
         if(count<arr.size()){%>
            
            <td style="padding:13px;">
            <div style="background-color: black;">
            <a href="postFood.jsp?store_idx=<%=arr.get(count).getStore_idx()%>&store_type=<%=store_type%>&c_sub_s=<%=c_sub_s %>" style="text-decoration:none;">         
               <img src="../img/store/<%=arr.get(count).getStore_name()%>.png" style="width:110px; height:128px"/>
            </div>
    
            <div style="background-color: #2F4038; color:white; font-size: 17px;">
               시간 : <%=arr.get(count).getOpen_time()%>~<%=arr.get(count).getClose_time()%><br> 
               별점 : <% int num = arr.get(count).getScore_num();
               for(int j=1; j<=num; j++){%>&hearts;<%} %><br>
               리뷰수 : <%=arr.get(count).getReview_num() %><br>
               판매수 : <%=arr.get(count).getSale_num() %><br>
               주소 : <%=c_sub[1]+" "+c_sub[2] %>
           </div>
           </a>
           </td>
           
      <%count++;
         }
         else{
            break;
         }
      }
     %></tr>
<% }
}%>
   </table>
</section><br><br><br>
</div>
<%@include file="/footer.jsp"%>

</body>
</html>