package team.service;

import java.util.List;

import team.dto.TeamDto;
import team.repository.TeamRepository;

public class TeamService {

	private final TeamRepository repo = new TeamRepository();

	public void create(TeamDto dto) {
		repo.save(dto);
	}

	public List<TeamDto> list() {
		return repo.findAll();
	}

	public TeamDto get(String team_id) {
		return repo.findById(team_id);
	}
}