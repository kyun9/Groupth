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
		if (session.getAttribute("loginUser") != null) {
	%>
	<h2>로그인아이디 : ${ sessionScope.loginUser.user}</h2>
	<%
		}
	%>
	
	<form method="post" action="/mini/group/content/write" enctype="multipart/form-data">
		<input type="hidden" name="gid" value="<%=request.getParameter("gid")%>">
		<input type="hidden" name="writer" value="${sessionScope.loginUser.user}">
		Title : <input type = "text" name = "title" required><br>
		Content : <br>
		<textarea cols="50" rows="8" name="content" required placeholder="내용을 입력해주세요."></textarea><br>
		Upload File : <input type="file" name="file"><br>
		<input type="submit" value="enroll">
		<input type="reset" value="reset">
		<input type="button" onclick="goBack()" value="cancle">
	</form>
	<script>
		function goBack(){
			location.href="<%=request.getHeader("referer") %>";
		}
	</script>
</body>
</html>