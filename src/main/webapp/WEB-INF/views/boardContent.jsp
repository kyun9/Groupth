<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Login_InfoVO"%>
<%@ page import="vo.BoardVO"%>
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
	<%
		if (request.getAttribute("listone") != null) {
			BoardVO one = (BoardVO) request.getAttribute("listone");
	%>
	<form method="get" action="/mini/board/content/edit">
		번호 : <%= one.getBid() %> 조회수: <%= one.getCnt() %><br>
		작성자 : <%= one.getWriter() %><br>
		날짜 : <%= one.getWritedate() %><br> 
		제목 : <%= one.getTitle() %><br>
		내용 : <%= one.getContent() %><br><br>
		
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="bid" value="<%= one.getBid() %>"> 
		<input type="hidden" name="title" value="<%= one.getTitle() %>"> 
		<input type="hidden" name="content" value="<%= one.getContent() %>"> 
		
		<%
		if (session.getAttribute("loginUser") != null) {
			Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
			if (user.getUser().equals(request.getParameter("writer"))) {
		%>
		<input type="submit" value="수정하기"> 
		<input type="button" onclick="boardDelete(); return false;" value="삭제하기">
		<%}}
		%>
	</form>
	<%
		}
	%>
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