<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page - Let's Futsal</title>
</head>
<body>
    <h1>마이페이지</h1>

    <c:if test="${not empty sessionScope.loginUser}">
        <div>
            <h2>회원 정보</h2>
            <p><strong>이메일:</strong> ${loginUser.email} (변경 불가)</p>
            <p><strong>성별:</strong> ${loginUser.gender} (변경 불가)</p>
            <p><strong>포인트:</strong> ${loginUser.point} P</p>
            <p><strong>등급:</strong> ${loginUser.grade}</p>
            <p><strong>가입일:</strong> ${loginUser.createdAt}</p>
        </div>

        <br>
        <h2>정보 수정</h2>
        <form action="${pageContext.request.contextPath}/user/update" method="post">
            <input type="hidden" name="userId" value="${loginUser.userId}">

            <div>
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" value="${loginUser.nickname}" required>
            </div>

            <div>
                <label for="password">새 비밀번호 (변경 시에만 입력):</label>
                <input type="password" id="password" name="password" placeholder="변경하지 않으려면 비워두세요">
            </div>

            <div>
                <label for="preferredPosition">선호 포지션:</label>
                <select id="preferredPosition" name="preferredPosition">
                    <option value="" ${empty loginUser.preferredPosition ? 'selected' : ''}>선택안함</option>
                    <option value="Goalkeeper" ${loginUser.preferredPosition == 'Goalkeeper' ? 'selected' : ''}>Goalkeeper (GK)</option>
                    <option value="Defender" ${loginUser.preferredPosition == 'Defender' ? 'selected' : ''}>Defender (DF)</option>
                    <option value="Midfielder" ${loginUser.preferredPosition == 'Midfielder' ? 'selected' : ''}>Midfielder (MF)</option>
                    <option value="Forward" ${loginUser.preferredPosition == 'Forward' ? 'selected' : ''}>Forward (FW)</option>
                </select>
            </div>

            <div>
                <label for="introduction">자기소개:</label><br>
                <textarea id="introduction" name="introduction" rows="4" cols="50" placeholder="자기소개를 입력하세요...">${loginUser.introduction}</textarea>
            </div>

            <br>
            <button type="submit">수정하기</button>
        </form>

        <br>
        <a href="${pageContext.request.contextPath}/">홈으로</a> |
        <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
    </c:if>

    <c:if test="${empty sessionScope.loginUser}">
        <p>로그인이 필요합니다.</p>
        <a href="${pageContext.request.contextPath}/user/login">로그인하기</a>
    </c:if>
</body>
</html>