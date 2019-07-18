<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.UsersVO, vo.Login_InfoVO, vo.NoticeVO, vo.Group_InfoVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
   
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
	
	<br><br>
	<span id = "chkMsg"></span>
	<form>
		<input type="hidden" name="gid" id="gid" value="<%=request.getParameter("gid")%>">
		<input type="hidden" name="lat" id="mapLat" />
		<input type="hidden" name="lng" id="mapLng" />
		<input type="text" name ="location" id="location" value="서울시 강남구 역삼동" />
		<input type="button" id="findloc" value="위치찾기" />
		<input type="button" id="storeLocation" value="저장하기">
	</form>
	<div id="mapid" style="width: 600px; height: 400px;"></div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>



		$(document).ready(function(){
			
			var mymap =L.map('mapid').setView([37.566, 126.978], 13);
			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 18,
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
					'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
					'Imagery <a href="https://www.m/* apbox.com/">Mapbox</a>',
				id: 'mapbox.streets'
			}).addTo(mymap);
			
			function onMapClick(e) {
				$(".leaflet-marker-pane img").remove();
				$(".leaflet-popup-pane").remove();
				$(".leaflet-shadow-pane").remove();
				var lat = (e.latlng.lat);
			    var lng = (e.latlng.lng);
			    L.marker([lat, lng]).addTo(mymap);	
			    
			    $("input#mapLng").val(lng);
			    $("input#mapLat").val(lat);
			}
			
			$("#findloc").click(function(){
			
				var address = $("#location").val();
				var lat;
				var lng;
				
				if (address) {			
					$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY&address="+encodeURIComponent(address), function(data) {
						lat = data.results[0].geometry.location.lat;
						lng = data.results[0].geometry.location.lng;
						
						$("input#mapLng").val(lng);
					    $("input#mapLat").val(lat);
					    
						if(mymap)
							mymap.remove();
						mymap = L.map('mapid').setView([lat, lng], 16)
						L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
							maxZoom: 18,
							attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
								'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
								'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
							id: 'mapbox.streets'
						}).addTo(mymap);
		
						 L.marker([lat, lng]).addTo(mymap);

						 mymap.on('click', onMapClick);
					
					});
				}		 
			
			});
			
			mymap.on('click', onMapClick);
		});
		
		$("#storeLocation").click(function(){
		    var gid = $('#gid').val();
		    var lat = $('#mapLat').val();
		    var lng = $('#mapLng').val();
		    var location = $('#location').val();
		    console.log(gid);
		    console.log(lat);
		    console.log(lng);
		    console.log(location);
		    $.ajax({
		        url:'/mini/group/manage/storeLocation?gid='+gid+'&lat='+lat+'&lng='+lng+'&location='+location,
		        type:'get',
		        success:function(data){
		            if($.trim(data)==1){
		                $('#chkMsg').html("저장하였습니다.").attr("style","color:black");                
		            }else{
		                $('#chkMsg').html("저장하지 못하였습니다.").attr("style","color:red");
		            }
		        },
		        error:function(){
		                alert("에러입니다");
		        }
		    });
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
			
		function deleteGroup(){
			location.href="/mini/group/manage?action=deleteGroup&gid=<%=request.getParameter("gid")%>";
		}
	</script>
	
	
</body>
</html>