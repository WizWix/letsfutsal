package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
  int deleteUser(@Param("userId") long userId);

  int insertUser(@Param("user") UserDTO user);

  List<TeamDTO> selectTeamsByUserId(@Param("userId") long userId);

  List<UserDTO> selectTopUsersByGradeAndPosition(@Param("grade") int grade, @Param("position") String position);

  String selectNicknameByUserId(@Param("userId") long userId);

  UserDTO selectUserByEmail(@Param("email") String email);

  UserDTO selectUserById(@Param("userId") long userId);

  int updateGrade(@Param("userId") long userId, @Param("grade") long grade);

  int updatePoints(@Param("userId") long userId, @Param("point") long point);

  int updateUser(@Param("user") UserDTO user);
}
