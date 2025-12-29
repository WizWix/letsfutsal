package io.github.wizwix.letsfutsal.board;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CategoryDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/free")
public class FreeBoardController {
  private static final int ARTICLES_PER_PAGE = 20;
  private final FreeBoardService service;

  public FreeBoardController(FreeBoardService service) {
    this.service = service;
  }

  // 글 삭제
  @PostMapping("/delete/{id}")
  public String delete(@PathVariable Long id, HttpSession session) {
    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    ArticleDTO article = service.getArticleByIdWithoutIncreasingViews(id);

    if (article == null || article.getAuthorId() != user.getUserId()) {
      return "redirect:/free";
    }

    service.deleteArticle(id);
    return "redirect:/free";
  }

  // 댓글 삭제
  @PostMapping("/comment/delete")
  public String deleteComment(@RequestParam Long commentId,
                              @RequestParam Long articleId,
                              HttpSession session) {

    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    service.deleteComment(commentId);
    return "redirect:/free/view/" + articleId;
  }

  // 글 수정 처리
  @PostMapping("/edit/{id}")
  public String edit(@PathVariable Long id,
                     @RequestParam Long cateId,
                     @RequestParam String title,
                     @RequestParam String content,
                     HttpSession session) {

    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    ArticleDTO article = service.getArticleByIdWithoutIncreasingViews(id);

    if (article == null || article.getAuthorId() != user.getUserId()) {
      return "redirect:/free";
    }

    ArticleDTO dto = new ArticleDTO();
    dto.setArticleId(id);
    dto.setCateId(cateId);
    dto.setTitle(title);
    dto.setContent(content);

    boolean updated = service.updateArticle(dto);

    return updated ? "redirect:/free/view/" + id : "redirect:/free/edit/" + id;
  }

  // 글 수정 폼
  @GetMapping("/edit/{id}")
  public String editForm(@PathVariable Long id,
                         HttpSession session,
                         Model model) {

    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    ArticleDTO article = service.getArticleByIdWithoutIncreasingViews(id);

    if (article == null || article.getAuthorId() != user.getUserId()) {
      return "redirect:/free";
    }

    List<CategoryDTO> categories = service.getAllCategories();

    model.addAttribute("article", article);
    model.addAttribute("categories", categories);

    return "board/edit";
  }

  // 게시글 목록 (1페이지)
  @GetMapping
  public String list(Model model) {
    int totalCount = service.getTotalArticleCount();
    int totalPages = (int) Math.ceil((double) totalCount / ARTICLES_PER_PAGE);

    List<ArticleDTO> articles = service.getArticleList(0, ARTICLES_PER_PAGE);

    model.addAttribute("articles", articles);
    model.addAttribute("currentPage", 1);
    model.addAttribute("totalPages", totalPages);
    model.addAttribute("totalCount", totalCount);

    return "board/list"; // /WEB-INF/views/board/list.jsp
  }

  // 페이지별 목록
  @GetMapping("/page/{page}")
  public String listByPage(@PathVariable int page, Model model) {
    if (page < 1) {
      return "redirect:/free";
    }

    int totalCount = service.getTotalArticleCount();
    int totalPages = (int) Math.ceil((double) totalCount / ARTICLES_PER_PAGE);

    if (page > totalPages && totalPages > 0) {
      return "redirect:/free/page/" + totalPages;
    }

    int offset = (page - 1) * ARTICLES_PER_PAGE;
    List<ArticleDTO> articles = service.getArticleList(offset, ARTICLES_PER_PAGE);

    model.addAttribute("articles", articles);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    model.addAttribute("totalCount", totalCount);

    return "board/list";
  }

  // 게시글 검색
  @GetMapping("/search")
  public String search(
      @RequestParam(name = "searchType", required = false) String searchType,
      @RequestParam(name = "query", required = false) String query,
      @RequestParam(defaultValue = "1") int page,
      Model model
  ) {
    if (page < 1) page = 1;
    int totalCount;
    switch (searchType) {
      case "comment" -> {
        totalCount = service.getArticleCountByCommentContent(query);
      }
      case "content" -> {
        totalCount = service.getArticleCountByContent(query);
      }
      case "nickname" -> {
        totalCount = service.getArticleCountByAuthorNickname(query);
      }
      case "title" -> {
        totalCount = service.getArticleCountByTitle(query);
      }
      default -> {
        totalCount = 0;
      }
    }
    int totalPages = (int) Math.ceil((double) totalCount / ARTICLES_PER_PAGE);
    int offset = (page - 1) * ARTICLES_PER_PAGE;

    List<ArticleDTO> articles;
    switch (searchType) {
      case "comment" -> {
        articles = service.getArticlesByCommentContent(query);
      }
      case "content" -> {
        articles = service.getArticlesByContent(query);
      }
      case "nickname" -> {
        articles = service.getArticlesByAuthorNickname(query);
      }
      case "title" -> {
        articles = service.getArticlesByTitle(query);
      }
      default -> {
        articles = new ArrayList<>();
      }
    }
    if (articles.size() > ARTICLES_PER_PAGE) articles.subList(offset, ARTICLES_PER_PAGE);

    model.addAttribute("articles", articles);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    model.addAttribute("totalCount", totalCount);
    model.addAttribute("query", query);

    return "board/search";
  }

  // 게시글 상세
  @GetMapping("/view/{id}")
  public String view(@PathVariable Long id, Model model) {
    ArticleDTO article = service.getArticleById(id);
    if (article == null) {
      return "redirect:/free";
    }

    List<CommentDTO> comments = service.getCommentsByArticleId(id);

    model.addAttribute("article", article);
    model.addAttribute("comments", comments);

    return "board/view";
  }

  // 글쓰기 처리
  @PostMapping("/write")
  public String write(@RequestParam Long cateId,
                      @RequestParam String title,
                      @RequestParam String content,
                      HttpSession session) {

    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    if (title == null || title.trim().isEmpty()
        || content == null || content.trim().isEmpty()) {
      return "redirect:/free/write";
    }

    ArticleDTO dto = new ArticleDTO();
    dto.setCateId(cateId);
    dto.setAuthorId(user.getUserId());
    dto.setTitle(title);
    dto.setContent(content);

    Long articleId = service.insertArticle(dto);

    return (articleId != null)
        ? "redirect:/free/view/" + articleId
        : "redirect:/free/write";
  }

  // 댓글 작성
  @PostMapping("/comment/write")
  public String writeComment(@RequestParam Long articleId,
                             @RequestParam(required = false) Long parentId,
                             @RequestParam String content,
                             HttpSession session) {

    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    CommentDTO dto = new CommentDTO();
    dto.setArticleId(articleId);
    dto.setAuthorId(user.getUserId());
    if (parentId != null) dto.setParentId(parentId);
    dto.setContent(content);

    service.insertComment(dto);
    return "redirect:/free/view/" + articleId;
  }

  // 글쓰기 폼
  @GetMapping("/write")
  public String writeForm(HttpSession session, Model model) {
    UserDTO user = (UserDTO) session.getAttribute("loginUser");
    if (user == null) {
      return "redirect:/user/login";
    }

    List<CategoryDTO> categories =
        service.getAllCategories();

    model.addAttribute("categories", categories);
    return "board/write";
  }
}
