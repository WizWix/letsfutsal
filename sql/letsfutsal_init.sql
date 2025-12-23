set foreign_key_checks = 0;
drop table if exists `letsfutsal`.`user`;
drop table if exists `letsfutsal`.`team`;
drop table if exists `letsfutsal`.`team_member`;
drop table if exists `letsfutsal`.`entity`;
drop table if exists `letsfutsal`.`stadium`;
drop table if exists `letsfutsal`.`game_match`;
drop table if exists `letsfutsal`.`match_individual_players`;
drop table if exists `letsfutsal`.`match_team_participants`;
drop table if exists `letsfutsal`.`free_board`;
drop table if exists `letsfutsal`.`free_board_category`;
drop table if exists `letsfutsal`.`free_board_comment`;
set foreign_key_checks = 1;

-- 회원
create table `letsfutsal`.`user`
(
  `user_id`            bigint auto_increment primary key,
  `email`              varchar(100) not null unique,
  `password`           varchar(255) not null,
  `nickname`           varchar(30)  not null,
  `created_at`         datetime              default current_timestamp(), -- 계정 생성일 (자동 생성)
  `gender`             enum('MALE', 'FEMALE') not null,
  `preferred_position` varchar(30) null,                                  -- 선호 포지션
  `introduction`       text null,                                         -- 자기 소개
  `point`              bigint       not null default 0,                   -- 누적 경험치 포인트
  `grade`              int          not null default 0                    -- 변동 가능한 실력 등급 (0 ~ 3)
);

-- 팀
create table `letsfutsal`.`team`
(
  `team_id`      bigint auto_increment primary key,
  `team_name`    varchar(100) not null,
  `leader_id`    bigint       not null,
  `gender`       enum('MALE', 'FEMALE', 'BOTH') null,
  `min_grade`    int null,          -- (0 ~ 3)
  `max_grade`    int null,          -- (0 ~ 3)
  `region`       varchar(100) null, -- 개략적인 지역 (서울, 충북 등)
  `introduction` text null,         -- 팀 소개
  foreign key (`leader_id`) references `letsfutsal`.`user` (`user_id`)
);

-- 팀 멤버 목록
create table `letsfutsal`.`team_member`
(
  `team_id`   bigint not null,
  `user_id`   bigint not null,
  `joined_at` datetime default current_timestamp(),
  primary key (`team_id`, `user_id`),
  foreign key (`team_id`) references `letsfutsal`.`team` (`team_id`),
  foreign key (`user_id`) references `letsfutsal`.`user` (`user_id`)
);

-- 회원/팀 묶음 (회원이거나 팀이거나)
create table `letsfutsal`.`entity`
(
  `entity_id`   bigint auto_increment primary key,
  `entity_type` enum('USER', 'TEAM') not null,
  `user_id`     bigint null,
  `team_id`     bigint null,
  foreign key (`user_id`) references `letsfutsal`.`user` (`user_id`),
  foreign key (`team_id`) references `letsfutsal`.`team` (`team_id`),
  check (
    (entity_type = 'USER' and user_id is not null and team_id is null) or
    (entity_type = 'TEAM' and team_id is not null and user_id is null)
    )
);

-- 구장
create table `letsfutsal`.`stadium`
(
  `stadium_id`   bigint auto_increment primary key,
  `region`       varchar(100) not null, -- 개략적인 지역 (서울, 충북 등)
  `location`     varchar(300) not null, -- 상세 주소 (서울 동작구 XX동 등)
  `start_hour`   time         not null, -- 운영 시작 시각
  `end_hour`     time         not null, -- 운영 종료 시각
  `introduction` text null              -- 구장 소개
);

-- 경기 (개인, 팀, 대여 모두 포함)
create table `letsfutsal`.`game_match`
(
  `match_id`         bigint auto_increment primary key,
  `stadium_id`       bigint   not null,
  `renter_entity_id` bigint null,
  `match_type`       enum('INDIVIDUAL', 'TEAM', 'RENT') not null,
  `match_datetime`   datetime not null,
  `gender`           enum('MALE', 'FEMALE', 'BOTH') not null,
  `min_grade`        int      not null, -- (0 ~ 3)
  `max_grade`        int      not null, -- (0 ~ 3)
  `status`           tinyint  not null default 0,
  foreign key (`stadium_id`) references `letsfutsal`.`stadium` (`stadium_id`),
  foreign key (`renter_entity_id`) references `letsfutsal`.`entity` (`entity_id`)
);

-- 개인 경기
create table `letsfutsal`.`match_individual_players`
(
  `match_id` bigint not null,
  `user_id`  bigint not null,
  primary key (`match_id`, `user_id`),
  foreign key (`match_id`) references `letsfutsal`.`game_match` (`match_id`),
  foreign key (`user_id`) references `letsfutsal`.`user` (`user_id`)
);

-- 팀 경기
create table `letsfutsal`.`match_team_participants`
(
  `match_id` bigint not null,
  `team_id`  bigint not null,
  primary key (`match_id`, `team_id`),
  foreign key (`match_id`) references `letsfutsal`.`game_match` (`match_id`),
  foreign key (`team_id`) references `letsfutsal`.`team` (`team_id`)
);

-- 자유 게시판 카테고리
create table `letsfutsal`.`free_board_category`
(
  `cate_id`   bigint auto_increment primary key,
  `cate_name` varchar(50) not null
);

-- 자유 게시판
create table `letsfutsal`.`free_board`
(
  `article_id` bigint auto_increment primary key,                 -- 글 ID (자동 생성)
  `cate_id`    bigint       not null,                             -- 카테고리 ID
  `author_id`  bigint       not null,                             -- 작성자(회원) ID
  `title`      varchar(100) not null,
  `content`    text         not null,
  `created_at` datetime              default current_timestamp(), -- 글 생성일 (자동 생성)
  `views`      bigint       not null default 0,                   -- 조회수
  foreign key (`cate_id`) references `letsfutsal`.`free_board_category` (`cate_id`),
  foreign key (`author_id`) references `letsfutsal`.`user` (`user_id`)
);

-- 자유 게시판 덧글
create table `letsfutsal`.`free_board_comment`
(
  `comment_id` bigint auto_increment primary key,
  `article_id` bigint not null,
  `author_id`  bigint not null,
  `parent_id`  bigint null default 0,                -- (존재할 시) 상위 덧글
  `content`    text   not null,
  `created_at` datetime default current_timestamp(), -- 덧글 생성일 (자동 생성)
  foreign key (`article_id`) references `letsfutsal`.`free_board` (`article_id`),
  foreign key (`author_id`) references `letsfutsal`.`user` (`user_id`)
);
