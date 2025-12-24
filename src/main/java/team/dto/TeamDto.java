package team.dto;

public class TeamDto {

	private String team_id;
	private String leader_id;
	private String gender;
	private String min_grade;
	private String max_grade;
	private String region;
	private String introduction;
	
	public TeamDto() {
	}
	
	public TeamDto(String team_id, String leader_id, String gender, String min_grade, String max_grade, String region,
			String introduction) {
		super();
		this.team_id = team_id;
		this.leader_id = leader_id;
		this.gender = gender;
		this.min_grade = min_grade;
		this.max_grade = max_grade;
		this.region = region;
		this.introduction = introduction;
	}

	public String getTeam_id() {
		return team_id;
	}

	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}

	public String getLeader_id() {
		return leader_id;
	}

	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMin_grade() {
		return min_grade;
	}

	public void setMin_grade(String min_grade) {
		this.min_grade = min_grade;
	}

	public String getMax_grade() {
		return max_grade;
	}

	public void setMax_grade(String max_grade) {
		this.max_grade = max_grade;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
}
