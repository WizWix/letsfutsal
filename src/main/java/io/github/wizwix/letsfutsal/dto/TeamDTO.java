package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.Gender;

import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class TeamDTO {
  Gender gender;
  String introduction;
  long leaderId;
  String leaderNickname;
  long maxGrade; // TODO: int로 바꿀 수 있나?
  long minGrade; // TODO: int로 바꿀 수 있나?
  String region;
  long teamId;
  String teamName;

  public TeamDTO(Gender gender, String introduction, long leaderId, int maxGrade, int minGrade, String region, long teamId, String teamName) {
    this.gender = gender;
    this.introduction = introduction;
    this.leaderId = leaderId;
    this.maxGrade = maxGrade;
    this.minGrade = minGrade;
    this.region = region;
    this.teamId = teamId;
    this.teamName = teamName;
  }

  public TeamDTO() {}

  public TeamDTO(Gender gender, String introduction, long leaderId, String leaderNickname, long maxGrade, long minGrade, String region, long teamId, String teamName) {
    this.gender = gender;
    this.introduction = introduction;
    this.leaderId = leaderId;
    this.leaderNickname = leaderNickname;
    this.maxGrade = maxGrade;
    this.minGrade = minGrade;
    this.region = region;
    this.teamId = teamId;
    this.teamName = teamName;
  }

  public String getLeaderNickname() {return leaderNickname;}

  public void setLeaderNickname(String leaderNickname) {this.leaderNickname = leaderNickname;}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final Object $gender = this.getGender();
    result = result * PRIME + ($gender == null ? 43 : $gender.hashCode());
    final Object $introduction = this.getIntroduction();
    result = result * PRIME + ($introduction == null ? 43 : $introduction.hashCode());
    final long $leaderId = this.getLeaderId();
    result = result * PRIME + Long.hashCode($leaderId);
    result = Math.toIntExact((long) result * PRIME + this.getMaxGrade());
    result = Math.toIntExact((long) result * PRIME + this.getMinGrade());
    final Object $region = this.getRegion();
    result = result * PRIME + ($region == null ? 43 : $region.hashCode());
    final long $teamId = this.getTeamId();
    result = result * PRIME + Long.hashCode($teamId);
    final Object $teamName = this.getTeamName();
    result = result * PRIME + ($teamName == null ? 43 : $teamName.hashCode());
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof TeamDTO other)) return false;
    if (!other.canEqual(this)) return false;
    final Object this$gender = this.getGender();
    final Object other$gender = other.getGender();
    if (!Objects.equals(this$gender, other$gender)) return false;
    final Object this$introduction = this.getIntroduction();
    final Object other$introduction = other.getIntroduction();
    if (!Objects.equals(this$introduction, other$introduction)) return false;
    if (this.getLeaderId() != other.getLeaderId()) return false;
    if (this.getMaxGrade() != other.getMaxGrade()) return false;
    if (this.getMinGrade() != other.getMinGrade()) return false;
    final Object this$region = this.getRegion();
    final Object other$region = other.getRegion();
    if (!Objects.equals(this$region, other$region)) return false;
    if (this.getTeamId() != other.getTeamId()) return false;
    final Object this$teamName = this.getTeamName();
    final Object other$teamName = other.getTeamName();
    return Objects.equals(this$teamName, other$teamName);
  }

  protected boolean canEqual(final Object other) {return other instanceof TeamDTO;}

  public String toString() {return "TeamDTO(gender=" + this.getGender() + ", introduction=" + this.getIntroduction() + ", leaderId=" + this.getLeaderId() + ", maxGrade=" + this.getMaxGrade() + ", minGrade=" + this.getMinGrade() + ", region=" + this.getRegion() + ", teamId=" + this.getTeamId() + ", teamName=" + this.getTeamName() + ")";}

  public Gender getGender() {return this.gender;}

  public void setGender(Gender gender) {this.gender = gender;}

  public String getIntroduction() {return this.introduction;}

  public void setIntroduction(String introduction) {this.introduction = introduction;}

  public long getLeaderId() {return this.leaderId;}

  public void setLeaderId(long leaderId) {this.leaderId = leaderId;}

  public long getMaxGrade() {return this.maxGrade;}

  public void setMaxGrade(long maxGrade) {this.maxGrade = maxGrade;}

  public long getMinGrade() {return this.minGrade;}

  public void setMinGrade(long minGrade) {this.minGrade = minGrade;}

  public String getRegion() {return this.region;}

  public void setRegion(String region) {this.region = region;}

  public long getTeamId() {return this.teamId;}

  public void setTeamId(long teamId) {this.teamId = teamId;}

  public String getTeamName() {return this.teamName;}

  public void setTeamName(String teamName) {this.teamName = teamName;}
}
