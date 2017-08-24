<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>    
    
<%
int sIdx = Integer.parseInt((String) session.getAttribute("cstore"));
//System.out.println (sIdx);

Calendar now = Calendar .getInstance(); 


int y=0; int m = 0; 
int key = 0; 
if ((request.getParameter("key"))==null ||(request.getParameter("key")) .equals("") ){
key = 0 ; 	
}
else key = Integer.parseInt(request.getParameter("key"));

String y_s= ( request.getParameter("y"));
String m_s = ( request.getParameter("m"));

if (y_s==null || y_s.equals("") ){
	y = now.get(Calendar.YEAR);
	
}
else {
	y = Integer.parseInt(y_s);
	
}
if (m_s==null || m_s.equals("") ){
	m = now.get(Calendar.MONTH)+1;
}

else {

	m = Integer.parseInt(m_s);
	if (m < 1){
		m= 12; 
		y = y-1; 
	}
	if(m>12){
		m=1 ; y = y+1; 
	}
}

int val = 0; 


	switch (key){
	case 1: val = m; break; 
	case 3: val = y ; break ; 

	}




int arr []= odao.getOrderStat(key, val, sIdx );




%>
<!DOCTYPE html >


<html>
<head>

<style type="text/css">

a{
text-align: center;
}
a:visited {text-decoration: none; color: gray; }
h2 {
color: white;
text-align: center;
}

body {

   height: 100%;
   min-height: 100%;
   width: 100%;
   text-align: center;
   margin: 0px auto;
   font-family: "Typo_Papyrus B";
}

#bodywrap {
color: white; 
   margin: 0px auto;
   display: inline-block;
   margin-top: 0px;
   background-repeat: no-repeat;
   background-image: url("../img/background1.jpg");
   background-size: cover;
   height:100%;
   
   text-align: left;
  
}

#maintitle {
   width: 850px;
   height: 200px;
   margin-top: 200px;
   margin-left: 30px;
   margin-right: 30px;
   
}

#maintitle1 {
   width: 450px;
   height: 200px;
   display: inline-block;
   float: left;
}

#maintitle2 {
   width: 350px;
   height: 200px;
   display: inline-block;
   float: right;
}

#find {
   width: 350px;
   height: 90px;
   margin-bottom: 15px;
   background-image: url("/semi/img/find.jpg");
}

#coupon_board {
   width: 350px;
   height: 90px;
}

#mainbody {
   width: 850px;
   height: 200px;
   margin: 20px 0px;
    margin-left: 30px;
   margin-right: 30px;
}

#mainbody1 {
   width: 240px;
   height: 200px;
   display: inline-block;
   float: left;
}

#mainbody2 {
   width: 240px;
   height: 200px;
   display: inline-block;
}

#mainbody3 {
   width: 240px;
   height: 200px;
   display: inline-block;
   float: right;
}

#mainbottom {
   width: 850px;
   height: 195px;
   margin: 20px 0px;
    margin-left: 30px;
   margin-right: 30px;
}

#mainbottom1 {
   width: 390px;
   height: 195px;
   display: inline-block;
   float: left;
}

#mainbottom2 {
   width: 390px;
   height: 195px;
   display: inline-block;
   float: right;
}

#headerwrap img {
   width: 150px;
   height: 50px;
}

#headerwrap {
   width: 100%;
   height: 50px;
   font-family: "Typo_Papyrus B";
   font-size: 20px;
   background-color: #BF0920;
}

#headerinner1 {
   display: inline-block;
   width: 200px;
   height: 50px;
   text-align: left;
   margin-left: -10px;
}

#headerinner2 {
   width: 250px;
   height: 50px;
   display: inline-block;
   text-align: right;
   margin-left: 400px;
}

#headerinner2 a {
   text-decoration: none;
   color: black;
}

#footerinner img {
   width: 50px;
   height: 50px;
}

#footerinner p {
   text-align: center;
   font-family: "Typo_Papyrus B";
   color: white;
}


.hGraph ul{ margin:0 50px 0 50px; padding:1px 0 0 0; border:1px solid #ddd; border-top:0; border-right:0; font-size:11px; font-family:Tahoma, Geneva, sans-serif; list-style:none;}
.hGraph li{ position:relative; margin:10px 0; white-space:nowrap; vertical-align:top;}
.hGraph .gTerm{ position:absolute; width:40px; top:0; left:-50px; line-height:20px; text-align:right; color:white; font-weight:bold;}
.hGraph .gBar{ position:relative; display:inline-block; height:20px; border:1px solid #ccc; border-left:0; background:#e9e9e9;}
.hGraph .gBar span{ position:absolute; width:40px; line-height:20px; top:0; right:-50px; color:white;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	
	

<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->
	
	

<div style="text-align: center;">
<h2>매출조회</h2>


<form action="orderStat_ok.jsp" name="orderStat"  >

<input type="radio" name="key" value="1">일간매출조회
<input type="radio" name="key" value="3">월간매출조회
<input type="submit" value="조회">

</form>



<%

if (key == 0 ){
	%>
	
	<%
}

else {

switch(key){

case 1: %>
<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y%>&m=<%=m-1%>">이전</a>
<%=y %>년
<%=m%>월

<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y%>&m=<%=m+1%>">다음</a><br>
<BR><%break;

case 3: %>



<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y-1%>&m=<%=m%>">이전</a>
<%=y%>년

<a href="orderStat_ok.jsp?key=<%=key%>&y=<%=y+1%>&m=<%=m%>">다음</a><BR><%break;
	

}
%>
</div>
<div class="hGraph">
<ul>
<%
for ( int i =0; i< arr.length; i ++){
	%>
	<li><span class="gTerm"><%=(i+1)%> :</span><span class="gBar" style="width:<%=arr[i]%>%"><span>	<%=arr[i] %></span></span></li>
	

	<%
}
%>
</ul>
</div>
<%
 



}
%>


<br>

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>
	










</body>






</html>