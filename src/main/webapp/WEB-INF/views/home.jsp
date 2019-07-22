<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page session="true" %>
   <%@ page import="vo.Group_InfoVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta charset="utf-8" />
    
    <title>Groupth</title>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./resources/file/css/style.css" />
    <link rel="stylesheet" type="text/css" href="./resources/file/css/respond.css" />

    <link rel="stylesheet" href="./resources/file/css/yt-video-background.min.css" />

    <!--[if lt IE 9]>
       <script src="./resources/file/js/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
<dl class="skip">
	<dt class="blind"><strong>skip navigation</strong></dt>
    <dd><a href="#content">skip to content</a></dd>
</dl>
<div id="wrap" class="index">
	
	<%@ include file="header.jsp" %>

	<div id="content">
		<div class="visual_section">
			<div class="video-background"></div>
			<div class="cover"></div>
			<div class="container">
				<%
					if(session.getAttribute("loginUser")!=null){
				%>
				<h3>직접 만나 함께하는 즐거움</h3>
				<p>로컬 그룹에 가입하고 사람들과 좋아하는 일을 함께 하며 새로운 경험을 즐겨 보세요.</p>
				<a href="/mini/group">그룹으로 바로가기</a>
				<%}else{ %>
				<h3>직접 만나 함께하는 즐거움</h3>
				<p>GROUPTH는 함께하는 성장을 추구합니다.<br>
				당신의 멤버를 찾아보세요.</p>
				<a href="/mini/register">Groupth 가입하기</a> <!-- session true = 가입 X -->
				<%} %>
			</div>
		</div><!-- visual_section End -->

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="./resources/file/js/yt-video-background.min.js" charset="utf-8"></script>
		<script type="text/javascript">
			$('.video-background').youtubeBackground({
				videoId: 'iYsGjlPeK84',
				backgroundColor: '#212121',
				backgroundImage: 'https://i.ytimg.com/vi/ITpIv6Efz8Y/maxresdefault.jpg', // For mobile devices
				opacity: 0.6
			});
		</script>


		<div class="group_section">
		
			<div id="groupList">
				<h3>인기 그룹</h3>
				<ul>
				<% ArrayList<Group_InfoVO> popularGroup = (ArrayList<Group_InfoVO>) request.getAttribute("popularGroup"); 
					for(Group_InfoVO vo : popularGroup){
				%>
					<li>
						<div class="img"><a href="/mini/group/content?gid=<%=vo.getGid()%>"><img src="/mini/resources/Gimg/<%=vo.getImg()%>" alt="<%=vo.getG_name()%>"></a></div>
						<div class="cty"><%=vo.getType()%></div>
						<div class="title"><a href="#"><%=vo.getG_name() %></a></div>
						<div class="leader">그룹리더 : <%=vo.getLeader() %></div>
						<div class="number">인원 : <%=vo.getCount_mem() %>/<%=vo.getLimit_mem() %></div>
					</li>
				<%} %>
				</ul>
			</div>

		</div>

		<script>
			$("#groupList ul li:nth-child(3n").css("margin-right", "0");

		</script>

	</div><!-- content End -->

	<script>
	$(window).scroll(function(e){
		var vh = $(".visual_section").height();
		if($(this).scrollTop() <= vh){
			$("ul.gnb li").removeClass("on");
			$(".nav_bar ul li").removeClass("on");
			$("#header .menu").removeClass("bk");
		}else{
			$("ul.gnb li").addClass("on");
			$(".nav_bar ul li").addClass("on");
			$("#header .menu").addClass("bk");
		}
	});

	/* 반응형 */
	$(window).bind("resize", function () {

		reset();

	    // console.log($(this).width())
	    if ($(window).width() < 1200) {
	    	// $("body").css("background", "red");
			reset();
	    	
	    	if($(window).width() < 1197){
	    		reset();

	    		if($(window).width() < 992){
		    		reset();

		    		if($(window).width() < 991){
			    		reset();

			    		if($(window).width() < 768){
							reset();

				    		if($(window).width() < 767){
					    		reset();

					    		if($(window).width() < 576){
						    		reset();


						    		
							    }
						    }
					    		
					    }
				    }
			    }
		    }

	    }else {


	    }
	}).trigger('resize');

	function reset(){
		var vh = $(".visual_section").height();

	}
	</script>

	<%@ include file="footer.jsp" %>

</div>

</body>
</html>
