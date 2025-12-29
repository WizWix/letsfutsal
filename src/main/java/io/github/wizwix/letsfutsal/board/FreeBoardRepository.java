package io.github.wizwix.letsfutsal.board;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CategoryDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;
import io.github.wizwix.letsfutsal.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public class FreeBoardRepository {
  private final RowMapper<ArticleDTO> articleRowMapper = (rs, rowNum) -> {
    ArticleDTO dto = new ArticleDTO();
    dto.setArticleId(rs.getLong("article_id"));
    dto.setCateId(rs.getLong("cate_id"));
    dto.setAuthorId(rs.getLong("author_id"));
    dto.setTitle(rs.getString("title"));
    dto.setContent(rs.getString("content"));
    Timestamp timestamp = rs.getTimestamp("created_at");
    if (timestamp != null) {
      dto.setCreatedAt(timestamp.toLocalDateTime());
    }
    dto.setViews(rs.getLong("views"));
    dto.setCateName(rs.getString("cate_name"));
    dto.setAuthorNickname(rs.getString("nickname"));
    return dto;
  };
  private final RowMapper<CategoryDTO> categoryRowMapper = (rs, rowNum) -> {
    CategoryDTO dto = new CategoryDTO();
    dto.setCateId(rs.getLong("cate_id"));
    dto.setCateName(rs.getString("cate_name"));
    return dto;
  };
  private final RowMapper<CommentDTO> commentRowMapper = (rs, rowNum) -> {
    CommentDTO dto = new CommentDTO();
    dto.setCommentId(rs.getLong("comment_id"));
    dto.setArticleId(rs.getLong("article_id"));
    dto.setAuthorId(rs.getLong("author_id"));
    Long parentId = rs.getLong("parent_id");
    dto.setParentId(rs.wasNull() ? null : parentId);
    dto.setContent(rs.getString("content"));
    Timestamp timestamp = rs.getTimestamp("created_at");
    if (timestamp != null) {
      dto.setCreatedAt(timestamp.toLocalDateTime());
    }
    dto.setDeleted(rs.getBoolean("is_deleted"));
    dto.setNickname(rs.getString("nickname"));
    return dto;
  };
  @Autowired
  private BoardMapper boardMapper;

  // 게시글 삭제
  public long deleteArticle(Long articleId) {
    return boardMapper.deleteArticle(articleId);
  }

  // 댓글 삭제 (소프트 삭제)
  public long deleteComment(Long commentId) {
    return boardMapper.deleteComment(commentId);
  }

  // 카테고리 목록
  public List<CategoryDTO> getAllCategories() {
    return boardMapper.selectAllCategories();
  }

  // 게시글 상세 조회
  public ArticleDTO getArticleById(Long articleId) {
    return boardMapper.selectArticleById(articleId);
  }

  public int getArticleCountByAuthorNickname(String query) {
    return boardMapper.selectArticleCountByAuthorNickname(query);
  }

  public int getArticleCountByCommentContent(String query) {
    return boardMapper.selectArticleCountByCommentContent(query);
  }

  public int getArticleCountByContent(String query) {
    return boardMapper.selectArticleCountByContent(query);
  }

  public int getArticleCountByTitle(String query) {
    return boardMapper.selectArticleCountByTitle(query);
  }

  // 게시글 목록 조회
  public List<ArticleDTO> getArticleList(int offset, int limit) {
    return boardMapper.selectArticles(offset, limit);
  }

  // 댓글 목록
  public List<CommentDTO> getCommentsByArticleId(Long articleId) {
    return boardMapper.selectCommentsByArticleId(articleId);
  }

  // 검색 결과 개수
  public int getSearchArticleCount(String query, String writer) {
    return boardMapper.selectArticleCount(query, writer);
  }

  // 전체 게시글 개수
  public int getTotalArticleCount() {
    return boardMapper.countTotalArticles();
  }

  // 조회수 증가
  public void increaseViews(Long articleId) {
    boardMapper.incrementArticleViews(articleId);
  }

  // 게시글 작성
  public Long insertArticle(ArticleDTO dto) {
    return boardMapper.insertArticle(dto);
  }

  // 댓글 작성
  public Long insertComment(CommentDTO dto) {
    return boardMapper.insertComment(dto);
  }

  // 게시글 검색 (글쓴이)
  public List<ArticleDTO> searchArticlesByAuthorNickname(String query) {
    return boardMapper.selectArticlesByAuthorNickname(query);
  }

  public List<ArticleDTO> searchArticlesByCommentContent(String query) {
    return boardMapper.selectArticlesByCommentContent(query);
  }

  public List<ArticleDTO> searchArticlesByContent(String query) {
    return boardMapper.selectArticlesByContent(query);
  }

  public List<ArticleDTO> searchArticlesByTitle(String query) {
    return boardMapper.selectArticlesByTitle(query);
  }

  // 게시글 수정
  public int updateArticle(ArticleDTO dto) {
    return boardMapper.updateArticle(dto);
  }
}
