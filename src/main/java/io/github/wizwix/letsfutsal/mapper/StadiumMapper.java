package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.StadiumDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StadiumMapper {
  int insertStadium(@Param("stadium") StadiumDTO stadium);

  List<StadiumDTO> selectAllStadiums();

  StadiumDTO selectStadiumById(@Param("stadiumId") long stadiumId);

  List<StadiumDTO> selectStadiumsByRegion(@Param("region") String region);

  int updateStadium(@Param("stadium") StadiumDTO stadium);
}
