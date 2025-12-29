package io.github.wizwix.letsfutsal.dto;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class CommentDTO {
  long articleId;
  long authorId;
  long commentId;
  String content;
  LocalDateTime createdAt;
  boolean isDeleted;
  String nickname;
  Long parentId;

  public CommentDTO() {}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final long $articleId = this.getArticleId();
    result = result * PRIME + Long.hashCode($articleId);
    final long $authorId = this.getAuthorId();
    result = result * PRIME + Long.hashCode($authorId);
    final long $commentId = this.getCommentId();
    result = result * PRIME + Long.hashCode($commentId);
    final Object $content = this.getContent();
    result = result * PRIME + ($content == null ? 43 : $content.hashCode());
    final Object $createdAt = this.getCreatedAt();
    result = result * PRIME + ($createdAt == null ? 43 : $createdAt.hashCode());
    result = result * PRIME + (this.isDeleted() ? 79 : 97);
    final Object $nickname = this.getNickname();
    result = result * PRIME + ($nickname == null ? 43 : $nickname.hashCode());
    final long $parentId = this.getParentId();
    result = result * PRIME + Long.hashCode($parentId);
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof CommentDTO other)) return false;
    if (!other.canEqual(this)) return false;
    if (this.getArticleId() != other.getArticleId()) return false;
    if (this.getAuthorId() != other.getAuthorId()) return false;
    if (this.getCommentId() != other.getCommentId()) return false;
    final Object this$content = this.getContent();
    final Object other$content = other.getContent();
    if (!Objects.equals(this$content, other$content)) return false;
    final Object this$createdAt = this.getCreatedAt();
    final Object other$createdAt = other.getCreatedAt();
    if (!Objects.equals(this$createdAt, other$createdAt)) return false;
    if (this.isDeleted() != other.isDeleted()) return false;
    final Object this$nickname = this.getNickname();
    final Object other$nickname = other.getNickname();
    if (!Objects.equals(this$nickname, other$nickname)) return false;
    return this.getParentId() == other.getParentId();
  }

  protected boolean canEqual(final Object other) {return other instanceof CommentDTO;}

  public long getArticleId() {return this.articleId;}

  public void setArticleId(long articleId) {this.articleId = articleId;}

  public long getAuthorId() {return this.authorId;}

  public void setAuthorId(long authorId) {this.authorId = authorId;}

  public long getCommentId() {return this.commentId;}

  public void setCommentId(long commentId) {this.commentId = commentId;}

  public String getContent() {return this.content;}

  public void setContent(String content) {this.content = content;}

  public LocalDateTime getCreatedAt() {return this.createdAt;}

  public Date getCreatedAtAsDate() {
    if (createdAt == null) return null;
    return Date.from(createdAt.atZone(ZoneId.systemDefault()).toInstant());
  }

  public void setCreatedAt(LocalDateTime createdAt) {this.createdAt = createdAt;}

  public String getNickname() {return this.nickname;}

  public void setNickname(String nickname) {this.nickname = nickname;}

  public Long getParentId() {return this.parentId;}

  public void setParentId(long parentId) {this.parentId = parentId;}

  public boolean isDeleted() {return this.isDeleted;}

  public void setDeleted(boolean isDeleted) {this.isDeleted = isDeleted;}

  public String toString() {return "CommentDTO(articleId=" + this.getArticleId() + ", authorId=" + this.getAuthorId() + ", commentId=" + this.getCommentId() + ", content=" + this.getContent() + ", createdAt=" + this.getCreatedAt() + ", isDeleted=" + this.isDeleted() + ", nickname=" + this.getNickname() + ", parentId=" + this.getParentId() + ")";}
}
