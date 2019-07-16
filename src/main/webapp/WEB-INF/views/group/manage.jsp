<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.UsersVO, vo.Login_InfoVO, java.util.ArrayList"%>
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
		멤버 아이디 : <%=mem.getUsers_id()%> <img src="../resources/static/welcome.png" width="25" height="25"> <img src="../resources/static/reject.png" width="25" height="25">
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
			 그룹장 :
		<%}else {%>
			멤버 :
		<%}}%> 
			<%=mem.getUsers_id()%>
		<%}}else{%>
			멤버가 없습니다.
		<%}%>
</body>
</html>