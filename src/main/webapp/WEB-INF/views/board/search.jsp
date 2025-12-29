<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과 - 자유 게시판</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        .search-info { margin: 20px 0; padding: 10px; background-color: #f0f0f0; border-radius: 4px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:hover { background-color: #f5f5f5; }
        .pagination { margin: 20px 0; text-align: center; }
        .pagination a { padding: 8px 16px; margin: 0 4px; border: 1px solid #ddd; text-decoration: none; color: #333; }
        .pagination a.active { background-color: #4CAF50; color: white; }
        .pagination a:hover:not(.active) { background-color: #ddd; }
        .back-btn { padding: 10px 20px; background-color: #555; color: white; text-decoration: none; border-radius: 4px; }
        .title-link { text-decoration: none; color: #333; }
        .title-link:hover { color: #4CAF50; }
    </style>
</head>
<body>
    <h1>검색 결과</h1>
    <div class="search-info">
        <strong>검색 조건:</strong>
        <c:if test="${not empty query}">제목/내용: ${query}</c:if>
        <c:if test="${not empty writer}"> | 작성자: ${writer}</c:if>
        <br>
        <strong>검색 결과:</strong> 총 ${totalCount}개의 게시글
    </div>

    <a href="${pageContext.request.contextPath}/free" class="back-btn">목록으로</a>

    <table>
        <thead>
            <tr>
                <th width="8%">번호</th>
                <th width="12%">카테고리</th>
                <th width="40%">제목</th>
                <th width="12%">작성자</th>
                <th width="15%">작성일</th>
                <th width="8%">조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="article" items="${articles}">
                <tr>
                    <td>${article.articleId}</td>
                    <td>${article.cateName}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/free/view/${article.articleId}" class="title-link">
                            ${article.title}
                        </a>
                    </td>
                    <td>${article.authorNickname}</td>
                    <td>
                        <fmt:formatDate value="${article.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm" />
                    </td>
                    <td>${article.views}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty articles}">
                <tr>
                    <td colspan="6" style="text-align: center;">검색 결과가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>

    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <c:url var="prevUrl" value="${pageContext.request.contextPath}/free/search">
                <c:param name="query" value="${query}"/>
                <c:param name="writer" value="${writer}"/>
                <c:param name="page" value="${currentPage - 1}"/>
            </c:url>
            <a href="${prevUrl}">&laquo; 이전</a>
        </c:if>

        <c:forEach begin="1" end="${totalPages}" var="i">
            <c:url var="pageUrl" value="${pageContext.request.contextPath}/free/search">
                <c:param name="query" value="${query}"/>
                <c:param name="writer" value="${writer}"/>
                <c:param name="page" value="${i}"/>
            </c:url>
            <a href="${pageUrl}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <c:url var="nextUrl" value="${pageContext.request.contextPath}/free/search">
                <c:param name="query" value="${query}"/>
                <c:param name="writer" value="${writer}"/>
                <c:param name="page" value="${currentPage + 1}"/>
            </c:url>
            <a href="${nextUrl}">다음 &raquo;</a>
        </c:if>
    </div>
</body>
</html>
