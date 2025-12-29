package io.github.wizwix.letsfutsal.stadium;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/stadium")
public class StadiumController {
  private final StadiumService service;

  public StadiumController(StadiumService service) {
    this.service = service;
  }

  // 1. 전체 구장 목록
  @GetMapping("/list")
  public String list(Model model) {
    model.addAttribute("stadiums", service.list());
    return "stadium/list";
  }

  // 메인
  @SuppressWarnings("ConfusingMainMethod")
  @GetMapping("")
  public String main() {
    return "stadium/main";
  }

  // 2. 구장 상세 페이지
  @GetMapping("/profile/{stadiumId}")
  public String profile(@PathVariable("stadiumId") long stadiumId, Model model) {
    model.addAttribute("stadium", service.get(stadiumId));
    return "stadium/profile";
  }

  @PostMapping("/rent/confirm")
  public String rentConfirm(@RequestParam("stadiumId") long stadiumId, @RequestParam("rentTime") String rentTime, HttpSession session) {
    // 로그인 사용자 (나중에 DB 저장 시 사용)
    UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");

    // 지금은 DB 저장 로직 없이 화면 이동만
    // 나중에 여기서 예약 insert 하면 됨

    System.out.println("예약자 : " + loginUser.getNickname());
    System.out.println("구장 ID : " + stadiumId);
    System.out.println("대여 시간 : " + rentTime);

    return "redirect:/stadium/list"; // 예약 완료 후 → 구장 전체 목록으로 이동
  }

  // 3. 대여 예약 페이지
  @GetMapping("/rent/{stadiumId}")
  public String rentForm(@PathVariable("stadiumId") long stadiumId, Model model, HttpSession session) {
    model.addAttribute("stadium", service.get(stadiumId));
    // 로그인 유저
    UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    return "stadium/rent";
  }
}
