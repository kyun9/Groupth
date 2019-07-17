<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.Group_InfoVO, vo.Login_InfoVO, vo.NoticeVO, java.util.ArrayList"%>
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
		제한인원 : <%=content.getCount_mem() %>/<%=content.getLimit_mem() %><br>
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
	<%if (request.getAttribute("confirm") != null) { %>
	<button onclick ="writeNotice()">Notice Write</button>
	<%}
		ArrayList<NoticeVO> noticelist = (ArrayList<NoticeVO>) request.getAttribute("noticelist");
		if (!noticelist.isEmpty()) {
	%>
	<table>
		<tr>
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th> 
		</tr>
		<% for (NoticeVO nList : noticelist) {%>
		<tr>
			<td><%=nList.getTitle()%></td>
			<td class="b_title" style="cursor: pointer"><%=nList.getWriter()%></td>
			<td><%=nList.getWritedate()%></td>
		</tr>
		<tr class="b_content">
			<td>내용 : <%=nList.getContent()%></td>
			<td><a href="/mini/resources/files/<%=nList.getFiles()%>">다운로드 : <%=nList.getFiles()%></a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%} %>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(".b_content").hide();
		$(".b_title").click(function(){
			if($(this).hasClass("on")){
				$(".b_content").hide();
				$(this).removeClass("on");
			}else{
				$(".b_content").show();
				$(this).addClass("on");
			}
			
		});
	</script>
	
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