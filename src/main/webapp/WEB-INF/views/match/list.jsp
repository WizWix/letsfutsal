<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>경기 목록</title>
</head>
<body>
  <h2>경기 목록</h2>
  <!-- 탭 -->
  <ul>
    <li><a href="${pageContext.request.contextPath}/match?tab=individual">개인 경기</a></li>
    <li><a href="${pageContext.request.contextPath}/match?tab=team">팀 경기</a></li>
    <li><a href="${pageContext.request.contextPath}/match?tab=all">전체</a></li>
  </ul>
  <%
    var tab = request.getParameter("tab");
    if (tab == null) tab = "";
    String tabStr = switch (tab) {
      case "individual" -> "개인 경기";
      case "team" -> "팀 경기";
      default -> "전체 경기";
    };
    pageContext.setAttribute("tab", tab);
    pageContext.setAttribute("tabStr", tabStr);
  %>
  <p>선택 탭: ${tabStr}</p>
  <!-- 필터 -->
  <form method="get">
    <input type="hidden" name="tab" value="${tab}">
    <label>구장: <input type="text" name="region" value="${region}" placeholder="구장 지역"></label>
    <br><br>
    <label>
      날짜·시간:
      <input type="time" name="startHour" value="${startHour}">
      ~
      <input type="time" name="endHour" value="${endHour}">
    </label>

    <br><br>
    성별:
    <select name="gender">
      <option value="both" ${gender.toString() == 'BOTH' ? 'selected' : ''}>전체</option>
      <option value="male" ${gender.toString() == 'MALE' ? 'selected' : ''}>남성</option>
      <option value="female" ${gender.toString() == 'FAMALE' ? 'selected' : ''}>여성</option>
    </select>
    <br><br>
    분류 (등급):
    <input type="number" name="minGrade" value="${minGrade}" min="0" max="3" placeholder="최소 등급"> ~
    <input type="number" name="maxGrade" value="${maxGrade}" min="0" max="3" placeholder="최대 등급">
    <br><br>
    찬 자리:
    <input type="number" name="status" value="${status}" min="0" max="10" placeholder="찬 자리">
    <br><br>
    <input type="submit" value="검색">
    <input type="reset">
  </form>
  <!-- 경기 목록 테이블 -->
  <table border="1" style="width:100%; margin-top:20px;">
    <thead>
      <tr>
        <th>ID</th>
        <th>지역</th>
        <th>경기 타입</th>
        <th>날짜·시간</th>
        <th>성별</th>
        <th>분류</th>
        <th>빈 자리</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="m" items="${matches}">
      <tr>
        <td><a href="${pageContext.request.contextPath}/match/${m.matchId}">${m.matchId}</a></td>
        <td>${m.region}</td>
        <td>
          <c:choose>
            <c:when test="${m.matchType.toString() == 'INDIVIDUAL'}">개인 경기</c:when>
            <c:when test="${m.matchType.toString() == 'TEAM'}">팀 경기</c:when>
            <c:otherwise>${m.matchType.toString()}</c:otherwise>
          </c:choose>
        </td>
        <td>${m.matchDate}</td>
        <td>
          <c:choose>
            <c:when test="${m.gender.toString() == 'MALE'}">남성</c:when>
            <c:when test="${m.gender.toString() == 'FEMALE'}">여성</c:when>
            <c:when test="${m.gender.toString() == 'BOTH'}">혼성</c:when>
            <c:otherwise>${m.gender.toString()}</c:otherwise>
          </c:choose>
        </td>
        <td>${m.minGrade} ~ ${m.maxGrade}</td>
        <td>${m.status < 10 ? '있음' : '없음'}</td>
      </tr>
    </c:forEach>
    <c:if test="${empty matches}">
    <tr>
      <td colspan="7" style="text-align:center;">검색 결과가 없습니다.</td>
    </tr>
    </c:if>
    </tbody>
  </table>
</body>
</html>
