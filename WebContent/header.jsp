<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
   pageEncoding="UTF-8"%>
   
   <%
   String sname = (String) session.getAttribute("sname");
   String sid = (String) session.getAttribute("sid");
   String stype = (String) session.getAttribute("stype");

   if (stype == null || stype.equals("")) {
      stype = "테스트";
   }
%>

<script>
   function openLogin() {
      window.open("/semi/member/login.jsp", "login", "width=440,height=330");
   }
   function usermod() {

      var whattype = '<%=stype%>';
      
      if(whattype=="고객") {
         location.href = '/semi/member/memberUpdate.jsp';
      } else {
         location.href = '/semi/member/ceoUpdate.jsp';
      }
      

   }
=======
	pageEncoding="UTF-8"%>
	
	<%
	String sname = (String) session.getAttribute("sname");
	String sid = (String) session.getAttribute("sid");
	String stype = (String) session.getAttribute("stype");

	if (stype == null || stype.equals("")) {
		stype = "테스트";
	}
%>

<script>
	function openLogin() {
		window.open("/semi/member/login.jsp", "login", "width=440,height=330");
	}
	function usermod() {

		var whattype = '<%=stype%>';
		
		if(whattype=="고객") {
			location.href = '/semi/member/memberUpdate.jsp';
		} else {
			location.href = '/semi/member/ceoUpdate.jsp';
		}
		

	}
>>>>>>> branch 'master' of https://github.com/jungdaun/semi.git
</script>



<header>
<<<<<<< HEAD
   <div id="headerwrap">
      <div id="headerinner">
         <a href="/semi/index.jsp"><img src="/semi/img/badal.jpg"></a>&nbsp;<%
      if (sname == null || sname.equals("")) {
   %>
   
      <a href="javascript:openLogin()">로그인</a> | <a
         href="/semi/member/joinselect.jsp">회원가입</a> |
   
   <%
      } else {
   %>
   <%=sname%>님 로그인중... | <a href="javascript:usermod()">회원정보수정</a>
      |<a href="/semi/member/logout.jsp">로그아웃</a> |
   
   <%
      }
   %>  <a href="/semi/voc/vocList.jsp">고객센터</a>
      </div>
   </div>
=======
	<div id="headerwrap">
		<div id="headerinner">
			<a href="/semi/index.jsp"><img src="/semi/img/badal.jpg"></a>&nbsp;<%
		if (sname == null || sname.equals("")) {
	%>
	
		<a href="javascript:openLogin()">로그인</a> | <a
			href="/semi/member/joinselect.jsp">회원가입</a> |
	
	<%
		} else {
	%>
	<%=sname%>님 로그인중... | <a href="javascript:usermod()">회원정보수정</a>
		|<a href="/semi/member/logout.jsp">로그아웃</a> |
	
	<%
		}
	%>  <a href="/semi/voc/vocList.jsp">고객센터</a>
		</div>
	</div>
>>>>>>> branch 'master' of https://github.com/jungdaun/semi.git
</header>