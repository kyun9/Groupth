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
		ArrayList<FieldVO> field = (ArrayList<FieldVO>) request.getAttribute("field");
		if (!field.isEmpty()) {
			for (FieldVO type : field) {
	%>
		<input type='checkbox' name='field' value='<%=type.getType()%>' /><%=type.getType()%>
 	<%}} %>
 	<br>
 		<input type="text" name="key">
 		<input type="submit" value="검색"><br>
	</form>
	
		<button onclick="goCreateGroup()">그룹 생성하기</button>
		<script>
			function goCreateGroup(){
				location.href="/mini/group/createGroup";
			}
		</script>
</body>
</html>