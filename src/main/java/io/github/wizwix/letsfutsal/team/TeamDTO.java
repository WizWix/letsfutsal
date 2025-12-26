package io.github.wizwix.letsfutsal.team;

import io.github.wizwix.letsfutsal.enums.Gender;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class TeamDTO {
  Gender gender;
  String introduction;
  long leaderId;
  long maxGrade;
  long minGrade;
  String region;
  long teamId;
  String teamName;

  public TeamDTO() {
  }

  public TeamDTO(Gender gender, String introduction, long leaderId, long maxGrade, long minGrade, String region,
      long teamId, String teamName) {
    super();
    this.gender = gender;
    this.introduction = introduction;
    this.leaderId = leaderId;
    this.maxGrade = maxGrade;
    this.minGrade = minGrade;
    this.region = region;
    this.teamId = teamId;
    this.teamName = teamName;
  }

  public Gender getGender() {
    return gender;
  }

  public void setGender(Gender gender) {
    this.gender = gender;
  }

  public String getIntroduction() {
    return introduction;
  }

  public void setIntroduction(String introduction) {
    this.introduction = introduction;
  }

  public long getLeaderId() {
    return leaderId;
  }

  public void setLeaderId(long leaderId) {
    this.leaderId = leaderId;
  }

  public long getMaxGrade() {
    return maxGrade;
  }

  public void setMaxGrade(long maxGrade) {
    this.maxGrade = maxGrade;
  }

  public long getMinGrade() {
    return minGrade;
  }

  public void setMinGrade(long minGrade) {
    this.minGrade = minGrade;
  }

  public String getRegion() {
    return region;
  }

  public void setRegion(String region) {
    this.region = region;
  }

  public long getTeamId() {
    return teamId;
  }

  public void setTeamId(long teamId) {
    this.teamId = teamId;
  }

  public String getTeamName() {
    return teamName;
  }

  public void setTeamName(String teamName) {
    this.teamName = teamName;
  }
}
