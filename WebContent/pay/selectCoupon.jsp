


<!-- add css  -->


<%@page import="semi.coupon.CouponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cdao" class="semi.coupon.CouponDAO" ></jsp:useBean>

<%

request.setCharacterEncoding("utf-8");

//String sid=(String) session.getAttribute("sid");
//System.out.println (user_id);
int tempPrice = Integer.parseInt(request.getParameter("tp"));

String sname = (String) session.getAttribute("sname");


String sid =(String)session.getAttribute("sid");


//System.out.println (tempPrice);


%>

<!DOCTYPE html>
<html>
<head>
<!-- 
<script type="text/javascript">
 function autoWrite() {
	var couponIdx = document.couponSelect.couponOption.value;
	document.couponSelect.coupon.value=couponIdx; 
}
</script>
 -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


a:visited {text-decoration: none; color: gray; }

body {
	background-image:  url("/semi/img/pay/bg.jpg");

	
/*	 background-color: pink; */
	
	background-repeat:no-repeat; 

	background-attachment: fixed;


}

h2{
text-align: center;
color: #E86274;

}

 table
{

 border-collapse:collapse;
background-color: rgba( 255, 255, 255, 0.2 )

}


 table th {

	
	color: white;
	background-color:  rgba( 255, 255, 255, 0.2 );
	
	border-left: 1px solid white;
	
	/* border-bottom: 2px double white; */
}

table td {
		border-left: 1px solid white;
		color: white;
	
}


</style>


</head>
<body>

<h2 >[<%=sname%>]님의 쿠폰 </h2>
		<%
		
		ArrayList<CouponDTO> dtos= cdao.myCouponList(sid);
		
		
		if ( dtos.size()==0|| dtos==null){
			%>
			보유하신 쿠폰이 없습니다.  
			<%
		}
		
		else {
			
			for ( int i =0; i< dtos.size(); i ++){
				
				
				
				%>
				<table >
					
						<tr>	<th>쿠폰번호</th>
								<th>쿠폰이름 </th> 
								<th>음식 종류</th>
								<th>할인액(률)</th>
								<th>사용기한</th>
								<%
								if (dtos.get(i).getIs_used()!=1 ){
									%>
									<td rowspan="2"><a href="selectCoupon_ok.jsp?tp=<%=tempPrice%>&cIdx=<%=dtos.get(i).getCoupon_idx()%>">
									<font color=pink><b>사용하기</b></font></a></td>
								
									<%
								}
								else {
									%>
									<td rowspan="2">사용불가</td>
									<%
								}
								%>
								
								<!-- cIdx: user_coupon_idx -->   
							
							
						</tr>	
						<tr>
							<td><%=dtos.get(i).getCoupon_idx() %></td>
							<td><%=dtos.get(i).getCoupon_name() %></td> 
							
							<td><%=dtos.get(i).getCoupon_food_type() %></td>
							
							<%
							if (dtos.get(i).getCoupon_type()==1){
								%>
								<td><%=dtos.get(i).getCoupon_value() %>원</td>
								<%
								
							}
							else {
								
								%>
								<td><%=dtos.get(i).getCoupon_value() %>%할인</td>
								<%
							}
							%>

							
					
							<td><%=dtos.get(i).getCoupon_end() %></td>
								
							
						</tr>

					
					
	
					
				</table>
				<br>
			
		<%
			}
		}
		%>
		
		<h4 style="text-align: right;"><a href="selectCoupon_ok.jsp?tp=<%=tempPrice%>&cIdx=0">
		
		<font color="white">[취소]</font></a></h4>

</body>
</html>