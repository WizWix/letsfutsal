package io.github.wizwix.letsfutsal.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.jspecify.annotations.NonNull;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
  @Override
  public boolean preHandle(HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler) throws Exception {
    HttpSession session = request.getSession();
    // Check if user is logged in
    if (session.getAttribute("loginUser") == null) {
      // Not logged in, redirect to login page
      response.sendRedirect(request.getContextPath() + "/user/login");
      return false;
    }
    return true;
  }
}
