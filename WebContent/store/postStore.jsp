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
<style>
#postStore{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
   
}
</style>
</head>

<body>
<%@include file="/header.jsp"%>
<div id="bodywrap">
<div id="postStore" >
<section>
<%

String store_type=request.getParameter("store_type");
if(store_type.contains("치킨"))
	store_type="chicken";
else if(store_type.contains("피자"))
	store_type="pizza";
else if(store_type.contains("족발"))
	store_type="jokbal";
else if(store_type.contains("닭발"))
	store_type="dakbal";
else if(store_type.contains("빵"))
	store_type="bbang";

String c_sub_s=null;
String[] c_sub;
String c_s = request.getParameter("c");

if(c_s==null){
	String saddr = (String)session.getAttribute("saddr");
	if(saddr==null){%>
		<script>
			window.alert('로그인해주세요');
			location.href="../index.jsp";
		</script>
	<%}
	else{
		c_sub = saddr.split(" ");
		c_sub_s = c_sub[2];
	}
}
else
	 c_sub_s = c_s;

ArrayList<StoreDTO> arr = sdao.findStore(store_type);
Iterator<StoreDTO> list = arr.iterator();
/**같은 동네 가게들만 보이게 하는 부분*/
while(list.hasNext() && c_sub_s!=null){
    String s_addr = list.next().getStore_addr(); 
    if(!s_addr.contains(c_sub_s)) list.remove();
}
%>
   <legend style="background-color:#2F4038; color:#FEEEA7; font-size:22px; font-weight: bold;">
   Home >> <%=store_type %> >> <%=c_sub_s %></legend>
    <div style="display: inline-block; text-align: center; overflow: auto; width:700px; height:500px;">
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
   while(count<arr.size()) {%> 
     <tr><%
      for(int i=0; i<3; i++){
        
         if(count<arr.size()){
        	 String open_time_s = arr.get(count).getOpen_time();
             //System.out.println("time = "+open_time_s);
             String close_time_s = arr.get(count).getClose_time();
             String[] open = new String[3];
             String[] close = new String[3];
            for(int j=0; j<3; j++){
               open[j] = open_time_s.substring((j*2), (j*2)+2);
               close[j] = close_time_s.substring((j*2), (j*2)+2);
               }
            %>
            <td style="padding:13px;">
            <div style="background-color: black;">
            <a href="postFood.jsp?store_idx=<%=arr.get(count).getStore_idx()%>&store_type=<%=store_type%>&c_sub_s=<%=c_sub_s%>" style="text-decoration:none;">           
              <img src="<%=arr.get(count).getStore_image()%>" style="width:110px; height:128px"/>
              
            </a>
            </div>
    
            <div style="background-color: #2F4038; color:white; font-size: 17px;">
               영업시간 : <%=open[0]+'.'+open[1]+':'+open[2]%>~<%=close[0]+'.'+close[1]+':'+close[2]%><br> 
            주소 : <%=c_sub_s%><br>   
               별점 : <% int num = arr.get(count).getScore_num();
               for(int j=1; j<=num; j++){%>&hearts;<%} %><br>
               리뷰수 : <%=arr.get(count).getReview_num() %><br>
               판매수 : <%=arr.get(count).getSale_num() %>      
           </div></td> 
                
      <%
      count++;
         }
         else if(count==arr.size())
        	 break;  
      }%></tr> 
<% } }%>
   </table>
   </div>
</section><br><br><br>

<%@include file="/footer.jsp"%>
</div>
</div>
</body>
</html>