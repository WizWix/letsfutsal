package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeamMapper {
  int addMemberToTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  int insertTeam(@Param("team") TeamDTO team);

  int removeMemberFromTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  List<UserDTO> selectMembersByTeamId(@Param("teamId") long teamId);

  TeamDTO selectTeamById(@Param("teamId") long teamId);

  List<TeamDTO> selectTeamsByRegion(@Param("region") String region);

  int updateTeam(@Param("team") TeamDTO team);

}
