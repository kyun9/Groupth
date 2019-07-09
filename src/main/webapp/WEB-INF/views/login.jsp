<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page session="true" %>
 <%@ page import="vo.UsersVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("loginUser")!=null){
%>
<script>
	window.location.href="/mini/";
</script>
<%} %>
<h3>로그인</h3>
 <form method="post" action="/mini/loginProcess">
 	아이디 <input type="text" name="idVal" required><br>
 	비밀번호 <input type="password" name="pwdVal" required><br>
 	<input type="submit" value="로그인">
 	<input type="button" onclick="goRegister(); return false;" value="회원가입">
 </form>
 <script>
 	function goRegister(){
 		location.href="/mini/register";
 	}
 </script>
</body>
</html>