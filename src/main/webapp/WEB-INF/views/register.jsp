<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h3>회원가입</h3>
 <form method="post" action="/mini/register">
 	아이디 <input type="text" name="users_id" required><br>
 	이름 <input type="text" name="users_name" required><br>
 	비밀번호 <input type="password" name="password" required><br>
 	이메일 <input type="email" name="email" required><br>
 	<input type="submit" value="가입">
 	<input type="reset" value="재작성">
 </form>
</body>
</html>