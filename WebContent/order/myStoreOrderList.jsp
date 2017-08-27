<!-- 

시간 남으면 할 것 
1. coupon적용 여부, 쿠폰 사용 금액 추가 
2. 주문 시간 subString 으로 자르기 
3. 주문 시간 오른쪽 정렬 

 -->



<%@page import="java.util.Calendar"%>
<%@page import="semi.cart.CartDTO"%>
<%@page import="semi.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <jsp:useBean id="mdao" class="semi.member.MemberDAO"></jsp:useBean>
 <jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>
 <jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
 
 <% 
 String start = request.getParameter("start");
 String end = request.getParameter("end");
 
 Calendar now = Calendar.getInstance();
 int y = now.get(Calendar.YEAR);
 int m = now.get(Calendar.MONTH)+1;
 int d = now.get(Calendar.DATE);
 
 
 String today =  y +"-"+m +"-"+d;
 
 
 if (start ==null || start.equals("") ){
	start =today;
 }
 
 if (end ==null || end.equals("") ){
	 end =today;}
 
 
 
 //System.out.println(start); 
// System.out.println(end); 
 %>
 
 
 
 
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
</style>

<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">

<meta charset=UTF-8">
<title>Insert title here</title>
<style>
#myStoreOrderList{
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
		<div id="myStoreOrderList">

<!-- -------------------------------------------------------------- -->
	
	
	<%


	
	int sIdx =Integer.parseInt((String) session.getAttribute("cstore"));


	if (sid ==null || sid.equals("")){
		
		%>
		<script type="text/javascript">
		
		window.alert ('로그인하세요.');
		window.href = '/index.jsp';
		
		</script>
		<%
		return ; 
	}
	
	
	///////////paging/////////////////////////////////////////////////////////////

	
//필수정보4가지
int totalCnt= odao.getStoreTotalCnt(sIdx);
	



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



	
	
	////////////////////////////////////////////////////////////////////////
	

	%>
	
	<h2>[<%=odao.getStoreName(sIdx) %>]의 주문 이력입니다. </h2>
	<div style="display: inline-block; text-align: center;">
<form action="myStoreOrderList.jsp">	
<h3>날짜를 선택하세요
	<input type="date" name="start" value="<%=start%>">~<input type="date" name="end" value="<%=end %>" > <input type="submit" value="조회">
	<br>
	<a href="myStoreOrderList.jsp?start=<%=today%>&end=<%=today%>">[오늘의 주문]</a>
	<a href="orderStat.jsp">주문통계보기</a>
	</h3>
	</form>
	
	
	<%
	
	ArrayList<OrderDTO> dtos =odao.myStoreOrderList(sIdx, cp, listSize, start, end);
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
			</div>
			<h3>[주문번호: <%=dtos.get(i).getOrder_idx() %>] <%=dtos.get(i).getOrder_date() %></h3>
			<table class="del">
			<tr style="border-bottom: 1px dotted gray;">
			<th >받는분</th>
			<td ><%=dtos.get(i).getC_name() %> </td>
			<th>tel</th>
			<td ><%=dtos.get(i).getC_tel() %> </td>
			
			</tr>
			<tr style="border-bottom: 4px double white;">
			
			<th>배달지</th>
			<td colspan="3"><%=dtos.get(i).getC_addr() %> </td>
			
			</tr>
			
			
			
			<tr>
			<TH colspan="2">품목</TH>
			<TH>갯수</TH>
			<TH >단품가</TH>
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
				String state = "";
				switch(dtos.get(i).getFinish()){
					
					case 0 :	state = "주문완료"; break; 
					case 1:		state = "배달중";break;
					case 2 :	state = "배달완료"; break;
					case -1 : state = "취소완료"; break; 
				
				}
				%>
				<%=state %>

				<%
				
				
				if (dtos.get(i).getFinish()!=2&& dtos.get(i).getFinish()!=-1){
					%>
				
				<form action="changeState.jsp" name="changeState">
				<select name="state">
					
					<option value="0">주문완료</option>
					<option value="1">배달중</option>
					<option value="2">배달완료</option>
				</select>
				<input type="hidden" value="<%=dtos.get(i).getOrder_idx()%>" name="oIdx">
				<input type="submit" value="확인">
				
				</form>
				<a href="deleteStoreOrder.jsp?oIdx=<%=dtos.get(i).getOrder_idx()%>">[주문취소]</a>	
					<%
				}
		
				%>
				
			
					
				</td>
				<th>총 가격</th>
				<td ><%=dtos.get(i).getFinal_price() %> </td>
				
				
			
			</tr>
			
		</table>
		<br><br>

			<%
		}
		
	}
	%>
	
	       <%


            if (userGp !=0 ){
            
            %><a href="myStoreOrderList.jsp?cp=<%=(userGp-1)*pageSize+pageSize%>">&lt;&lt;</a>
            
            
            <% 
            
            
            }
            
            
            for ( int i =userGp*pageSize+1; i<=userGp*pageSize+pageSize ; i ++){
               
               %>&nbsp;&nbsp;&nbsp;<a href="myStoreOrderList.jsp?cp=<%=i %>"><font <%=cp==i?"color='red'":"" %>> <%=i %> </font> </a>&nbsp;&nbsp;&nbsp;<%
               if (i ==totalPg) break; 
            }
            
            
            if ( userGp!= (totalPg/pageSize -(totalPg%pageSize==0? 1:0)) ){
               %><a href="myStoreOrderList.jsp?cp=<%=(userGp+1)*pageSize+1%>">&gt;&gt;</a><%
            }
            %>
               
         
             
            
	
	

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>
	</div>
	
	

	

</body>
</html>