<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.UsersVO,vo.GroupVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta charset="utf-8" />
    
    <title>Groupth</title>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

    <link rel="stylesheet" type="text/css" href="/mini/resources/file/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/mini/resources/file/css/respond.css" />

    <!--[if lt IE 9]>
       <script src="/mini/resources/file/js/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
<dl class="skip">
	<dt class="blind"><strong>skip navigation</strong></dt>
    <dd><a href="#content">skip to content</a></dd>
</dl>
<div id="wrap">
	
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<script>
		function myInfo(){
			document.getElementById("myInfo").style.display="block";
			document.getElementById("settingGroup").style.display="none";
			$(".info").addClass("on");
			$(".group").removeClass("on");
		}
		function myGroup(){
			document.getElementById("settingGroup").style.display="block";
			document.getElementById("myInfo").style.display="none";
			$(".group").addClass("on");
			$(".info").removeClass("on");
		}
	</script>
	<div id="content">
		
		<div id="myPageBox">
			<div id="myPageNav">
				<h3>마이페이지</h3>
				<ul>
					<li class="info on"><a onclick="myInfo()">내 정보 수정</a></li> 
					<li class="group"><a onclick="myGroup()">내 그룹 관리</a></li>
				</ul>
			</div>
			<div id="myInfo" style="display: block">
				<h4>내 정보 수정</h4>
				<div class="padding">
					<%
						if(request.getAttribute("showUser") != null){
							UsersVO vo = (UsersVO)request.getAttribute("showUser");
						
					%>
					<form method="post" action="/mini/mypage/myInfo">
						<input type="hidden" name="action" value="change" />
						<div class="input_box">
							<div class="title">아이디</div>
							<div class="input id_value"><%= vo.getUsers_id() %></div>
						</div>
						<div class="input_box">
							<div class="title">패스워드</div>
							<div class="input"><input type="password" name="password" value="<%= vo.getPassword() %>" placeholder="패스워드를 입력하세요." required /></div>
						</div>
						<!-- <div class="input_box">
							<div class="title">패스워드 확인</div>
							<div class="input"><input type="text" name="password_confirm" placeholder="패스워드를 입력하세요." /></div>
						</div> -->
						<div class="input_box">
							<div class="title">이름</div>
							<div class="input"><input type="text" name="name" value="<%= vo.getName() %>" placeholder="이름을 입력하세요." required /></div>
						</div>
						<div class="input_box">
							<div class="title">이메일</div>
							<div class="input"><input type="text" name="email" value="<%= vo.getEmail() %>" placeholder="이메일을 입력하세요." required /></div>
						</div>
						<!-- <div class="input_box">
							<div class="title">닉네임</div>
							<div class="input"><input type="text" name="nickname" placeholder="닉네임을 입력하세요." /></div>
						</div> -->
						<div class="button">
							<ul>
								<li><input type="submit" value="수정" /></li>
								<li class="last"><input type="reset" value="취소" /></li>
							</ul>
							
						</div>
					</form>
					<%
						}
					%>
				</div><!-- padding End -->
			</div><!-- settingGroup End -->
			<div id="settingGroup" style="display: none">
				<h4>내 그룹 관리</h4>
				<div class="padding">
					<%
						if(request.getAttribute("myGroup") != null){
							ArrayList<GroupVO> group = (ArrayList<GroupVO>) request.getAttribute("myGroup");
							for(GroupVO myGroup : group){
					%>
					<ul>
						<li>
							<div class="padding">
								<div class="img"><a href="/mini/group/content?gid=<%=myGroup.getGid()%>"><img src="/mini/resources/Gimg/<%=myGroup.getImg()%>" alt="<%=myGroup.getG_name()%>" /></a></div>
								<div class="title"><a href="#"><%=myGroup.getG_name()%></a></div>
								<a href="#" class="out">탈퇴하기</a>
							</div>
						</li>
						<%}}%> 
					
					</ul>

				</div>
			</div><!-- settingGroup End -->
		</div><!-- myPageBox End -->


	</div><!-- content End -->

	<%@ include file="/WEB-INF/views/footer.jsp" %>


</div>
<% if(request.getAttribute("msg")!=null) {%>
		<script>
		alert("${msg}}");
		</script>
	<%} %>
</body>
</html>
