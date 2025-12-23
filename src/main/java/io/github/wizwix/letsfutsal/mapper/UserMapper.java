package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
  int deleteUser(long userId);

  int insertUser(UserDTO user);

  List<TeamDTO> selectTeamsByUserId(long userId);

  UserDTO selectUserByEmail(long email);

  UserDTO selectUserById(long userId);

  int updateGrade(@Param("userId") long userId, @Param("grade") long grade);

  int updatePoints(@Param("userId") long userId, @Param("point") long point);

  int updateUser(UserDTO user);
}
