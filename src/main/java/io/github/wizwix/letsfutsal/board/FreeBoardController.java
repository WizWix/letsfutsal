package io.github.wizwix.letsfutsal.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/free")
public class FreeBoardController {

	@Autowired
	private FreeBoardDAO boardMapper;

	// 자유 게시판 목록 및 검색
	@GetMapping({ "", "/search" })
	public String list(@RequestParam(required = false) String query, @RequestParam(required = false) String writer,
			Model model) {
		List<FreeBoardDTO> list = boardMapper.selectBoardList(query, writer);
		model.addAttribute("list", list);
		return "FreeBoard/list"; // JSP 또는 Thymeleaf 파일 경로
	}

	// 글 상세 보기
	@GetMapping("/view/{id}")
	public String view(@PathVariable("id") Long id, Model model) {
		boardMapper.updateViews(id); // 조회수 증가
		model.addAttribute("board", boardMapper.selectBoardById(id));
		return "FreeBoard/view";
	}

	// 글 쓰기 페이지 이동
	@GetMapping("/write")
	public String writeForm() {
		return "FreeBoard/write";
	}

	// 글 쓰기 처리
	@PostMapping("/write")
	public String write(FreeBoardDTO board) {
		// 실제 프로젝트에선 세션에서 로그인한 유저 ID를 가져와 세팅해야 함
		// board.setAuthorId(loginUserId);
		boardMapper.insertBoard(board);
		return "redirect:/free";
	}
}
