drop table if exists `free_board`;

create table `free_board`
(
  `article_id` bigint auto_increment	not null	default 1,
  `cate_id`    bigint       not null,
  `author_id`  bigint       not null,
  `title`      varchar(100) not null,
  `content`    text         not null,
  `views`      bigint       not null,
  constraint `PK_FREE_BOARD` primary key (`article_id`)
);

drop table if exists `user`;

create table `user`
(
  `user_id`            bigint auto_increment	not null	default 1,
  `team_id`            bigint null,
  `email`              varchar(100) not null,
  `password`           varchar(50)  not null,
  `nickname`           varchar(30)  not null,
  `created_at`         datetime     not null,
  `gender`             varchar(7)   not null,
  `preferred_position` varchar(30) null,
  `profile_image`      mediumblob null,
  `introduction`       text null,
  `point`              bigint       not null default 0,
  `grade`              int          not null default 0,
  constraint `PK_USER` primary key (`user_id`)
);

drop table if exists `stadium`;

create table `stadium`
(
  `id`            bigint auto_increment	not null	default 1,
  `region`        varchar(100) not null,
  `location`      varchar(300) not null,
  `start_hour`    time         not null,
  `end_hour`      time         not null,
  `stadium_image` mediumblob null,
  `introduction`  text null,
  constraint `PK_STADIUM` primary key (`id`)
);

drop table if exists `team`;

create table `team`
(
  `id`            bigint auto_increment	null	default 1,
  `leader_id`     bigint not null,
  `gender`        varchar(7) null,
  `min_grade`     int null	default 0,
  `max_grade`     int null,
  `region`        varchar(100) null,
  `profile_image` mediumblob null,
  `introduction`  text null,
  constraint `PK_MATCH_TEAM` primary key (`match_id`)
);

drop table if exists `match_team`;

create table `match_team`
(
  `match_id`   bigint auto_increment	not null	default 1,
  `stadium_id` bigint   not null,
  `datetime`   datetime not null,
  `gender`     varchar(7) null,
  `min_grade`  int      not null default 0,
  `max_grade`  int      not null,
  `status`     tinyint  not null,
  `team_id1`   bigint null,
  `team_id2`   bigint null
);

drop table if exists `free_board_category`;

create table `free_board_category`
(
  `cate_id`   bigint auto_increment	not null	default 1,
  `cate_name` varchar(50) not null,
  constraint `PK_FREE_BOARD_CATEGORY` primary key (`cate_id`)
);

drop table if exists `match_indiv`;

create table `match_indiv`
(
  `match_id`   bigint auto_increment	not null	default 1,
  `stadium_id` bigint   not null,
  `datetime`   datetime not null,
  `gender`     varchar(7) null,
  `min_grade`  int      not null,
  `max_grade`  int      not null,
  `status`     tinyint  not null,
  `user_id1`   bigint null,
  `user_id2`   bigint null,
  `user_id3`   bigint null,
  `user_id4`   bigint null,
  `user_id5`   bigint null,
  `user_id6`   bigint null,
  `user_id7`   bigint null,
  `user_id8`   bigint null,
  `user_id9`   bigint null,
  `user_id10`  bigint null,
  constraint `PK_MATCH_INDIV` primary key (`match_id`)
);

drop table if exists `free_board_comment`;

create table `free_board_comment`
(
  `comment_id` bigint auto_increment	not null	default 1,
  `article_id` bigint not null,
  `author_id`  bigint not null,
  `parent_id`  bigint null	default 0,
  `content`    text   not null,
  constraint `PK_FREE_BOARD_COMMENT` primary key (`comment_id`)
);

drop table if exists `rent_stadium`;

create table `rent_stadium`
(
  `match_id`   bigint auto_increment	not null,
  `stadium_id` bigint   not null,
  `datetime`   datetime not null,
  `status`     tinyint  not null,
  `user_id`    bigint null,
  `team_id`    bigint null,
  constraint `PK_RENT_STADIUM` primary key (`match_id`)
);
alter table `free_board`
  add constraint `FK_free_board_category_TO_free_board_1` foreign key (`cate_id`)
    references `free_board_category` (`cate_id`);

alter table `free_board`
  add constraint `FK_user_TO_free_board_1` foreign key (`author_id`)
    references `user` (`user_id`);

alter table `user`
  add constraint `FK_team_TO_user_1` foreign key (`team_id`)
    references `team` (`id`);

alter table `team`
  add constraint `FK_user_TO_team_1` foreign key (`leader_id`)
    references `user` (`user_id`);

alter table `match_team`
  add constraint `FK_stadium_TO_match_team_1` foreign key (`stadium_id`)
    references `stadium` (`id`);

alter table `match_team`
  add constraint `FK_team_TO_match_team_1` foreign key (`team_id1`)
    references `team` (`id`);

alter table `match_team`
  add constraint `FK_team_TO_match_team_2` foreign key (`team_id2`)
    references `team` (`id`);

alter table `match_indiv`
  add constraint `FK_stadium_TO_match_indiv_1` foreign key (`stadium_id`)
    references `stadium` (`id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_1` foreign key (`user_id1`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_2` foreign key (`user_id2`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_3` foreign key (`user_id3`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_4` foreign key (`user_id4`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_5` foreign key (`user_id5`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_6` foreign key (`user_id6`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_7` foreign key (`user_id7`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_8` foreign key (`user_id8`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_9` foreign key (`user_id9`)
    references `user` (`user_id`);

alter table `match_indiv`
  add constraint `FK_user_TO_match_indiv_10` foreign key (`user_id10`)
    references `user` (`user_id`);

alter table `free_board_comment`
  add constraint `FK_free_board_TO_free_board_comment_1` foreign key (`article_id`)
    references `free_board` (`article_id`);

alter table `free_board_comment`
  add constraint `FK_user_TO_free_board_comment_1` foreign key (`author_id`)
    references `user` (`user_id`);

alter table `rent_stadium`
  add constraint `FK_stadium_TO_rent_stadium_1` foreign key (`stadium_id`)
    references `stadium` (`id`);

alter table `rent_stadium`
  add constraint `FK_user_TO_rent_stadium_1` foreign key (`user_id`)
    references `user` (`user_id`);

alter table `rent_stadium`
  add constraint `FK_team_TO_rent_stadium_1` foreign key (`team_id`)
    references `team` (`id`);
