<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.UsersVO, vo.Login_InfoVO, vo.NoticeVO, vo.Group_InfoVO, java.util.ArrayList"%>
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
		ArrayList<UsersVO> tempMember = (ArrayList<UsersVO>) request.getAttribute("tempMember");
		%><h3>ㅁ 가입 신청자 목록</h3><%
		if(!tempMember.isEmpty()){
			for(UsersVO mem : tempMember){	
	%>
		멤버 아이디 : <%=mem.getUsers_id()%>
		<a href="/mini/group/manage?gid=<%=request.getParameter("gid")%>&uid=<%=mem.getUsers_id()%>&action=welcomeApplicant"><img src="../resources/static/welcome.png" width="25" height="25"></a>
		<a href="/mini/group/manage?gid=<%=request.getParameter("gid") %>&uid=<%=mem.getUsers_id()%>&action=rejectApplicant"><img src="../resources/static/reject.png" width="25" height="25"></a>
		<br>
	<%
			}}
		else{%>
			신청자가 없습니다.
		<%}
	%>
	<%
		ArrayList<UsersVO> currentMember = (ArrayList<UsersVO>) request.getAttribute("currentMember");
		%><h3>ㅁ 그룹멤버 목록</h3><%
		if(!currentMember.isEmpty()){
			for(UsersVO mem : currentMember){	
			if (session.getAttribute("loginUser") != null) {
				Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
				if (user.getUser().equals(mem.getUsers_id())) {
		%>
			 <img src="../resources/static/leader.png" width="25" height="25">그룹장 :
		<%}else {%>
			<a href="/mini/group/manage?gid=<%=request.getParameter("gid") %>&uid=<%=mem.getUsers_id()%>&action=dropApplicant"><img src="../resources/static/drop.png" width="25" height="25"></a>
			멤버 :
		<%}}%> 
			<%=mem.getUsers_id()%> <br>
		<%}}else{%>
			멤버가 없습니다.
		<%}%>
		
		<br>
		<br>
	<button onclick ="writeNotice()">공지 작성하기</button>
	<%
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
			<td><%=nList.getWritedate()%><a href="/mini/group/noticeDelete?nid=<%=nList.getNid()%>&gid=<%=request.getParameter("gid")%>">삭제</a></td>
		</tr>
		<tr class="b_content"> 
			<td>내용 : <%=nList.getContent()%></td>
			<%if(nList.getFiles()!=null){ %>
			<td><a href="/mini/resources/files/<%=nList.getFiles()%>" download>다운로드 : <%=nList.getFiles()%></a></td>
			<%} %>
		</tr>
		<%
			}
		%>
	</table>
	<%} %>
	<br><br>
	<button onclick="deleteGroup()">그룹 삭제</button>
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
			
		function deleteGroup(){
			location.href="/mini/group/manage?action=deleteGroup&gid=<%=request.getParameter("gid")%>";
		}
	</script>
	
	
</body>
</html>