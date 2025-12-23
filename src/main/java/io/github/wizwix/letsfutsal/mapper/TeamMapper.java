package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeamMapper {
  int addMemberToTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  int insertTeam(TeamDTO team);

  int removeMemberToTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  List<UserDTO> selectMembersByTeamId(long teamId);

  TeamDTO selectTeamById(long teamId);

  List<TeamDTO> selectTeamsByRegion(String region);

  int updateTeam(TeamDTO team);
}
