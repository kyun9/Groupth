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
if(session.getAttribute("loginUser")!=null){
%>
	<h2>로그인아이디 : ${sessionScope.loginUser.user}</h2>
<%

Login_InfoVO user = (Login_InfoVO)session.getAttribute("loginUser");
if(user.getUser().equals(request.getParameter("writer"))){
%>
<form method="get" action="/mini/board/content/edit">
<input type="hidden" name="action" value="update">
<input type="submit" value="수정하기">
<input type="button" onclick="boardDelete(); return false;" value="삭제하기">
</form>
<script>
	function boardDelete(){
		alert("아직 만드는중");
	}
</script>
<%	
}}
%>
hi content
<button onclick="goBoard()">뒤로가기</button>
<script>
function goBoard(){
	 location.href="<%=request.getHeader("referer") %>";
 }
</script>
</body>
</html>