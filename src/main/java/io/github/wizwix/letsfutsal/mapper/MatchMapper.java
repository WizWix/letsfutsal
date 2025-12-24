package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MatchMapper {
  int insertIndividualParticipant(@Param("matchId") long matchId, @Param("userId") long userId);

  int insertMatch(@Param("match") MatchDTO match);

  int insertTeamParticipant(@Param("matchId") long matchId, @Param("teamId") long teamId);

  MatchDTO selectMatchById(@Param("matchId") long matchId);

  List<MatchDTO> selectMatchesByRegionAndType(@Param("region") String region, @Param("type") String type);

  int updateMatchStatus(@Param("matchId") long matchId, @Param("status") int status);
}
