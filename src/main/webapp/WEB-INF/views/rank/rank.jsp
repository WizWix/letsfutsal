<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>랭킹 - Let's Futsal</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/rank/rank.css">
  <script src="${pageContext.request.contextPath}/resources/script/bootstrap/bootstrap.bundle.min.js"></script>
  <script>
    function changeFilter(type, grade, position) {
      window.location.href = '${pageContext.request.contextPath}/rank?type=' + type + '&grade=' + grade + '&position=' + position;
    }
  </script>
  <style>
    .filter-form {
      margin-bottom: 20px;
    }

    .filter-form select {
      margin-right: 10px;
      padding: 5px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      max-width: 800px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #4CAF50;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .rank-number {
      font-weight: bold;
      text-align: center;
    }

    .tab {
      display: inline-block;
      padding: 10px 20px;
      margin-right: 5px;
      background: #ddd;
      cursor: pointer;
    }

    .tab.active {
      background: #4CAF50;
      color: white;
    }
  </style>
</head>
<body>
  <h1>랭킹</h1>
  <div>
    <a href="${pageContext.request.contextPath}/rank?type=individual" class="tab ${type == 'individual' ? 'active' : ''}">개인 랭킹</a>
    <a href="${pageContext.request.contextPath}/rank?type=team" class="tab ${type == 'team' ? 'active' : ''}">팀 랭킹</a>
  </div>
  <form class="filter-form" method="get" action="${pageContext.request.contextPath}/rank">
    <input type="hidden" name="type" value="${type}">
    <label for="grade">등급:</label>
    <select name="grade" id="grade">
      <option value="-1" ${selectedGrade == -1 ? 'selected' : ''}>전체</option>
      <option value="0" ${selectedGrade == 0 ? 'selected' : ''}>0등급</option>
      <option value="1" ${selectedGrade == 1 ? 'selected' : ''}>1등급</option>
      <option value="2" ${selectedGrade == 2 ? 'selected' : ''}>2등급</option>
      <option value="3" ${selectedGrade == 3 ? 'selected' : ''}>3등급</option>
    </select>
    <c:if test="${type == 'individual'}">
      <label for="position">포지션:</label>
      <select name="position" id="position">
        <option value="" ${empty selectedPosition ? 'selected' : ''}>전체</option>
        <option value="GK" ${selectedPosition == 'GK' ? 'selected' : ''}>골키퍼 (GK)</option>
        <option value="DF" ${selectedPosition == 'DF' ? 'selected' : ''}>수비수 (DF)</option>
        <option value="MF" ${selectedPosition == 'MF' ? 'selected' : ''}>미드필더 (MF)</option>
        <option value="FW" ${selectedPosition == 'FW' ? 'selected' : ''}>공격수 (FW)</option>
      </select>
    </c:if>
    <button type="submit">검색</button>
  </form>
  <c:choose>
    <c:when test="${type == 'individual'}">
      <h2>개인 랭킹 TOP 10</h2>
      <table>
        <tr>
          <th style="width:50px;">순위</th>
          <th>닉네임</th>
          <th>포지션</th>
          <th>등급</th>
          <th>포인트</th>
        </tr>
        <c:forEach var="user" items="${rankings}" varStatus="status">
          <tr>
            <td class="rank-number">${status.index + 1}</td>
            <td>${user.nickname}</td>
            <td>${user.preferredPosition}</td>
            <td>${user.grade}</td>
            <td>${user.point}</td>
          </tr>
        </c:forEach>
        <c:if test="${empty rankings}">
          <tr><td colspan="5" style="text-align:center;">데이터가 없습니다.</td></tr>
        </c:if>
      </table>
    </c:when>
    <c:otherwise>
      <h2>팀 랭킹 TOP 10</h2>
      <table>
        <tr>
          <th style="width:50px;">순위</th>
          <th>팀명</th>
          <th>지역</th>
          <th>팀원 수</th>
          <th>평균 포인트</th>
        </tr>
        <c:forEach var="team" items="${rankings}" varStatus="status">
          <tr>
            <td class="rank-number">${status.index + 1}</td>
            <td>${team.teamName}</td>
            <td>${team.region}</td>
            <td>${team.memberCount}</td>
            <td>${team.averagePoints}</td>
          </tr>
        </c:forEach>
        <c:if test="${empty rankings}">
          <tr><td colspan="5" style="text-align:center;">데이터가 없습니다. (팀 기능 합친 후 사용 가능)</td></tr>
        </c:if>
      </table>
    </c:otherwise>
  </c:choose>
  <p><a href="${pageContext.request.contextPath}/">홈으로</a></p>
</body>
</html>
