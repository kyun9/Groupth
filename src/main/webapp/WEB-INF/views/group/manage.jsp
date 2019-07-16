<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.UsersVO, java.util.ArrayList"%>
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
		if(!tempMember.isEmpty()){
			for(UsersVO mem : tempMember){	
	%>
	
		<%=mem.getUsers_id()%>
	<%
			}}
	%>
hi manage
</body>
</html>