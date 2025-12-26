package io.github.wizwix.letsfutsal.user;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
  private final UserService userService;

  @GetMapping("/check-email")
  @ResponseBody
  public boolean checkEmail(@RequestParam String email) {
    return userService.isEmailExists(email);
  }

  @PostMapping("/login")
  public String login(@RequestParam(value = "email") String email,
                      @RequestParam(value = "password") String password,
                      HttpSession session) {
    UserDTO user = userService.login(email, password);
    if (user != null) {
      session.setAttribute("loginUser", user);
      return "redirect:/";
    }
    return "redirect:/user/login?error=true";
  }

  @GetMapping("/login")
  public String loginForm() {
    return "user/login";
  }

  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }

  @GetMapping("/mypage")
  public String mypage() {
    return "user/mypage";
  }

  @PostMapping("/register")
  public String register(@ModelAttribute UserDTO user) {
    userService.register(user);
    return "redirect:/user/login";
  }

  @GetMapping("/register")
  public String registerForm() {
    return "user/register";
  }

  @PostMapping("/update")
  public String update(@ModelAttribute UserDTO user,
                       @RequestParam(required = false) String password,
                       HttpSession session) {
    // 현재 사용자 정보 가져오기
    UserDTO currentUser = (UserDTO) session.getAttribute("loginUser");

    if (currentUser != null && currentUser.getUserId() == user.getUserId()) {
      // 비밀번호가 입력되지 않았으면 기존 비밀번호 유지
      if (password == null || password.trim().isEmpty()) {
        user.setPassword(currentUser.getPassword());
      } else {
        user.setPassword(password);
      }

      // 이메일과 성별은 변경 불가이므로 기존 값 유지
      user.setEmail(currentUser.getEmail());
      user.setGender(currentUser.getGender());

      // 정보 업데이트
      userService.updateUser(user);

      // 세션 업데이트
      UserDTO updatedUser = userService.getUserById(user.getUserId());
      session.setAttribute("loginUser", updatedUser);

      return "redirect:/user/mypage";
    }
    return "redirect:/user/login";
  }

  @GetMapping("/profile/{userId}")
  public String userProfile(@PathVariable Long userId, Model model) {
    UserDTO user = userService.getUserById(userId);
    if (user != null) {
      model.addAttribute("user", user);
      return "user/profile";
    }
    return "redirect:/user/list";
  }
}
