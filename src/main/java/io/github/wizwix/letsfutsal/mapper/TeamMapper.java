package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import io.github.wizwix.letsfutsal.rank.TeamRankDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TeamMapper {
  int addMemberToTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  int insertTeam(@Param("team") TeamDTO team);

  int removeMemberFromTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  List<UserDTO> selectMembersByTeamId(@Param("teamId") long teamId);

  TeamDTO selectTeamById(@Param("teamId") long teamId);

  TeamDTO selectTeamWithLeader(@Param("teamId") long teamId);

  List<TeamDTO> selectTeams();

  List<TeamDTO> selectTeamsByRegion(@Param("region") String region);

  List<TeamRankDTO> selectTopTeamsByGrade(@Param("grade") int grade);

  int updateTeam(@Param("team") TeamDTO team);
}
