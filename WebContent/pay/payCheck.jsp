<%@page import="semi.cart.CartDTO"%>
<%@page import="semi.order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<jsp:useBean id="odao" class="semi.order.OrderDAO"></jsp:useBean>

 <jsp:useBean id="ctdao" class="semi.cart.CartDAO"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>

<style type="text/css">

a:visited {text-decoration: none; color:white;}

 h2{
text-align: left
;

color: #E86274; 
}

h1{text-align: center; color: white;}
 h4{text-align: center; color: white;}


/*
fieldset table {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  margin : 20px 10px;
}
fieldset table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
}
fieldset table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
*/
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

	/*
border-bottom: 2px solid white;
border-left: 2px solid white;
border-right: 2px solid white;
border-top: 2px solid white;

*/
	
}

input { 
color:white;
 
 background-color:transparent; 
 border: 0px; 
 text-align: center;
	
}


.del table{
width: 550px; 

}

.del th {
	border-bottom: 1px dotted white;
	width: 200px; 
}
.del td {
	border-bottom: 1px dotted white;
	text-align: left;

}

.del input {
	color:black;
 
 background-color:white; 
 border: 0px; 
 text-align: left ;
	
}
</style>


<link rel="stylesheet" type="text/css" href="/semi/css/mainLayout.css">
<meta charset=utf-8">
<title>Insert title here</title>
</head>
<body>



<%@include file="/header.jsp"%>
		<div id="bodywrap">

<!-- -------------------------------------------------------------- -->

<h2 style="text-align: center; ">  [<%=sid %>]님의 주문 내역입니다.</h2>

<font color="white">
<h2>  주문 품목</h2>
	<table>	
		<thead>
			<tr >
				<th>품목</th>
				<th>단품가격</th>
				<th>갯수</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
							<%
							int oIdx =Integer.parseInt(request.getParameter("oIdx")) ;
				ArrayList<CartDTO> cartdto = ctdao.myCartList(oIdx);
				if(cartdto==null || cartdto.size()==0){
						
					%><tr>
					<td>no data</td></tr><%
				}
				else {
					for ( int i =0; i< cartdto.size(); i ++){	
						%>
						<tr>
							<td><%=cartdto.get(i).getFood_name() %> </td>
							<td><%=cartdto.get(i).getFood_price() %> </td>
							<td><%=cartdto.get(i).getFood_count()%> </td>
							<td><%=cartdto.get(i).getTotal_price()%> </td>
						</tr>
						
						<%
					}
				
				}
	
	%>
			
			
		
		
		</tbody>
	
	
	</table>
	<%
	
	
	
	OrderDTO dtos = odao.orderCheck(oIdx);
	
	
	
	if ( dtos ==null){
		%>
		no data
		
		<%
	}
	else {
		%>
		
		<h2>배송 정보</h2>
	<table class="del">
	
		
		<tr>	
			<th>받는분</th>
			<td ><%=dtos.getC_name() %> </td>

		</tr>
		<tr>
		
					<th>전화번호</th>
			<td><%=dtos.getC_tel() %></td>	
			
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dtos.getC_addr() %></td>
		</tr>
		<tr>
			<th>전달사항</th>
			<td ><%=dtos.getMemo() %></td>
		</tr>
		
		
	</table>
		<%
	}
	%>
		
			<%
			if (dtos.getPay_type()==1){
				%><h4><%=dtos.getFinal_price() %>원 결제 하셨습니다.</h4>  <%
			}
			else if (dtos.getPay_type()==2){
				%><h4>라이더에게 <%=dtos.getFinal_price()%>원 결제 하세요. </h4> <%
			}
			
			%>



<a href="/semi/index.jsp">메인으로</a></font>
<!-- -------------------------------------------------------------- -->
		</div>
<%@include file="/footer.jsp"%>







</body>
</html>