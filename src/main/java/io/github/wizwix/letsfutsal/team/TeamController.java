package io.github.wizwix.letsfutsal.team;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/team")
public class TeamController {

  private final TeamService service;

  public TeamController(TeamService service) {
    this.service = service;
  }

  @PostMapping("/create")
  public String create(@ModelAttribute TeamDTO team, HttpSession session) {
    // 1. 로그인 사용자 가져오기
    UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
    if (loginUser == null) return "redirect:/user/login";
    // 2. 팀장 = 로그인한 사용자 ID
    team.setLeaderId(loginUser.getUserId());
    // 3. DB 저장
    service.create(team);
    // 4. 생성된 팀의 상세 페이지로 이동
    return "redirect:/team/profile/" + team.getTeamId();
  }

  // 생성 폼
  @GetMapping("/create")
  public String createForm() {
    return "team/create";
  }

  // 팀 가입 페이지
  @GetMapping("/join/{teamId}")
  public String joinForm(@PathVariable("teamId") long teamId, Model model) {
    model.addAttribute("team", service.get(teamId));
    return "team/join";
  }

  // 전체 목록
  @GetMapping("/list")
  public String list(Model model) {
    model.addAttribute("teams", service.list());
    return "team/list";
  }

  // 메인
  @SuppressWarnings("ConfusingMainMethod")
  @GetMapping("")
  public String main() {
    return "team/main";
  }

  // 팀 개별 페이지
  @GetMapping("/profile/{teamId}")
  public String profile(@PathVariable("teamId") long teamId, Model model, HttpSession session) {
    TeamDTO team = service.get(teamId);
    model.addAttribute("team", team);
    UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    return "team/profile";
  }

  @GetMapping("/")
  public String rootRedirect() {
    return "redirect:/team";
  }
}
