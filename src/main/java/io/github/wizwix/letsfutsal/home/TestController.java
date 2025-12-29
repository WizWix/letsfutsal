package io.github.wizwix.letsfutsal.home;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class TestController {
  /// Test code. If you can't access `localhost:8080/test` or don't see `aaaaaaaaaaaaaaaa` in your browser, something is wrong about Tomcat or Spring MVC configuration.
  @GetMapping("/test")
  @ResponseBody
  public String list() {
    return "aaaaaaaaaaaaaaaa";
  }
}
