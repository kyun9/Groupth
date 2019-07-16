<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.FieldVO, vo.Group_InfoVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("loginUser") != null) {
	%>
	<h2>로그인아이디 : ${ sessionScope.loginUser.user}</h2>
	<%
		}
	%>
	
	<form method="get" action="/mini/group">
		관심분야 <br>
	<%
		ArrayList<FieldVO> field = (ArrayList<FieldVO>) request.getAttribute("field");
		if (!field.isEmpty()) {
			for (FieldVO type : field) {
	%>
		<input type='checkbox' name='field' value='<%=type.getType()%>' /><%=type.getType()%>
 	<%}} %>
 	<br>
 		<input type="hidden" name="action" value="search">
 		<input type="text" name="key">
 		<input type="submit" value="그룹 검색"><br>
	</form>
	
		<button onclick="goCreateGroup()">그룹 생성하기</button><br>
		<script>
			function goCreateGroup(){
		<%	
		if (session.getAttribute("loginUser") != null) {
		%>
				location.href="/mini/group/createGroup";
			<%} else{%>
				alert("로그인이 필요합니다.");
				location.href="/mini/login/";
			<%}%>
			
			}
			function goGroup(){
				location.href="/mini/group/content";
				//이거 listone이랑 똑같이 만들면돼
			}
		</script>
		<%
		ArrayList<Group_InfoVO> group = (ArrayList<Group_InfoVO>) request.getAttribute("grouplist");
		if (!group.isEmpty()) {
			for (Group_InfoVO list : group) {
		%> 
		<div style="border: 1px solid black;float: left;width: 25%;" onclick="goGroup()">
			<img src="./resources/Gimg/<%=list.getImg()%>" width=200px height=200px><br>
			분야 <%=list.getType() %><br>
			그룹 명 : <%=list.getG_name()%><br>
			그룹 리더 <%=list.getLeader() %><br>
			모집인원 : <%=list.getLimit_mem() %><br>
		</div>
 		<%}} %>
</body>

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
</html>