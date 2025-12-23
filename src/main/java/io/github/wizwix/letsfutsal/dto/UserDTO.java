package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.Gender;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserDTO {
  LocalDateTime createdAt;
  String email;
  Gender gender;
  long grade;
  String introduction;
  String nickname;
  String password;
  long point;
  String preferredPosition;
  long userId;
}
