<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="semi.store.*" %>
<jsp:useBean id="sdao" class="semi.store.StoreDAO"></jsp:useBean>
<jsp:useBean id="sdto" class="semi.store.StoreDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sdto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%@include file="/header.jsp"%>
<section>
<%
String saddr = (String)session.getAttribute("saddress");
String store_type=request.getParameter("store_type");

String c_sub[]= saddr.split(" ");
String c_sub_s = c_sub[2];
ArrayList<StoreDTO> arr = sdao.findStore(store_type);

for(int i=0; i<arr.size(); i++){
   String s_addr = arr.get(i).getStore_addr();
   if(!(s_addr.contains(c_sub_s))){
      arr.remove(i);
   }   
}

%>
   <legend><h1><br><br><br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home >> <%=store_type %></h1><br></legend>
   <table style="position:relative; left:122px;">
<% 
if(arr.equals("") || arr.size()==0){%>
      <tr>
         <td rowspan="3" align="center">
         현재 등록된 가게가 없습니다.<br>
         사장님이라면 가게를 등록해주세요~<br>
         손님들이 배고파서 기다리고 있습니다!!!!!
         </td>
      </tr>   
<% }
else{
   int count=0; int h=0;
   while(count<arr.size()) {
   %> <tr style="position:static; height:<%=h%>px;"><%
      for(int i=0; i<3; i++){
         if(count<arr.size()){%>
         <td>
         <a href="postFood.jsp?store_idx=<%=arr.get(count).getStore_idx()%>&store_type=<%=store_type%>" style="text-decoration:none;">
         <img src="../img/store/<%=arr.get(count).getStore_name()%>.png" alt="picture"
         style="width:150px; height:150px; position:absolute; left:<%=(i*300+(i+1)*50)%>px;
         border-bottom:1px solid black;border-left: 1px solid black; border-top:1px solid black;"/>
         
         <div style="position:absolute; left:<%=i*300+(i+1)*50+150%>px; width:150px; height:150px;
         border-bottom:1px double black; border-top:1px double black;border-right: 1px solid black;">
         <h3 align="center"><%=arr.get(count).getStore_name() %></h3><hr>
         <h5>시간 : <%=arr.get(count).getOpen_time()%>~<%=arr.get(count).getClose_time()%><br>
         별점 : <%
         int num = arr.get(count).getScore_num();
         for(int j=1; j<=num; j++){%>&hearts;<%} %><br>
         리뷰수 : <%=arr.get(count).getReview_num() %><br>
         판매수 : <%=arr.get(count).getSale_num() %><br>
         
         주소 :<br><h6><%=arr.get(count).getStore_addr() %></h6></h5>
         
         </div>
         </a>
         
         </td>
      <%count++;
         }
         else{
            break;
         }
         h += 151;
      }
     %></tr>
<% }
}%>
   </table>
</section><br><br><br>

<%@include file="/footer.jsp"%>

</body>
</html>