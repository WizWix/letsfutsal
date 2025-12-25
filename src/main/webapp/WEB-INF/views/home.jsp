<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Let's Futsal - Home</title>
</head>
<body>
    <h1>Welcome to Let's Futsal!</h1>

    <c:choose>
        <c:when test="${not empty loginUser}">
            <p>Hello, ${loginUser.nickname}!</p>
            <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
            <p>Please login to continue.</p>
            <a href="${pageContext.request.contextPath}/user/login">로그인</a>
            <a href="${pageContext.request.contextPath}/user/register">Register</a>
        </c:otherwise>
    </c:choose>
</body>
</html>
