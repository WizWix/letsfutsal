package io.github.wizwix.letsfutsal.stadium;

import io.github.wizwix.letsfutsal.dto.StadiumDTO;
import io.github.wizwix.letsfutsal.mapper.StadiumMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StadiumService {
  private final StadiumMapper stadiumMapper;

  public StadiumService(StadiumMapper mapper) {
    this.stadiumMapper = mapper;
  }

  public void create(StadiumDTO stadium) {
    stadiumMapper.insertStadium(stadium);
  }

  public StadiumDTO get(long stadiumId) {
    return stadiumMapper.selectStadiumById(stadiumId);
  }

  public List<StadiumDTO> list() {
    return stadiumMapper.selectAllStadiums();
  }
}
