<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	tmp  
</h1>
<button onclick="goLogin()">로그인화면</button>
<button onclick="goRegister()">회원가입화면</button>
<script>
	function goLogin(){
		location.href="/mini/login/"
	}
	function goRegister(){
		location.href="/mini/register/"
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
