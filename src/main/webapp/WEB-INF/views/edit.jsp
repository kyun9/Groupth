<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Login_InfoVO"%>
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
	<h1>hi edit</h1>
	<form method="post" action="/mini/board/content/edit">
	<%
		String action= request.getParameter("action");
		if(action.equals("insert")){
	%>
		<input type="hidden" name="action" value="insert">
	<%}else if(action.equals("update")){ %> 
		<input type="hidden" name="action" value="update">
	<%} %>
		<input type="hidden" name="writer" value="${sessionScope.loginUser.user}">
		<input type="text" name="title" placeholder="제목을 입력해주세요" required size=48><br>
		<textarea cols="50" rows="8" name="content" required
			placeholder="내용을 입력해주세요."></textarea><br> 
		<input type="submit" value="저장"> <input type="reset"
			value="재작성"> <input type="button"
			onclick="back(); return false;" value="뒤로가기">
	</form>
	<script>
		function back(){
			location.href="<%=request.getHeader("referer") %>";
		}
	</script>
</body>
</html>