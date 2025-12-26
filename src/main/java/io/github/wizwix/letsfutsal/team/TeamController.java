package io.github.wizwix.letsfutsal.team;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
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
  public String create(@ModelAttribute TeamDTO team) {
    // 임시 팀장 ID (로그인 기능 전이라서 임시값)
    team.setLeaderId(1L); // 로그인 연동 시 수정해야
    // DB 저장
    service.create(team);
    // 생성된 팀의 상세 페이지로 이동
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
  @GetMapping("")
  public String main() {
    return "team/main";
  }

  // 팀 개별 페이지
  @GetMapping("/profile/{teamId}")
  public String profile(@PathVariable("teamId") long teamId, Model model) {
    model.addAttribute("team", service.get(teamId));
    return "team/profile";
  }

  @GetMapping("/")
  public String rootRedirect() {
    return "redirect:/team";
  }
}
