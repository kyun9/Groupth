<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.FieldVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("loginUser") != null) {
	%>
	<h2>로그인아이디 : ${ sessionScope.loginUser.user}</h2>
	<%
		}
	%>
	
	<form method="post" action="/mini/group/createGroup" enctype="multipart/form-data">
		<input type="hidden" name ="action" value="insert">
		그룹 분야 : <select name="fid">
			<%
				ArrayList<FieldVO> field = (ArrayList<FieldVO>) request.getAttribute("field");
				if (!field.isEmpty()) {
					for (FieldVO type : field) {
			%>
			<option value="<%=type.getFid()%>"><%=type.getType()%></option>
			<%
				}}
			%>
		</select>
		
		인원 수: <input type="number" name="limit_mem" placeholder = "최대 멤버는 50명입니다." value="5" min="2" max="50"><br>
		그룹 명 : <input type = "text" name = "g_name" required><br>
		<input type="hidden" name="leader" value="${ sessionScope.loginUser.user}">
		그룹 소개 : <br>
		<textarea cols="50" rows="8" name="g_content" required placeholder="내용을 입력해주세요."></textarea><br>
		그룹 이미지 등록 : <input type="file" name = "image" accept="image/*"><br>
		<input type="submit" value="그룹 생성하기">
		<input type="reset" value="재작성">
		<input type="button" onclick="goBack()" value="취소">
	</form>
	<script>
		function goBack(){
			location.href="<%=request.getHeader("referer") %>";
		}
	</script>
</body>
</html>