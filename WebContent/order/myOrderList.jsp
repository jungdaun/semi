<%@page import="java.util.Calendar"%>
<%@page import="semi.cart.CartDTO"%>
<%@page import="semi.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	

 <jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>
 <jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>
 <jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<!DOCTYPE html >
<html>

<head>
<style type="text/css">

a:visited {text-decoration: none; color: gray; }
h2{

color: #E86274; 
}
h3{

text-align: left;
color: #E6E6E6;

}

 table
{
width: 600px ; 
 border-collapse:collapse;
background-color: rgba( 255, 255, 255, 0.2 )
}

 table th {
	

	/*
	border-bottom: 2px dotted white;
border-left: 2px solid white;
border-right: 2px solid white;
border-top: 2px solid white;

*/
	
	color: white;
	background-color:  rgba( 255, 255, 255, 0.2 );
	
	/* border-bottom: 2px double white; */
}


 table td{
color: white;
	/*
border-bottom: 2px solid white;
border-left: 2px solid white;
border-right: 2px solid white;
border-top: 2px solid white;

*/
	
}
#myOrderList{
	width: 850px;
	height: 100%;
	margin-top: 200px;
	margin-bottom: 160px;
	margin-left: 30px;
   margin-right: 30px;
}
</style>

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">

<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
/*
Calendar now = Calendar.getInstance();
int y= (now.get(Calendar.YEAR)-2000) ;
int m= (now.get(Calendar.MONTH)+1); 
int d= (now.get(Calendar.DATE));

int h =( now.get(Calendar.HOUR_OF_DAY));
int min = now.get(Calendar.MINUTE);
int s = now.get(Calendar.SECOND);

int orderIdx = y+ m+ d+h+min+s ; 
System.out.println (orderIdx);

*/




%>
 
	
	
	
	
	

<%@include file="/header.jsp"%>
		<div id="bodywrap">
<div id="myOrderList">
<!-- -------------------------------------------------------------- -->
	
		
	<%
	
	int mem_idx = mdao.getMemIdx(sid);
	//System.out.println (mem_idx);
	


/////////////paging관련



//필수정보4가지
int totalCnt= odao.getTotalCnt(mem_idx);




//sql : select count (*) from jsp_bbs

int listSize = 5; 
// 보여줄 게시물 수 

int pageSize = 5; 
//보여줄 페이지 수 


String cp_s = request.getParameter("cp");
if (cp_s==null|| cp_s.equals("")){
	
	cp_s="1";
}
int cp = Integer.parseInt(cp_s);

//1. total pg 
int totalPg = totalCnt/listSize+1;
if (totalCnt % listSize==0){
	totalPg= totalPg-1; 
	
}

int userGp =cp/pageSize; 
if ( cp %pageSize==0){
	userGp= userGp-1;
}




%>
	<%

	if (sid ==null || sid.equals("")){
		
		%>
		<script type="text/javascript">
		
		window.alert ('로그인하세요.');
		window.location.href ='/semi/index.jsp';
		
		</script>
		<%
		return ; 
	}
//	 sid =(String) session.getAttribute("sid");
	
	%>
	
	<h2>[<%=sname %>]님의 주문 내역입니다. </h2>
	
	<%

	//System.out.println (sid);

	ArrayList<OrderDTO> dtos =odao.myOrderList(mem_idx, cp, listSize);
	%>
	
	
	
	
		

	<%
	
	
	
	if (dtos ==null || dtos.size()==0){
		%>
		no data
		<%
	}
	
	else {
		for ( int i =0; i< dtos.size(); i ++){
			
			ArrayList<CartDTO> cartdtos = ctdao.myCartList(dtos.get(i). getOrder_idx());
			
			
			
			
			%>
			<h3>[<%=odao.getStoreName( dtos.get(i).getStore_idx()) %>]</h3>
			 <div style="display: inline-block; text-align: center;">
			<table class="del">
			<tr style="border-bottom: 4px double white;">
				<th >주문번호</th>
			<td ><%=dtos.get(i).getOrder_idx() %> </td>
			<th>주문날짜</th>
			<td ><%=dtos.get(i).getOrder_date() %> </td>
			</tr>
			
			
			
			<tr>
			<TH colspan="2">품목</TH>
			<TH>갯수</TH>
			<TH>단품가</TH>
			</tr>
			
			<%
			
			for ( int j =0; j<cartdtos.size(); j ++){
				%>
				
				
				<tr>
				
				<td colspan="2"><%=cartdtos.get(j).getFood_name() %> </td>
				<td><%=cartdtos.get(j).getFood_count() %> </td>
				<td><%=cartdtos.get(j).getFood_price()%> </td></tr>
				<%
			}
			
			
			%>
			<tr style="border-top: 1px dotted gray;">
				<th>배달상황</th>
				<td >
				<%
				switch(dtos.get(i).getFinish()){
					
					case 0 :	%>주문완료 <a href="deleteOrder.jsp?oIdx=<%=dtos.get(i).getOrder_idx()%>">[취소하기]</a><% break;
					case 1:		%>배달중<% break;
					case 2 :	%>배달 완료<% break;
					case -1 : %><font color="gray">취소 완료</font><% break; 
				
				}
				
				
				%>
				
				</td>
				<th>총 가격</th>
				<td ><%=dtos.get(i).getFinal_price() %> </td>
				
				
			
			</tr>
			
		</table>
		</div>
		<%if (dtos.get(i).getFinish()== 2){
			%>
			
				<p align="right" ><font color="#D8D8D8"><a href="#">[리뷰쓰기]</a></font></p>
			<!--  dtos.get(i).getOrder_idx  -->
			<%
		}
		
		%>
		
		<br>
			<%
		}
		
	}
	%>
	
	
               
               <%


            if (userGp !=0 ){
            
            %><a href="myOrderList.jsp?cp=<%=(userGp-1)*pageSize+pageSize%>">&lt;&lt;</a>
            
            
            <% 
            
            
            }
            
            
            for ( int i =userGp*pageSize+1; i<=userGp*pageSize+pageSize ; i ++){
               
               %>&nbsp;&nbsp;&nbsp;<a href="myOrderList.jsp?cp=<%=i %>"><font <%=cp==i?"color='red'":"" %>> <%=i %> </font> </a>&nbsp;&nbsp;&nbsp;<%
               if (i ==totalPg) break; 
            }
            
            
            if ( userGp!= (totalPg/pageSize -(totalPg%pageSize==0? 1:0)) ){
               %><a href="myOrderList.jsp?cp=<%=(userGp+1)*pageSize+1%>">&gt;&gt;</a><%
            }
            %>
               
         
             
            
	

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>
	</div>
	
	

	

</body>
</html>