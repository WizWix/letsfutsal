<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록 - Let's Futsal</title>
</head>
<body>
    <h1>회원 목록</h1>

    <!-- 정렬 기준 선택 드롭다운 -->
    <div>
        <label for="sortBy">정렬 기준:</label>
        <select id="sortBy" onchange="location.href='${pageContext.request.contextPath}/user/list?sortBy=' + this.value;">
            <option value="point" ${currentSort == 'point' ? 'selected' : ''}>포인트 높은 순</option>
            <option value="grade" ${currentSort == 'grade' ? 'selected' : ''}>등급 높은 순</option>
            <option value="nickname" ${currentSort == 'nickname' ? 'selected' : ''}>닉네임 순</option>
        </select>
    </div>

    <!-- 회원 목록 테이블 -->
    <table border="1">
        <thead>
            <tr>
                <th>순위</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>포지션</th>
                <th>포인트</th>
                <th>등급</th>
            </tr>
        </thead>
        <tbody>
            <!-- 회원 목록 반복 출력 -->
            <c:forEach var="user" items="${users}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>
                        <!-- 닉네임 클릭 시 개별 회원 프로필 페이지로 이동 -->
                        <a href="${pageContext.request.contextPath}/user/profile/${user.userId}">
                            ${user.nickname}
                        </a>
                    </td>
                    <td>${user.gender}</td>
                    <td>
                        <c:choose>
                            <c:when test="${empty user.preferredPosition}">-</c:when>
                            <c:otherwise>${user.preferredPosition}</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${user.point} P</td>
                    <td>${user.grade}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 회원이 없을 경우 메시지 표시 -->
    <c:if test="${empty users}">
        <p>등록된 회원이 없습니다.</p>
    </c:if>

    <br>
    <a href="${pageContext.request.contextPath}/">홈으로</a>
</body>
</html>
