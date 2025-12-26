package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardMapper {

  /// Deletes an article and its associated comments.
  ///
  /// @param articleId The ID of the article to delete.
  /// @return The number of rows affected.
  int deleteArticle(@Param("articleId") long articleId);

  /// Soft-deletes a comment by flagging it as deleted and masking its content.
  ///
  /// @param commentId The ID of the comment to soft-delete.
  /// @return The number of rows affected.
  int deleteComment(@Param("commentId") long commentId);

  /// Increment the view count of a specific article.
  ///
  /// @param articleId The ID of the article.
  /// @return The number of rows affected.
  int incrementArticleViews(@Param("articleId") long articleId);

  /// Insert a new article into the database.
  ///
  /// @param article `ArticleDTO` that represents the new article.
  /// @return The number of rows affected.
  int insertArticle(@Param("article") ArticleDTO article);

  /// Insert a new comment into the database.
  ///
  /// @param comment `CommentDTO` that represents the new comment.
  /// @return The number of rows affected.
  int insertComment(@Param("comment") CommentDTO comment);

  /// Retrieves an article by its unique ID.
  ///
  /// @param articleId The ID of the article.
  /// @return The `ArticleDTO`, or `null` if not found.
  ArticleDTO selectArticleById(@Param("articleId") long articleId);

  /// Retrieves all articles.
  ///
  /// @return A list of every articles.
  List<ArticleDTO> selectArticles();

  /// Searches for articles by author's nickname.
  ///
  /// @param nickname Nickname of the author (supports partial matches).
  /// @return A list of matching articles.
  List<ArticleDTO> selectArticlesByAuthorNickname(@Param("nickname") String nickname);

  /// Retrieves all articles belonging to a specific category.
  ///
  /// @param cateId The category ID.
  /// @return A list of articles in the category.
  List<ArticleDTO> selectArticlesByCategoryId(@Param("cateId") long cateId);

  /// Searches for articles containing comments that match the given text.
  ///
  /// @param commentContent The comment text to search for (supports partial matches).
  /// @return A list of articles containing matching comments.
  List<ArticleDTO> selectArticlesByCommentContent(@Param("commentContent") String commentContent);

  /// Searches for articles where the body content matches the given text.
  ///
  /// @param content The content string to search for (supports partial matches).
  /// @return A list of matching articles.
  List<ArticleDTO> selectArticlesByContent(@Param("content") String content);

  /// Searches for articles where title matches the given text.
  ///
  /// @param title The title string to search for (support partial matches).
  /// @return A list of matching articles.
  List<ArticleDTO> selectArticlesByTitle(@Param("title") String title);

  /// Retrieves all comments associated with a specific article.
  ///
  /// @param articleId The ID of the article.
  /// @return A list of comments for the article.
  List<CommentDTO> selectCommentsByArticleId(@Param("articleId") long articleId);

  /// Updates the details of an existing article.
  ///
  /// @param article The article DTO containing updated information.
  /// @return The number of rows affected.
  int updateArticle(@Param("article") ArticleDTO article);
}
