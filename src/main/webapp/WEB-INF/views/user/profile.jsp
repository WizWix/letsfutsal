<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${user.nickname}님의 프로필 - Let's Futsal</title>
</head>
<body>
    <h1>${user.nickname}님의 프로필</h1>

    <!-- 회원 정보 표시 영역 -->
    <div>
        <h2>회원 정보</h2>

        <p><strong>닉네임:</strong> ${user.nickname}</p>

        <p><strong>성별:</strong> ${user.gender}</p>

        <p>
            <strong>선호 포지션:</strong>
            <c:choose>
                <c:when test="${empty user.preferredPosition}">설정 안 함</c:when>
                <c:otherwise>${user.preferredPosition}</c:otherwise>
            </c:choose>
        </p>

        <p>
            <strong>자기소개:</strong>
            <c:choose>
                <c:when test="${empty user.introduction}">없음</c:when>
                <c:otherwise>
                    <br>${user.introduction}
                </c:otherwise>
            </c:choose>
        </p>

        <p><strong>포인트:</strong> ${user.point} P</p>

        <p><strong>등급:</strong> ${user.grade}</p>

        <p><strong>가입일:</strong> ${user.createdAt}</p>
    </div>

    <br>
    <a href="${pageContext.request.contextPath}/user/list">회원 목록으로</a> |
    <a href="${pageContext.request.contextPath}/">홈으로</a>
</body>
</html>
