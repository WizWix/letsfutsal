CREATE TABLE team (
    team_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    leader_id BIGINT NOT NULL,
    gender VARCHAR(10),
    min_grade INT,
    max_grade INT,
    region VARCHAR(50),
    profile_image VARCHAR(255),

    FOREIGN KEY (leader_id) REFERENCES user(user_id)
);


CREATE TABLE team_match (
    match_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    stadium_id BIGINT,
    datetime DATETIME,
    gender VARCHAR(10),
    min_grade INT,
    max_grade INT,
    status VARCHAR(20),
    team_id1 BIGINT,
    team_id2 BIGINT,

    FOREIGN KEY (stadium_id) REFERENCES stadium(id),
    FOREIGN KEY (team_id1) REFERENCES team(id),
    FOREIGN KEY (team_id2) REFERENCES team(id)
);


