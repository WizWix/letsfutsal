<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>팀 관리</h2>

	<form action="<%=request.getContextPath()%>/team/list" method="get">
		<button type="submit">모든 팀 보기</button>
	</form>
	
	<br>

	<form action="<%=request.getContextPath()%>/team/create" method="get">
		<button type="submit">팀 생성하기</button>
	</form>

</body>
</html>