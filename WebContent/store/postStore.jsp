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
String saddr = "서울시 중랑구 묵동";
String[] c_sub = saddr.split(" ");
String c_sub_s = c_sub[2];
String store_type=request.getParameter("store_type");

ArrayList<StoreDTO> arr = sdao.findStore(store_type);
Iterator<StoreDTO> list = arr.iterator();

/**같은 동네 가게들만 보이게 하는 부분*/
for(int i=0; i<arr.size(); i++){
	String s_addr = arr.get(i).getStore_addr();
	if(!s_addr.contains(c_sub_s)) arr.remove(i);
}
%>
   <legend style="background-color:#2F4038; color:#FEEEA7; font-size:22px; font-weight: bold;">
   Home >> <%=store_type %> >> <%=c_sub_s %></legend>
   <table>
<% 
if(arr.equals("") || arr.size()==0){%>
      <tr>
         <td rowspan="6" align="center" style="font-size: 25px; color:white;">
        <br><img src="../img/store/sad.png" style="width:250px; height:250px"/><br>
        현재 등록된 가게가 없습니다ㅜ_ㅜ<br>
         사장님이라면 가게를 등록해주세요~<br>
         손님들이 배고파서 기다리고 있습니다
         </td>
      </tr>   
<% }
else{
   int count=0;
   while(count<arr.size()) {
	   String open_time_s = arr.get(count).getOpen_time();
    	 String close_time_s = arr.get(count).getClose_time();
    	 String[] open = new String[3];
    	 String[] close = new String[3];%> 
     <tr><%
      for(int i=0; i<5; i++){
         if(count<arr.size()){ 
        	 for(int j=0; j<3; j++){
        		 open[j] = open_time_s.substring((j*2), (j*2)+2);
        		 close[j] = close_time_s.substring((j*2), (j*2)+2);
        		 }
        	 %>
            <td style="padding:13px;">
            <div style="background-color: black;">
            <a href="postFood.jsp?store_idx=<%=arr.get(count).getStore_idx()%>&store_type=<%=store_type%>&c_sub_s=<%=c_sub_s%>" style="text-decoration:none;">           
              <img src="../img/store/<%=arr.get(count).getStore_name()%>.png" style="width:110px; height:128px"/>
              <!-- img src="<%=arr.get(count).getStore_image()%>" style="width:110px; height:128px"/-->
            </a>
            </div>
    
            <div style="background-color: #2F4038; color:white; font-size: 17px;">
               영업시간 : <%=open[0]+'.'+open[1]+':'+open[2]%>~<%=close[0]+'.'+close[1]+':'+close[2]%><br> 
               주소 : <%=c_sub[1]+" "+c_sub[2] %><br>
               별점 : <% int num = arr.get(count).getScore_num();
               for(int j=1; j<=num; j++){%>&hearts;<%} %><br>
               리뷰수 : <%=arr.get(count).getReview_num() %><br>
               판매수 : <%=arr.get(count).getSale_num() %>      
           </div></td> 
                
      <%count++;
         }
         else
            break;  
      }%></tr>
<% } }%>
   </table>
</section><br><br><br>
</div>
<%@include file="/footer.jsp"%>
</body>
</html>