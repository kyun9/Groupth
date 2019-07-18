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

		<div id="groupSch">
			<h3 class="s_title">그룹</h3>
			<div class="group_box">
				<form method="get" action="/mini/group">
				<div class="box">
					<div class="title">관심분야</div>
					<ul>
						<%
							ArrayList<FieldVO> field = (ArrayList<FieldVO>) request.getAttribute("field");
							if (!field.isEmpty()) {
								for (FieldVO type : field) {
						%>
							<li><input type="checkbox" name="field" value="<%=type.getType()%>" />&nbsp;&nbsp;<%=type.getType()%></li>
					 	<%}} %>
					</ul>
				</div>

				<div class="box">
					<div class="title">그룹검색</div>
					<div class="sch_box">
						<input type="hidden" name="action" value="search">
						<div class="search"><input type="text" name="key" /></div>
						<div class="btn"><input type="submit" value="검색" /></div>
					</div>
				</div><!-- box End -->
				</form>
			</div><!-- group_box End -->
		</div><!-- groupList End -->
	
		<div class="join_btn"><a href="javascript: void(0);" onclick="goCreateGroup()">그룹 생성하기</a></div>

		<script>
			function goCreateGroup(){
		<%	
		if (session.getAttribute("loginUser") != null) {
		%>
				location.href="/mini/group/createGroup";
			<%} else{%>
				alert("로그인이 필요합니다.");
				location.href="/mini/login";
			<%}%>
			
			}
		</script>


		<div id="groupList">
			<ul>
				<%
				ArrayList<Group_InfoVO> group = (ArrayList<Group_InfoVO>) request.getAttribute("grouplist");
				if (!group.isEmpty()) {
					for (Group_InfoVO list : group) {
				%> 
				<li>
					<div class="img"><a href="/mini/group/content?gid=<%=list.getGid()%>"><img src="/mini/resources/Gimg/<%=list.getImg()%>" alt="<%=list.getG_name()%>"></a></div>
					<div class="cty"><%=list.getType() %></div>
					<div class="title"><a href="#"><%=list.getG_name()%></a></div>
					<div class="leader">그룹리더 : <%=list.getLeader() %></div>
					<div class="number">인원 : <%=list.getCount_mem() %>/<%=list.getLimit_mem() %></div>
				</li>

				<%}} %>
			</ul>
		</div>
	</div><!-- content End -->
	
	<script>
		$("#groupList ul li:nth-child(3n").css("margin-right", "0");

	</script>

	<script type="text/javascript">
	$(document).ready(function() {
	    $('input[type="checkbox"][name="field"]').click(function(){
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="field"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	</script>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</div>

</body>
</html>
