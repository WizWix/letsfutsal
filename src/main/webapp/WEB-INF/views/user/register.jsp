<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Let's Futsal</title>
    <script>
        function validateForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // 비밀번호 확인
            if (password !== confirmPassword) {
                alert("비밀번호가 일치하지 않습니다!");
                return false;
            }

            // 이메일 중복 확인 (동기 방식)
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "${pageContext.request.contextPath}/user/check-email?email=" + encodeURIComponent(email), false);
            xhr.send();

            if (xhr.status === 200) {
                var emailExists = xhr.responseText === "true";
                if (emailExists) {
                    alert("이미 사용 중인 이메일입니다!");
                    return false;
                }
            }

            return true;
        }
    </script>
</head>
<body>
    <h1>회원가입</h1>

    <form action="${pageContext.request.contextPath}/user/register" method="post" onsubmit="return validateForm()">
        <div>
            <label for="email">이메일 : </label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">비밀번호 : </label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="confirmPassword">비밀번호 확인 : </label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div>
            <label for="nickname">닉네임 : </label>
            <input type="text" id="nickname" name="nickname" required>
        </div>
        <div>
            <label>성별 : </label>
            <label>
                <input type="radio" name="gender" value="MALE" required> 남성
            </label>
            <label>
                <input type="radio" name="gender" value="FEMALE" required> 여성
            </label>
        </div>
        <div>
            <label for="preferredPosition">선호 포지션 : </label>
            <select id="preferredPosition" name="preferredPosition">
                <option value="">선택안함</option>
                <option value="Goalkeeper">골키퍼 (GK)</option>
                <option value="Defender">수비수 (DF)</option>
                <option value="Midfielder">미드필더 (MF)</option>
                <option value="Forward">공격수 (FW)</option>
            </select>
        </div>
        <div>
            <label for="introduction">자기소개 (선택사항):</label><br>
            <textarea id="introduction" name="introduction" rows="4" cols="50" placeholder="자기소개를 입력하세요..."></textarea>
        </div>
        <button type="submit">회원가입하기</button>
    </form>

    <p>이미계정이 있으신가요? <a href="${pageContext.request.contextPath}/user/login">로그인하기</a></p>
</body>
</html>
