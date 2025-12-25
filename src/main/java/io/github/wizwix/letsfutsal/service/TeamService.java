package io.github.wizwix.letsfutsal.service;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.mapper.TeamMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamService {

  private final TeamMapper teamMapper;

  public void create(TeamDTO team) {
    teamMapper.insertTeam(team);
  }

  public TeamDTO get(long teamId) {
    return teamMapper.selectTeamById(teamId);
  }

  public List<TeamDTO> list() {
    return teamMapper.selectTeams();
  }
}
