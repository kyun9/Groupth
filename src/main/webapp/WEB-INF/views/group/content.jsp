<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.Group_InfoVO, vo.Login_InfoVO, vo.NoticeVO, vo.GroupVO, java.util.ArrayList"%>
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
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<div id="mapid" style="width: 600px; height: 400px;"></div>
	<script>
	$(document).ready(function(){
		<% GroupVO location = (GroupVO) request.getAttribute("findLoc");
			System.out.println(location);
			if(location.getLat()!=null){
		%>
		var mymap =L.map('mapid').setView([<%=location.getLat()%>, <%=location.getLng()%>], 15);
		L.marker([<%=location.getLat()%>, <%=location.getLng()%>]).addTo(mymap)
		.bindPopup("<%=location.getLocation()%>").openPopup(); 
		<%}else{%>
		var mymap =L.map('mapid').setView([37.566, 126.978], 13);
		<%}%>
		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
			maxZoom: 18,
			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery <a href="https://www.m/* apbox.com/">Mapbox</a>',
			id: 'mapbox.streets'
		}).addTo(mymap);
	});
	</script>
	
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