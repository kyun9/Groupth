<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.FieldVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("loginUser") != null) {
	%>
	<h2>로그인아이디 : ${ sessionScope.loginUser.user}</h2>
	<%
		}
	%>
	
	<form method="get" action="/mini/group">
		관심분야 <br>
	<%
		ArrayList<String> field = (ArrayList<String>) request.getAttribute("field");
		if (!field.isEmpty()) {
			for (String type : field) {
	%>
		<input type='checkbox' name='field' value='<%=type%>' /><%=type%>
 	<%}} %>
 	<br>
 		<input type="text" name="key">
 		<input type="submit" value="검색"><br>
	</form>
	
		<button onclick="createGroup()">그룹 생성하기</button>
		<script>
			function createGroup(){
				location.href="/mini/group/createGroup";
			}
		</script>
</body>
</html>