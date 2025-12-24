<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판 - 글 쓰기</title>
    <style>
        body { font-family: 'Malgun Gothic', sans-serif; line-height: 1.6; color: #333; }
        .container { width: 700px; margin: 40px auto; padding: 20px; border: 1px solid #eee; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { border-bottom: 2px solid #007bff; padding-bottom: 10px; color: #007bff; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input[type="text"], select, textarea { 
            width: 100%; 
            padding: 10px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            box-sizing: border-box; 
        }
        textarea { height: 300px; resize: vertical; }
        .btn-group { text-align: right; gap: 10px; display: flex; justify-content: flex-end; }
        button { padding: 10px 20px; cursor: pointer; border-radius: 4px; border: none; font-weight: bold; }
        .btn-submit { background-color: #007bff; color: white; }
        .btn-cancel { background-color: #6c757d; color: white; }
        button:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <div class="container">
        <h2>자유 게시판 글 쓰기</h2>
        <%-- Spring Controller의 @PostMapping("/free/write")와 매핑됩니다 --%>
        <form action="${pageContext.request.contextPath}/free/write" method="post" onsubmit="return validateForm()">
            
            <div class="form-group">
                <label for="cateId">카테고리</label>
                <select name="cateId" id="cateId" required>
                    <option value="" disabled selected>카테고리를 선택하세요</option>
                    <option value="1">일반</option>
                    <option value="2">질문</option>
                    <option value="3">정보</option>
                </select>
            </div>

            <%-- 실제 구현 시 세션의 사용자 ID를 주입해야 합니다 --%>
            <input type="hidden" name="authorId" value="101"> 

            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" name="title" id="title" maxlength="100" placeholder="제목을 입력하세요 (최대 100자)" required>
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea name="content" id="content" placeholder="풋살 커뮤니티 매너를 지켜 내용을 작성해주세요" required></textarea>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn-submit">등록하기</button>
                <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>

    <script>
        // 간단한 클라이언트 측 유효성 검사
        function validateForm() {
            const title = document.getElementsByName('title')[0].value;
            const content = document.getElementsByName('content')[0].value;

            if (title.trim().length < 2) {
                alert('제목을 2자 이상 입력해주세요.');
                return false;
            }
            if (content.trim().length < 5) {
                alert('내용을 더 자세히 작성해주세요 (최소 5자).');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>