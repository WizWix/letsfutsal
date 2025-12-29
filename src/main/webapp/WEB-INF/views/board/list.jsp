<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>자유 게시판</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    h1 {
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: left;
    }

    th {
      background-color: #4CAF50;
      color: white;
    }

    tr:hover {
      background-color: #f5f5f5;
    }

    .pagination {
      margin: 20px 0;
      text-align: center;
    }

    .pagination a {
      padding: 8px 16px;
      margin: 0 4px;
      border: 1px solid #ddd;
      text-decoration: none;
      color: #333;
    }

    .pagination a.active {
      background-color: #4CAF50;
      color: white;
    }

    .pagination a:hover:not(.active) {
      background-color: #ddd;
    }

    .search-form {
      margin: 20px 0;
    }

    .search-form input[type="text"] {
      padding: 8px;
      width: 200px;
    }

    .search-form button {
      padding: 8px 16px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }

    .write-btn {
      float: right;
      padding: 10px 20px;
      background-color: #008CBA;
      color: white;
      text-decoration: none;
      border-radius: 4px;
    }

    .title-link {
      text-decoration: none;
      color: #333;
    }

    .title-link:hover {
      color: #4CAF50;
    }
  </style>
</head>
<body>
  <h1>자유 게시판</h1>
  <a href="${pageContext.request.contextPath}/free/write" class="write-btn">글쓰기</a>
  <div style="clear:both;"></div>

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
          <td><a href="${pageContext.request.contextPath}/free/view/${article.articleId}" class="title-link">${article.title}</a></td>
          <td>${article.authorNickname}</td>
          <td><fmt:formatDate value="${article.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm"/></td>
          <td>${article.views}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty articles}">
        <tr>
          <td colspan="6" style="text-align: center;">게시글이 없습니다.</td>
        </tr>
      </c:if>
    </tbody>
  </table>

  <div class="pagination">
    <c:if test="${currentPage > 1}">
      <c:choose>
        <c:when test="${currentPage == 2}">
          <a href="${pageContext.request.contextPath}/free">&laquo; 이전</a>
        </c:when>
        <c:otherwise>
          <a href="${pageContext.request.contextPath}/free/page/${currentPage - 1}">&laquo; 이전</a>
        </c:otherwise>
      </c:choose>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
      <c:choose>
        <c:when test="${i == 1}">
          <a href="${pageContext.request.contextPath}/free" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:when>
        <c:otherwise>
          <a href="${pageContext.request.contextPath}/free/page/${i}" class="${currentPage == i ? 'active' : ''}">${i}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
      <a href="${pageContext.request.contextPath}/free/page/${currentPage + 1}">다음 &raquo;</a>
    </c:if>
  </div>
  <div class="search-form">
    <form action="${pageContext.request.contextPath}/free/search" method="get">
      <label>
        <select name="searchType">
          <option value="comment">댓글 내용</option>
          <option value="content">내용</option>
          <option value="nickname">닉네임</option>
          <option value="title">제목</option>
        </select>
      </label>
      <label><input name="query"/></label>
      <button type="submit">검색</button>
    </form>
  </div>
</body>
</html>
