<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Let's Futsal</title>
    <script>
        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('error') === 'true') {
                alert("이메일 또는 비밀번호가 일치하지 않습니다!");
            }
        };
    </script>
</head>
<body>
    <h1>로그인</h1>

    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <div>
            <label for="email">이메일 : </label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">비밀번호 : </label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">로그인</button>
    </form>

    <p>계정이 없으신가요? <a href="${pageContext.request.contextPath}/user/register">회원가입하기</a></p>
</body>
</html>
