<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 전체 목록</title>
</head>
<body>
  <h2>구장 전체 목록</h2>
  <c:choose>
    <c:when test="${empty stadiums}">
      <p>등록된 구장이 없습니다.</p>
    </c:when>
    <c:otherwise>
      <ul>
        <c:forEach var="stadium" items="${stadiums}">
          <li>
            <a href="${pageContext.request.contextPath}/stadium/profile/${stadium.stadiumId}">${stadium.name}</a>
          </li>
        </c:forEach>
      </ul>
    </c:otherwise>
  </c:choose>
  <br>
  <a href="${pageContext.request.contextPath}/stadium">메인으로</a>
</body>
</html>
