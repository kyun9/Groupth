<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.Group_InfoVO"%>
    <%@ page import="vo.Login_InfoVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>th {
	border: 2px solid black;
}

td {
	border-bottom: 1px dotted black;
	width: 200px;
	text-align: center;
}</style>
</head>
<body>
	<%
		if (session.getAttribute("loginUser") != null) {
	%>
	<h2>로그인아이디 : ${ sessionScope.loginUser.user}</h2>
	<%
		}
		if (request.getAttribute("content") != null) {
			Group_InfoVO content = (Group_InfoVO) request.getAttribute("content");
	%>
		분야 : <%=content.getType() %>
		그룹 명 : <%=content.getG_name() %><br>
		스터디 내용 : <%=content.getG_content() %><br>
		그룹 리더 : <%=content.getLeader() %><br>
		제한인원 : <%=content.getLimit_mem() %><br>
		<img src="../resources/Gimg/<%=content.getImg()%>" width=200px height=200px>
	
	<%
		
		if (session.getAttribute("loginUser") != null) {
			Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
			if (user.getUser().equals(content.getLeader())) {
	%>
	
	<!-- 다시 post로 바꾸어주기 -->
	<form action="/mini/group/manage" method="get">
		<input type="hidden" name ="gid" value="<%=content.getGid()%>">
		<input type="submit" value ="그룹관리">
	</form>
	<%}
			else{
			%>
			<form action="/mini/group/content" method="get">
				<input type="hidden" name="action" value="apply">
				<input type="hidden" name="gid" value="<%=content.getGid()%>">
				<input type="hidden" name="uid" value="<%=user.getUser()%>">
				<%
				if (request.getAttribute("confirm") != null) {
				%>
				<h3>${confirm}</h3>
				<%} else{%>
				<input type="submit" value ="그룹 가입하기">
				<% }%>
			</form>
			<%
			}
		}else{%>
			<a href="/mini/login">로그인하고 가입하기</a>
		<%
		}} if (request.getAttribute("msg") != null) {%>
			<script>
			alert("${msg}");
			</script>
		<%}%>
		
	<br><br><br>
	<!-- 게시판  -->
	<button onclick ="writeNotice()">Notice Write</button>
	<table>
		<tr>
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th> 
		</tr>
		<tr>
			<td>2</td>
			<td>3</td>
			<td>4</td>
		</tr>
	</table>
	<script>
			<%
			if (request.getAttribute("content") != null) {
				Group_InfoVO content = (Group_InfoVO) request.getAttribute("content");
			%>
		function writeNotice(){
			location.href="/mini/group/content/write?gid=<%=content.getGid()%>";
		}
			<%}%>
	</script>
</body>
</html>