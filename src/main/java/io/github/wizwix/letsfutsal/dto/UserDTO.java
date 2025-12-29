package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.Gender;

import java.time.LocalDateTime;
import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
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

  public UserDTO() {}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final Object $createdAt = this.getCreatedAt();
    result = result * PRIME + ($createdAt == null ? 43 : $createdAt.hashCode());
    final Object $email = this.getEmail();
    result = result * PRIME + ($email == null ? 43 : $email.hashCode());
    final Object $gender = this.getGender();
    result = result * PRIME + ($gender == null ? 43 : $gender.hashCode());
    result = Math.toIntExact((long) result * PRIME + this.getGrade());
    final Object $introduction = this.getIntroduction();
    result = result * PRIME + ($introduction == null ? 43 : $introduction.hashCode());
    final Object $nickname = this.getNickname();
    result = result * PRIME + ($nickname == null ? 43 : $nickname.hashCode());
    final Object $password = this.getPassword();
    result = result * PRIME + ($password == null ? 43 : $password.hashCode());
    final long $point = this.getPoint();
    result = result * PRIME + Long.hashCode($point);
    final Object $preferredPosition = this.getPreferredPosition();
    result = result * PRIME + ($preferredPosition == null ? 43 : $preferredPosition.hashCode());
    final long $userId = this.getUserId();
    result = result * PRIME + Long.hashCode($userId);
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof UserDTO other)) return false;
    if (!other.canEqual(this)) return false;
    final Object this$createdAt = this.getCreatedAt();
    final Object other$createdAt = other.getCreatedAt();
    if (!Objects.equals(this$createdAt, other$createdAt)) return false;
    final Object this$email = this.getEmail();
    final Object other$email = other.getEmail();
    if (!Objects.equals(this$email, other$email)) return false;
    final Object this$gender = this.getGender();
    final Object other$gender = other.getGender();
    if (!Objects.equals(this$gender, other$gender)) return false;
    if (this.getGrade() != other.getGrade()) return false;
    final Object this$introduction = this.getIntroduction();
    final Object other$introduction = other.getIntroduction();
    if (!Objects.equals(this$introduction, other$introduction)) return false;
    final Object this$nickname = this.getNickname();
    final Object other$nickname = other.getNickname();
    if (!Objects.equals(this$nickname, other$nickname)) return false;
    final Object this$password = this.getPassword();
    final Object other$password = other.getPassword();
    if (!Objects.equals(this$password, other$password)) return false;
    if (this.getPoint() != other.getPoint()) return false;
    final Object this$preferredPosition = this.getPreferredPosition();
    final Object other$preferredPosition = other.getPreferredPosition();
    if (!Objects.equals(this$preferredPosition, other$preferredPosition)) return false;
    return this.getUserId() == other.getUserId();
  }

  protected boolean canEqual(final Object other) {return other instanceof UserDTO;}

  public String toString() {return "UserDTO(createdAt=" + this.getCreatedAt() + ", email=" + this.getEmail() + ", gender=" + this.getGender() + ", grade=" + this.getGrade() + ", introduction=" + this.getIntroduction() + ", nickname=" + this.getNickname() + ", password=" + this.getPassword() + ", point=" + this.getPoint() + ", preferredPosition=" + this.getPreferredPosition() + ", userId=" + this.getUserId() + ")";}

  public LocalDateTime getCreatedAt() {return this.createdAt;}

  public void setCreatedAt(LocalDateTime createdAt) {this.createdAt = createdAt;}

  public String getEmail() {return this.email;}

  public void setEmail(String email) {this.email = email;}

  public Gender getGender() {return this.gender;}

  public void setGender(Gender gender) {this.gender = gender;}

  public long getGrade() {return this.grade;}

  public void setGrade(long grade) {this.grade = grade;}

  public String getIntroduction() {return this.introduction;}

  public void setIntroduction(String introduction) {this.introduction = introduction;}

  public String getNickname() {return this.nickname;}

  public void setNickname(String nickname) {this.nickname = nickname;}

  public String getPassword() {return this.password;}

  public void setPassword(String password) {this.password = password;}

  public long getPoint() {return this.point;}

  public void setPoint(long point) {this.point = point;}

  public String getPreferredPosition() {return this.preferredPosition;}

  public void setPreferredPosition(String preferredPosition) {this.preferredPosition = preferredPosition;}

  public long getUserId() {return this.userId;}

  public void setUserId(long userId) {this.userId = userId;}
}
