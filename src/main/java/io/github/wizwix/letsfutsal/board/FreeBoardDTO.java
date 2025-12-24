package io.github.wizwix.letsfutsal.board;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class FreeBoardDTO {
    private Long articleId;
    private Long cateId;
    private Long authorId;
    private String title;
    private String content;
    private Long views;
    private String authorNickname; // JOIN을 통해 가져올 작성자 이름
    private LocalDateTime regDate; // 생성일(컬럼 추가 권장)
    
    
	public FreeBoardDTO(Long articleId, Long cateId, Long authorId, String title, String content, Long views,
			String authorNickname, LocalDateTime regDate) {
		super();
		this.articleId = articleId;
		this.cateId = cateId;
		this.authorId = authorId;
		this.title = title;
		this.content = content;
		this.views = views;
		this.authorNickname = authorNickname;
		this.regDate = regDate;
	}


	public Long getArticleId() {
		return articleId;
	}


	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}


	public Long getCateId() {
		return cateId;
	}


	public void setCateId(Long cateId) {
		this.cateId = cateId;
	}


	public Long getAuthorId() {
		return authorId;
	}


	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Long getViews() {
		return views;
	}


	public void setViews(Long views) {
		this.views = views;
	}


	public String getAuthorNickname() {
		return authorNickname;
	}


	public void setAuthorNickname(String authorNickname) {
		this.authorNickname = authorNickname;
	}


	public LocalDateTime getRegDate() {
		return regDate;
	}


	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	
	
    
    
}

