<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>글수정 - 자유 게시판</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      max-width: 1000px;
      margin: 0 auto;
      padding: 20px;
    }

    h1 {
      color: #333;
      border-bottom: 2px solid #4CAF50;
      padding-bottom: 10px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #333;
    }

    .form-group select, .form-group input[type="text"], .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 14px;
      box-sizing: border-box;
    }

    .form-group textarea {
      resize: vertical;
      min-height: 300px;
      font-family: Arial, sans-serif;
    }

    .form-buttons {
      text-align: center;
      margin-top: 30px;
    }

    .btn {
      padding: 12px 30px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      text-decoration: none;
      display: inline-block;
      margin: 0 5px;
    }

    .btn-primary {
      background-color: #4CAF50;
      color: white;
    }

    .btn-secondary {
      background-color: #555;
      color: white;
    }

    .btn:hover {
      opacity: 0.8;
    }
  </style>
</head>
<body>
  <h1>글 수정</h1>
  <form action="${pageContext.request.contextPath}/free/edit/${article.articleId}" method="post">
    <div class="form-group">
      <label for="cateId">카테고리</label>
      <select id="cateId" name="cateId" required>
        <option value="">카테고리를 선택하세요</option>
        <c:forEach var="category" items="${categories}">
          <option value="${category.cateId}" ${category.cateId == article.cateId ? 'selected' : ''}>${category.cateName}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" value="${article.title}" required maxlength="100">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content" required>${article.content}</textarea>
    </div>
    <div class="form-buttons">
      <button type="submit" class="btn btn-primary">수정 완료</button>
      <a href="${pageContext.request.contextPath}/free/view/${article.articleId}" class="btn btn-secondary">취소</a>
    </div>
  </form>
</body>
</html>
