<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="io.github.wizwix.letsfutsal.dto.TeamDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
TeamDTO team = (TeamDTO) request.getAttribute("team");

if (team == null) {
%>
<h2>팀 정보를 찾을 수 없습니다.</h2>
<a href="<%=request.getContextPath()%>/team/list">목록으로</a>
<%
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 개별 페이지</title>
</head>
<body>

  <h2>${team.teamName}</h2>

  성별 :
  <c:choose>
    <c:when test="${team.gender == 'FEMALE'}">여성</c:when>
    <c:when test="${team.gender == 'MALE'}">남성</c:when>
    <c:otherwise>혼성</c:otherwise>
  </c:choose><br>
  최소 등급 :
  <c:choose>
    <c:when test="${team.minGrade == 0}">무관</c:when>
    <c:when test="${team.minGrade == 1}">1 초보</c:when>
    <c:when test="${team.minGrade == 2}">2 중수</c:when>
    <c:when test="${team.minGrade == 3}">3 고수</c:when>
  </c:choose><br>
  최대 등급 :
  <c:choose>
    <c:when test="${team.maxGrade == 0}">무관</c:when>
    <c:when test="${team.maxGrade == 1}">1 초보</c:when>
    <c:when test="${team.maxGrade == 2}">2 중수</c:when>
    <c:when test="${team.maxGrade == 3}">3 고수</c:when>
  </c:choose><br>
  지역 : ${team.region}<br>
  소개 : <p>${team.introduction}</p>
  팀 주장 : <%=team.getLeaderId()%><br>

  <a href="${pageContext.request.contextPath}/team">메인으로</a> &nbsp; | &nbsp;
  <a href="${pageContext.request.contextPath}/team/join/${team.teamId}">${team.teamName} 팀 가입하기</a>
<%-- 	<a href="${pageContext.request.contextPath}/team/list">목록으로</a> --%>

</body>
</html>
