<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!--[if lt IE 9]>
       <script src="./resources/file/js/html5shiv.js"></script>
    <![endif]-->
</head>
<body>
<dl class="skip">
	<dt class="blind"><strong>skip navigation</strong></dt>
    <dd><a href="#content">skip to content</a></dd>
</dl>
<div id="wrap">
	
	<%@ include file="../header.jsp" %>

	<div id="content">
	
	<div id="joinBox">
		<div class="padding">
		<h3>회원가입</h3>
 		<form method="post" action="/mini/register">
			<div class="input_box">
				<div class="title">아이디</div>
				<div class="input"><input type="text" name="users_id" placeholder="아이디를 입력하세요." required /></div>
			</div>
			<div class="input_box">
				<div class="title">패스워드</div>
				<div class="input"><input type="password" name="password" placeholder="패스워드를 입력하세요." required /></div>
			</div>
			<!-- <div class="input_box">
				<div class="title">패스워드 확인</div>
				<div class="input"><input type="text" name="password_confirm" placeholder="패스워드를 입력하세요." /></div>
			</div> -->
			<div class="input_box">
				<div class="title">이름</div>
				<div class="input"><input type="text" name="name" placeholder="이름을 입력하세요." required /></div>
			</div>
			<div class="input_box">
				<div class="title">이메일</div>
				<div class="input"><input type="text" name="email" placeholder="이메일을 입력하세요." required /></div>
			</div>
			<!-- <div class="input_box">
				<div class="title">닉네임</div>
				<div class="input"><input type="text" name="nickname" placeholder="닉네임을 입력하세요." /></div>
			</div> -->
			<div class="button">
				<ul>
					<li><input type="submit" value="회원가입" /></li>
					<li class="last"><input type="reset" value="재작성" /></li>
				</ul>
				
			</div>
		</form>
		</div>
	</div>

	</div><!-- content End -->


	<%@ include file="../footer.jsp" %>

</div>

</body>
</html>
