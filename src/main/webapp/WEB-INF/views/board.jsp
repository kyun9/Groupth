<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
	text-shadow: 6px 2px 2px silver;
}

body {
	margin: 0 auto;
	width: 60%;
}

th {
	border: 2px solid black;
}

td {
	border-bottom: 1px dotted black;
	width: 200px;
	text-align: center;
}

tr:hover {
	background-color: silver;
	font-weight: bold;
}

td:nth-child(2) {
	width: 400px;
	text-align: left;
}

a {
	text-decoration: none;
}

a:visited {
	color: black;
}
</style>
</head>
<body>
	<%
if(session.getAttribute("loginUser")!=null){
%>
	<h2>로그인아이디 : ${ sessionScope.loginUser.user}</h2>
	<%
}
%>
	<h1>게시판</h1>
	<%
		ArrayList<BoardVO> list = (ArrayList<BoardVO>) request.getAttribute("list");
		if (!list.isEmpty()) {
	%>
	<hr>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			for (BoardVO vo : list) {
		%>
		<tr>
			<td><%=vo.getBid()%></td>
<%-- 			<td><a href='/mini/board?action=read&newsid=<%=vo.getBid()%>'><%=vo.getTitle()%></a></td> --%>
			<td><a href='/mini/board/content?bid=<%=vo.getBid()%>&writer=<%=vo.getWriter()%>&action=read'><%=vo.getTitle()%></a></td>
			<td><a
				href='/mini/board?action=listwriter&writer=<%=vo.getWriter()%>'><%=vo.getWriter()%></a></td>
			<td><%=vo.getWritedate()%></td>
			<td><%=vo.getCnt()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} else {
	%>
	<script>
		alert("찾는 내용이 없습니다.");
		document.location.href="/mini/board";
	</script>
	<%
		}
	%>
	<br>
	<div align="center">
		<form method="get" action="/mini/board">
			<select name="searchType">
				<option value="title">제목</option>
				<option value="bid">번호</option>
				<option value="writer">작성자</option>
			</select> <input type="hidden" name="action" value="search"> <input
				type="text" name="key"> <input type="submit" value="뉴스검색">
		</form>
	</div>
	<br>
	<div align="center">
		<button onclick="moveHome()">홈으로</button>
<%
if(session.getAttribute("loginUser")!=null){
%>
		<button onclick="moveWrite()">게시글 작성</button>
<%
}
%>
	</div>
	<br>
	
	<%
		
		if (request.getAttribute("msg") != null) {
	%>
	<script>
		alert("${msg}");
	</script>
	<%
		}
	%>
	<script>
		function displayDiv(type){
			if(type==1)
				document.getElementById("write").style.display="none";
			else if(type==2)
				document.getElementById("search").style.display="none";
		}
		function moveWrite(){
			location.href="/mini/board/content/edit?action=insert"
		}
		function deleteNews(id){
			location.href="/mini/board?action=delete&newsid="+id;
		}
		function moveHome(){
			location.href="/mini";
		}
		
	</script>
	<%
		if (request.getAttribute("listone") != null) {
			BoardVO one = (BoardVO) request.getAttribute("listone");
	%>
	<div id="search" align="center">
		<h2>뉴스 내용</h2>
		<form method="post" action="/mini/board">
			<input type="hidden" name="action" value="update"> <input
				type="hidden" name="id" value=<%=one.getBid()%>> <input
				type="text" name="writer" value=<%=one.getWriter()%> size=48><br>
			<input type="text" name="title" value=<%=one.getTitle()%> size=48><br>
			<textarea cols="50" rows="8" name="content"><%=one.getContent()%></textarea>
			<br> <input type="button" value="확인"
				onclick="displayDiv(2); return false;"> <input type="submit"
				value="수정"> <input type="button"
				onclick="deleteNews(<%=one.getBid()%>)" value="삭제">
		</form>
	</div>
	<%
		}
	%>
</body>
</html>