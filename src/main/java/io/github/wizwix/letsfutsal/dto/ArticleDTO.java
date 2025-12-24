package io.github.wizwix.letsfutsal.dto;

import lombok.Data;

@Data
public class ArticleDTO {
	long articleId;
	long authorId;
	long cateId;
	String content;
	String title;
	long views;
}
