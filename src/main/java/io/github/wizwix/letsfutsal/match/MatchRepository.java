package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import io.github.wizwix.letsfutsal.enums.Gender;
import io.github.wizwix.letsfutsal.enums.Match;
import io.github.wizwix.letsfutsal.mapper.MatchMapper;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Repository
public class MatchRepository {
  private final MatchMapper matchMapper;

  public MatchRepository(MatchMapper matchMapper) {
    this.matchMapper = matchMapper;
  }

  // 개인 경기 참가자 수 조회
  public int countIndividualPlayers(Long matchId) {
    return matchMapper.countIndividualPlayers(matchId);
  }

  // 팀 경기 참가 팀 수 조회
  public int countTeamParticipants(Long matchId) {
    return matchMapper.countTeamParticipants(matchId);
  }

  // 경기 상세 조회
  public MatchDTO getMatchById(Long matchId) {
    return matchMapper.selectMatchById(matchId);
  }

  // 경기 목록 조회 (필터링 포함)
  public List<MatchDTO> getMatchList(Match matchType, String region, LocalTime startHour, LocalTime endHour, Gender gender, Integer minGrade, Integer maxGrade, Integer status) {
    return matchMapper.selectMatchList(matchType, region, startHour, endHour, gender, minGrade, maxGrade, status);
  }
}
