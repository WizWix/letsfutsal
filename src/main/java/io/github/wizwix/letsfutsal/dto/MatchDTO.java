package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.Gender;
import io.github.wizwix.letsfutsal.enums.Match;

import java.time.LocalDateTime;

public class MatchDTO {
  Gender gender;
  LocalDateTime matchDateTime;
  long matchId;
  Match matchType;
  long maxGrade;
  long minGrade;
  long renterEntityId;
  long stadiumId;
  int status;
}
