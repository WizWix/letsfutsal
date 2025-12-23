package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.StadiumDTO;

import java.util.List;

public interface StadiumMapper {
  int insertStadium(StadiumDTO stadium);

  List<StadiumDTO> selectAllStadiums();

  StadiumDTO selectStadiumById(long stadiumId);

  List<StadiumDTO> selectStadiumsByRegion(String region);

  int updateStadium(StadiumDTO stadium);
}
