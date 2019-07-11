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
	<h2>로그인아이디 : ${sessionScope.loginUser.user}</h2>
	<%
		}
	%>
	<form method="get" action="/mini/board/content/edit">
		작성자 : ${sessionScope.loginUser.user}<br> 
		<input type="text" name="title" placeholder="제목을 입력해주세요" required size=48><br>
		<textarea cols="50" rows="8" name="content" required placeholder="내용을 입력해주세요."></textarea>
		<br> <input type="hidden" name="action" value="update"> 
		<%
			Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
			if (user.getUser().equals(request.getParameter("writer"))) {
		%>
		<input type="submit" value="수정하기"> 
		<input type="button" onclick="boardDelete(); return false;" value="삭제하기">
		<%}
		%>
	</form>
	hi content
	<button onclick="goBoard()">뒤로가기</button>
	<script>
		function goBoard(){
		 location.href="<%=request.getHeader("referer")%>";
		}
		function boardDelete(){
			location.href="/mini/board/content?action=delete&bid=<%=request.getParameter("bid")%>"
		}
	</script>
</body>
</html>