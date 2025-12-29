<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${article.title} - 자유 게시판</title>
    <style>
        body {
          font-family: Arial, sans-serif;
          margin: 20px;
          max-width: 1200px;
          margin: 0 auto;
          padding: 20px;
        }

        .article-header {
          border-bottom: 2px solid #4CAF50;
          padding-bottom: 10px;
          margin-bottom: 20px;
        }

        .article-title {
          font-size: 24px;
          font-weight: bold;
          margin-bottom: 10px;
        }

        .article-info {
          color: #666;
          font-size: 14px;
        }

        .article-content {
          padding: 20px;
          background-color: #f9f9f9;
          border-radius: 4px;
          min-height: 200px;
          line-height: 1.6;
          white-space: pre-wrap;
        }

        .article-buttons {
          margin: 20px 0;
          text-align: right;
        }

        .btn {
          padding: 8px 16px;
          margin-left: 5px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          text-decoration: none;
          display: inline-block;
        }

        .btn-primary {
          background-color: #4CAF50;
          color: white;
        }

        .btn-warning {
          background-color: #ff9800;
          color: white;
        }

        .btn-danger {
          background-color: #f44336;
          color: white;
        }

        .btn-secondary {
          background-color: #555;
          color: white;
        }

        .comments-section {
          margin-top: 40px;
          border-top: 2px solid #ddd;
          padding-top: 20px;
        }

        .comment {
          padding: 15px;
          margin-bottom: 10px;
          background-color: #f5f5f5;
          border-radius: 4px;
        }

        .comment.reply {
          margin-left: 40px;
          background-color: #e8e8e8;
        }

        .comment-header {
          font-weight: bold;
          margin-bottom: 5px;
          color: #333;
        }

        .comment-date {
          font-size: 12px;
          color: #999;
        }

        .comment-content {
          margin-top: 10px;
          line-height: 1.5;
          white-space: pre-wrap;
        }

        .comment-form {
          margin-top: 20px;
          padding: 15px;
          background-color: #f0f0f0;
          border-radius: 4px;
        }

        .comment-form textarea {
          width: 100%;
          padding: 10px;
          border: 1px solid #ddd;
          border-radius: 4px;
          resize: vertical;
        }

        .deleted-comment {
          color: #999;
          font-style: italic;
        }
    </style>
</head>
<body>
    <div class="article-header">
        <div class="article-title">[${article.cateName}] ${article.title}</div>
        <div class="article-info">
            작성자: ${article.authorNickname} |
            작성일: <fmt:formatDate value="${article.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm"/> |
            조회수: ${article.views}
        </div>
    </div>

    <div class="article-content">${article.content}</div>

    <div class="article-buttons">
        <a href="${pageContext.request.contextPath}/free" class="btn btn-secondary">목록</a>
        <c:if test="${sessionScope.loginUser.userId == article.authorId}">
            <a href="${pageContext.request.contextPath}/free/edit/${article.articleId}" class="btn btn-warning">수정</a>
            <form action="${pageContext.request.contextPath}/free/delete/${article.articleId}"
                  method="post" style="display: inline;"
                  onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <button type="submit" class="btn btn-danger">삭제</button>
            </form>
        </c:if>
    </div>

    <div class="comments-section">
        <h3>댓글 (${comments.size()})</h3>

        <c:forEach var="comment" items="${comments}">
            <div class="comment ${comment.parentId != null ? 'reply' : ''}">
                <c:choose>
                    <c:when test="${comment.deleted}">
                        <div class="deleted-comment">삭제된 댓글입니다.</div>
                    </c:when>
                    <c:otherwise>
                        <div class="comment-header">
                            ${comment.nickname}
                            <span class="comment-date">
                                <fmt:formatDate value="${comment.createdAtAsDate}" pattern="yyyy-MM-dd HH:mm"/>
                            </span>
                            <c:if test="${sessionScope.loginUser.userId == comment.authorId}">
                                <form action="${pageContext.request.contextPath}/free/comment/delete"
                                      method="post" style="display: inline; float: right;"
                                      onsubmit="return confirm('댓글을 삭제하시겠습니까?');">
                                    <input type="hidden" name="commentId" value="${comment.commentId}">
                                    <input type="hidden" name="articleId" value="${article.articleId}">
                                    <button type="submit" class="btn btn-danger" style="padding: 4px 8px; font-size: 12px;">삭제</button>
                                </form>
                            </c:if>
                        </div>
                        <div class="comment-content">${comment.content}</div>
                        <c:if test="${sessionScope.loginUser.userId != 0 && comment.parentId == null}">
                            <button onclick="showReplyForm(${comment.commentId})" class="btn btn-primary" style="margin-top: 5px; padding: 4px 8px; font-size: 12px;">답글</button>
                            <div id="reply-form-${comment.commentId}" style="display: none; margin-top: 10px;">
                                <form action="${pageContext.request.contextPath}/free/comment/write" method="post">
                                    <input type="hidden" name="articleId" value="${article.articleId}">
                                    <input type="hidden" name="parentId" value="${comment.commentId}">
                                    <textarea name="content" rows="3" placeholder="답글을 입력하세요" required></textarea>
                                    <button type="submit" class="btn btn-primary" style="margin-top: 5px;">답글 작성</button>
                                </form>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>

        <c:if test="${sessionScope.loginUser.userId != null}">
            <div class="comment-form">
                <h4>댓글 작성</h4>
                <form action="${pageContext.request.contextPath}/free/comment/write" method="post">
                    <input type="hidden" name="articleId" value="${article.articleId}">
                    <textarea name="content" rows="4" placeholder="댓글을 입력하세요" required></textarea>
                    <button type="submit" class="btn btn-primary" style="margin-top: 10px;">댓글 작성</button>
                </form>
            </div>
        </c:if>
        <c:if test="${sessionScope.loginUser.userId == null}">
            <div class="comment-form">
                <p>댓글을 작성하려면 <a href="${pageContext.request.contextPath}/login">로그인</a>이 필요합니다.</p>
            </div>
        </c:if>
    </div>

    <script>
        function showReplyForm(commentId) {
          const form = document.getElementById('reply-form-' + commentId);
          if (form.style.display === 'none') {
            form.style.display = 'block';
          } else {
            form.style.display = 'none';
          }
        }
    </script>
</body>
</html>
