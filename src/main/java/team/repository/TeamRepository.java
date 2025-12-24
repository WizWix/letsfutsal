package team.repository;

import java.util.ArrayList;
import java.util.List;

import team.dto.TeamDto;

public class TeamRepository {

	private static final List<TeamDto> teams = new ArrayList<>();

	public void save(TeamDto team) {
		teams.add(team);
	}

	public List<TeamDto> findAll() {
		return teams;
	}

	public TeamDto findById(String team_id) {
		for (TeamDto t : teams) {
			if (t.getTeam_id().equals(team_id)) {
				return t;
			}
		}
		return null;
	}
}