<%@ page import="io.github.wizwix.letsfutsal.dto.MatchDTO" %><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>경기 상세</title>
</head>
<%
  var match = (MatchDTO) request.getAttribute("match");

  String minGrade = switch (match.getMinGrade()) {
    case 0 -> "미배정";
    case 1 -> "초보";
    case 2 -> "중수";
    case 3 -> "고수";
    default -> String.valueOf(match.getMinGrade());
  };
  pageContext.setAttribute("minGrade", minGrade);
  String maxGrade = switch (match.getMinGrade()) {
    case 0 -> "미배정";
    case 1 -> "초보";
    case 2 -> "중수";
    case 3 -> "고수";
    default -> String.valueOf(match.getMinGrade());
  };
  pageContext.setAttribute("maxGrade", maxGrade);
%>
<body>
  <h2>경기 상세 정보</h2>
  <table border="1" style="width:100%;">
    <tr>
      <th style="width:150px;">항목</th>
      <th>내용</th>
    </tr>
    <tr>
      <td>경기 ID</td>
      <td>${match.matchId}</td>
    </tr>
    <tr>
      <td>구장</td>
      <td>${match.stadiumName}</td>
    </tr>
    <tr>
      <td>경기 타입</td>
      <td>
        <c:choose>
          <c:when test="${match.matchType == 'INDIVIDUAL'}">개인 경기</c:when>
          <c:when test="${match.matchType == 'TEAM'}">팀 경기</c:when>
          <c:otherwise>${match.matchType}</c:otherwise>
        </c:choose>
      </td>
    </tr>
    <tr>
      <td>경기 날짜</td>
      <td>${match.matchDate}</td>
    </tr>
    <tr>
      <td>경기 시간</td>
      <td>${match.startHour} ~ ${match.endHour}</td>
    </tr>
    <tr>
      <td>성별</td>
      <td>
        <c:choose>
          <c:when test="${match.gender == 'MALE'}">남성</c:when>
          <c:when test="${match.gender == 'FEMALE'}">여성</c:when>
          <c:when test="${match.gender == 'BOTH'}">혼성</c:when>
          <c:otherwise>${match.gender}</c:otherwise>
        </c:choose>
      </td>
    </tr>
    <tr>
      <td>등급 범위</td>
      <td>${minGrade} ~ ${maxGrade}</td>
    </tr>
    <tr>
      <td>빈 자리 여부</td>
      <td><strong>${match.status < 10 ? '있음' : '없음'}</strong></td>
    </tr>
  </table>
  <br>
  <a href="${pageContext.request.contextPath}/match">목록으로 돌아가기</a>
</body>
</html>
