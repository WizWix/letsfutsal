set foreign_key_checks = 0;
drop table if exists `letsfutsal`.`user`;
drop table if exists `letsfutsal`.`team`;
drop table if exists `letsfutsal`.`team_member`;
drop table if exists `letsfutsal`.`stadium`;
drop table if exists `letsfutsal`.`game_match`;
drop table if exists `letsfutsal`.`match_individual_players`;
drop table if exists `letsfutsal`.`match_team_participants`;
drop table if exists `letsfutsal`.`free_board`;
drop table if exists `letsfutsal`.`free_board_category`;
drop table if exists `letsfutsal`.`free_board_comment`;
set foreign_key_checks = 1;

create table `letsfutsal`.`user`
(
  `user_id`            bigint auto_increment primary key,
  `email`              varchar(100) not null unique,
  `password`           varchar(255) not null,
  `nickname`           varchar(30)  not null,
  `created_at`         datetime              default current_timestamp(),
  `gender`             enum('MALE', 'FEMALE')   not null,
  `preferred_position` varchar(30) null,
  `profile_image`      mediumblob null,
  `introduction`       text null,
  `point`              bigint       not null default 0,
  `grade`              int          not null default 0
);

create table `letsfutsal`.`team`
(
  `team_id`       bigint auto_increment primary key,
  `leader_id`     bigint not null,
  `gender`        enum('MALE', 'FEMALE', 'BOTH') null,
  `min_grade`     int null,
  `max_grade`     int null,
  `region`        varchar(100) null,
  `profile_image` mediumblob null,
  `introduction`  text null,
  constraint `fk_team_leader` foreign key (`leader_id`) references `letsfutsal`.`user` (`user_id`)
);

create table `letsfutsal`.`team_member`
(
  `team_id`   bigint not null,
  `user_id`   bigint not null,
  `joined_at` datetime default current_timestamp(),
  primary key (`team_id`, `user_id`),
  foreign key (`team_id`) references `letsfutsal`.`team` (`team_id`),
  foreign key (`user_id`) references `letsfutsal`.`user` (`user_id`)
);

create table `letsfutsal`.`stadium`
(
  `stadium_id`    bigint auto_increment primary key,
  `region`        varchar(100) not null,
  `location`      varchar(300) not null,
  `start_hour`    time         not null,
  `end_hour`      time         not null,
  `stadium_image` mediumblob null,
  `introduction`  text null
);

create table `letsfutsal`.`game_match`
(
  `match_id`       bigint auto_increment primary key,
  `stadium_id`     bigint   not null,
  `match_type`     enum('INDIVIDUAL', 'TEAM', 'RENT') not null,
  `match_datetime` datetime not null,
  `status`         tinyint  not null default 0,
  foreign key (`stadium_id`) references `letsfutsal`.`stadium` (`stadium_id`)
);

create table `letsfutsal`.`match_individual_players`
(
  `match_id` bigint not null,
  `user_id`  bigint not null,
  primary key (`match_id`, `user_id`),
  foreign key (`match_id`) references `letsfutsal`.`game_match` (`match_id`),
  foreign key (`user_id`) references `letsfutsal`.`user` (`user_id`)
);

create table `letsfutsal`.`match_team_participants`
(
  `match_id` bigint not null,
  `team_id`  bigint not null,
  primary key (`match_id`, `team_id`),
  foreign key (`match_id`) references `letsfutsal`.`game_match` (`match_id`),
  foreign key (`team_id`) references `letsfutsal`.`team` (`team_id`)
);

create table `letsfutsal`.`free_board_category`
(
  `cate_id`   bigint auto_increment primary key,
  `cate_name` varchar(50) not null
);

create table `letsfutsal`.`free_board`
(
  `article_id` bigint auto_increment primary key,
  `cate_id`    bigint       not null,
  `author_id`  bigint       not null,
  `title`      varchar(100) not null,
  `content`    text         not null,
  `views`      bigint       not null,
  foreign key (`cate_id`) references `letsfutsal`.`free_board_category` (`cate_id`),
  foreign key (`author_id`) references `letsfutsal`.`user` (`user_id`)
);

create table `letsfutsal`.`free_board_comment`
(
  `comment_id` bigint auto_increment primary key,
  `article_id` bigint not null,
  `author_id`  bigint not null,
  `parent_id`  bigint null default 0,
  `content`    text   not null,
  foreign key (`article_id`) references `letsfutsal`.`free_board` (`article_id`),
  foreign key (`author_id`) references `letsfutsal`.`user` (`user_id`)
);
