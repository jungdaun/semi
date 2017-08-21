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

<!-- -------------------------------------------------------------- -->
	
	
	<%


	if (sid ==null || sid.equals("")){
		
		%>
		<script type="text/javascript">
		
		window.alert ('로그인하세요.');
		window.href = '/index.jsp';
		
		</script>
		<%
		return ; 
	}
	
	
	
	int sIdx =21; 
	//Integer.parseInt((String) session.getAttribute("cstore"));

	
//	 sid =(String) session.getAttribute("sid");
	
	%>
	
	<h2>[<%=odao.getStoreName(sIdx) %>]의 주문 이력입니다. </h2>
	
	<%

//	System.out.println (sid);
	
	
	
//	int mem_idx = mdao.getMemIdx(sid);
//	System.out.println (mem_idx);
	
	ArrayList<OrderDTO> dtos =odao.myStoreOrderList(sIdx);
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

			<%
		}
		
	}
	%>
	

<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>
	
	
	

	

</body>
</html>