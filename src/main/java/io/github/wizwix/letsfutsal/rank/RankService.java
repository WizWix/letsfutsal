package io.github.wizwix.letsfutsal.rank;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import io.github.wizwix.letsfutsal.mapper.TeamMapper;
import io.github.wizwix.letsfutsal.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RankService implements IRankService {
  private final UserMapper userMapper;

  @Autowired
  public RankService(UserMapper userMapper) {
    this.userMapper = userMapper;
  }

  @Override
  public List<TeamRankDTO> getTeamRankings(int grade) {
    return new ArrayList<>();
  }

  @Override
  public List<UserDTO> getUserRankings(int grade, String position) {
    return userMapper.selectTopUsersByGradeAndPosition(grade, position);
  }
}
