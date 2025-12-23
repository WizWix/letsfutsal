package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;

import java.util.List;

public interface BoardMapper {
  int deleteArticle(long articleId);

  int deleteComment(long commendId);

  int incrementArticleViews(long articleId);

  int insertArticle(ArticleDTO article);

  int insertComment(CommentDTO comment);

  ArticleDTO selectArticleById(long articleId);

  List<ArticleDTO> selectArticlesByAuthorNickname(String nickname);

  List<ArticleDTO> selectArticlesByCategory(long cateId);

  List<ArticleDTO> selectArticlesByCommentContent(String commentContent);

  List<ArticleDTO> selectArticlesByContent(String content);

  List<ArticleDTO> selectArticlesByTitle(String title);

  List<CommentDTO> selectCommentsByArticleId(long articleId);
}
