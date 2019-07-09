<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	tmp  
</h1>
<%
if(session.getAttribute("loginUser")!=null){
%>
<h2>로그인아이디 : ${ sessionScope.loginUser.users_id }</h2>
<form method="get" action="/mini/logout">
<input type="submit" value="로그아웃">
<input onclick="goMypage(); return false;" type="button" value="마이페이지">
<input onclick="goBoard(); return false;" type="button" value="게시판">
</form>
<%
}else{
%>
<button onclick="goLogin()">로그인화면</button>
<button onclick="goRegister()">회원가입화면</button>
<%
}
%>
<script>
	function goLogin(){
		location.href="/mini/login/"
	}
	function goRegister(){
		location.href="/mini/register/"
	}
	function goMypage(){
		location.href="/mini/mypage/"
	}
	function goBoard(){
		location.href="/mini/board/"
	}
</script>
<% 
 if(request.getParameter("msg")!=null){
 %>
 <script>
 	alert("<%=request.getParameter("msg")%>");
 </script>
 <%
 }
 %>
</body>
</html>
