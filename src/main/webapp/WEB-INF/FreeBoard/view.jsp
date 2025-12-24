<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><c:out value="${board.title}" /></title>
</head>
<body>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="container">
    <h2>자유 게시판 상세보기</h2>

    <div class="info-bar">
        <strong>제목:</strong> <c:out value="${board.title}" /><br>
        <strong>카테고리:</strong> ${board.cateId} |
        <strong>작성자 ID:</strong> ${board.authorId} |
        <strong>조회수:</strong>
        <fmt:formatNumber value="${board.views}" type="number"/>
    </div>

    <div class="content-box">
        <c:out value="${board.content}" />
    </div>

    <div class="btn-group">
        <!-- 목록 -->
        <button type="button"
                onclick="location.href='${ctx}/free'">
            목록으로
        </button>

        <!-- 수정 -->
        <button type="button"
                onclick="location.href='${ctx}/free/edit/${board.articleId}'">
            수정
        </button>

        <!-- 삭제 -->
        <form action="${ctx}/free/delete/${board.articleId}"
              method="post"
              style="display:inline;">
            <button type="submit"
                    onclick="return confirm('정말 삭제하시겠습니까?')">
                삭제
            </button>
        </form>
    </div>
</div>

</body>
</html>