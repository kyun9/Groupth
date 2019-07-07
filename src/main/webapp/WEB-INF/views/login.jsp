<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="vo.UsersVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>로그인</h3>
 <form method="get" action="/mini/register">
 	아이디 <input type="text" name="users_id" required><br>
 	비밀번호 <input type="password" name="password" required><br>
 	<input type="submit" value="로그인">
 	<input type="button" onclick="goRegister(); return false;" value="회원가입">
 </form>
 <% 
 if(request.getAttribute("msg")!=null){
 %>
 <script>
 	alert("${msg}");
 </script>
 <%
 }
 %>
 <script>
 	function goRegister(){
 		location.href="/mini/register";
 	}
 </script>
</body>
</html>