package io.github.wizwix.letsfutsal.board;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface FreeBoardDAO {
	// 검색 조건에 따른 목록 조회
	List<FreeBoardDTO> selectBoardList(@Param("query") String query, @Param("writer") String writer);

	// 상세 보기
	FreeBoardDTO selectBoardById(Long articleId);

	// 글 쓰기
	int insertBoard(FreeBoardDTO board);

	// 조회수 증가
	void updateViews(Long articleId);
}
