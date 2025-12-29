package io.github.wizwix.letsfutsal.board;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CategoryDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;
import io.github.wizwix.letsfutsal.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeBoardService {
  private final BoardMapper boardMapper;
  private final FreeBoardRepository repository;

  public FreeBoardService(FreeBoardRepository repository, BoardMapper boardMapper) {
    this.repository = repository;
    this.boardMapper = boardMapper;
  }

  // 게시글 삭제
  @SuppressWarnings("UnusedReturnValue")
  public boolean deleteArticle(Long articleId) {
    return repository.deleteArticle(articleId) > 0;
  }

  // 댓글 삭제
  @SuppressWarnings("UnusedReturnValue")
  public boolean deleteComment(Long commentId) {
    return repository.deleteComment(commentId) > 0;
  }

  // 카테고리 목록
  public List<CategoryDTO> getAllCategories() {
    return repository.getAllCategories();
  }

  // 게시글 상세 조회 (조회수 증가)
  public ArticleDTO getArticleById(Long articleId) {
    ArticleDTO article = repository.getArticleById(articleId);
    if (article != null) {
      repository.increaseViews(articleId);
    }
    return article;
  }

  // 게시글 상세 조회 (조회수 증가 없이)
  public ArticleDTO getArticleByIdWithoutIncreasingViews(Long articleId) {
    return repository.getArticleById(articleId);
  }

  public int getArticleCountByAuthorNickname(String nickname) {
    return repository.getArticleCountByAuthorNickname(nickname);
  }

  public int getArticleCountByCommentContent(String commentContent) {
    return repository.getArticleCountByCommentContent(commentContent);
  }

  public int getArticleCountByContent(String content) {
    return repository.getArticleCountByContent(content);
  }

  public int getArticleCountByTitle(String title) {
    return repository.getArticleCountByTitle(title);
  }

  // 게시글 목록 조회
  public List<ArticleDTO> getArticleList(int offset, int limit) {
    return repository.getArticleList(offset, limit);
  }

  public List<ArticleDTO> getArticlesByAuthorNickname(String nickname) {
    return repository.searchArticlesByAuthorNickname(nickname);
  }

  public List<ArticleDTO> getArticlesByCommentContent(String commentContent) {
    return repository.searchArticlesByCommentContent(commentContent);
  }

  public List<ArticleDTO> getArticlesByContent(String content) {
    return repository.searchArticlesByContent(content);
  }

  public List<ArticleDTO> getArticlesByTitle(String title) {
    return repository.searchArticlesByTitle(title);
  }

  // 댓글 목록
  public List<CommentDTO> getCommentsByArticleId(Long articleId) {
    return repository.getCommentsByArticleId(articleId);
  }

  // 검색 결과 개수
  public int getSearchArticleCount(String query, String writer) {
    return repository.getSearchArticleCount(query, writer);
  }

  // 전체 게시글 개수
  public int getTotalArticleCount() {
    return repository.getTotalArticleCount();
  }

  // 게시글 작성
  public Long insertArticle(ArticleDTO dto) {
    return repository.insertArticle(dto);
  }

  // 댓글 작성
  @SuppressWarnings("UnusedReturnValue")
  public Long insertComment(CommentDTO dto) {
    return repository.insertComment(dto);
  }

  // 게시글 수정
  public boolean updateArticle(ArticleDTO dto) {
    return repository.updateArticle(dto) > 0;
  }
}
