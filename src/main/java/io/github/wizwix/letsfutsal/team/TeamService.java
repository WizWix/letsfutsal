package io.github.wizwix.letsfutsal.team;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.mapper.TeamMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamService {
  @Autowired
  private TeamMapper teamMapper;

  public void create(TeamDTO team) {
    teamMapper.insertTeam(team);
  }

  public TeamDTO get(long teamId) {
    return teamMapper.selectTeamById(teamId);
  }

  public TeamDTO getget(long teamId) {
    return teamMapper.selectTeamWithLeader(teamId);
  }

  public List<TeamDTO> list() {
    return teamMapper.selectTeams();
  }
}
