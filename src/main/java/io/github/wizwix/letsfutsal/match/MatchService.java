package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import io.github.wizwix.letsfutsal.enums.Gender;
import io.github.wizwix.letsfutsal.enums.Match;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Service
public class MatchService {
  private final MatchRepository matchRepository;

  public MatchService(MatchRepository matchRepository) {
    this.matchRepository = matchRepository;
  }

  // 경기 상세 조회
  public MatchDTO getMatchById(Long matchId) {
    return matchRepository.getMatchById(matchId);
  }

  // 경기 목록 조회
  public List<MatchDTO> getMatchList(String type, String stadiumName, String startHourStr, String endHourStr, String gender, Integer minGrade, Integer maxGrade, Integer status) {
    if (type.equalsIgnoreCase("all")) type = null;

    // 날짜 파싱
    LocalTime startHour = null;
    LocalTime endHour = null;
    if (startHourStr != null && !startHourStr.trim().isEmpty()) {
      startHour = LocalTime.parse(startHourStr);
    }
    if (endHourStr != null && !endHourStr.trim().isEmpty()) {
      endHour = LocalTime.parse(endHourStr);
    }

    return matchRepository.getMatchList(type != null ? Match.valueOf(type.toUpperCase()) : null, stadiumName, startHour, endHour, gender != null ? Gender.valueOf(gender.toUpperCase()) : null, minGrade, maxGrade, status);
  }
}
