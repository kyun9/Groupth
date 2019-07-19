<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.FieldVO, vo.Group_InfoVO, java.util.ArrayList"%>
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

	<div id="content">
		
		<div id="myPageBox">
			<div id="myPageNav">
				<h3>마이페이지</h3>
				<ul>
					<li class="on"><a href="/mini/mypage">내 그룹 관리</a></li>
					<li><a href="/mini/mypage/myInfo">내 정보 수정</a></li>
				</ul>
			</div>
			<div id="settingGroup">
				<h4>내 그룹 관리</h4>
				<div class="padding">
					
					<ul>
						<%
						ArrayList<Group_InfoVO> group = (ArrayList<Group_InfoVO>) request.getAttribute("grouplist");
						if (!group.isEmpty()) {
							for (Group_InfoVO list : group) {
						%>
						<li>
							<div class="padding">
								<div class="img"><a href="/mini/group/content?gid=<%=list.getGid()%>"><img src="/mini/resources/Gimg/<%=list.getImg()%>" alt="<%=list.getG_name()%>" /></a></div>
								<div class="title"><a href="#"><%=list.getG_name()%></a></div>
								<a href="#" class="out">탈퇴하기</a>
							</div>
						</li>
						<%}} %>
					
					</ul>

				</div>
			</div><!-- settingGroup End -->
		</div><!-- myPageBox End -->


	</div><!-- content End -->


	<%@ include file="/WEB-INF/views/footer.jsp" %>


</div>

</body>
</html>
