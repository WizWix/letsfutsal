package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.Gender;
import lombok.Data;

@Data
public class TeamDTO {
	
	Gender gender;
	String introduction;
	long leaderId;
	long maxGrade;
	long minGrade;
	String region;
	long teamId;
	String teamName;
	
}
