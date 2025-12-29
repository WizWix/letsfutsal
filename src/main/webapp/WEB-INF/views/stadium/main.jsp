<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 메인</title>
</head>
<body>
  <h2>구장 관리</h2>
  <form action="<%=request.getContextPath()%>/stadium/list" method="get">
    <button type="submit">모든 구장 보기</button>
  </form>
  <br>
</body>
</html>
