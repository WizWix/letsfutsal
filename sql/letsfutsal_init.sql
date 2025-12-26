set global log_bin_trust_function_creators = 1;
set foreign_key_checks = 0;
drop table if exists letsfutsal.user;
drop table if exists letsfutsal.team;
drop table if exists letsfutsal.team_member;
drop table if exists letsfutsal.entity;
drop table if exists letsfutsal.stadium;
drop table if exists letsfutsal.game_match;
drop table if exists letsfutsal.match_individual_players;
drop table if exists letsfutsal.match_team_participants;
drop table if exists letsfutsal.free_board;
drop table if exists letsfutsal.free_board_category;
drop table if exists letsfutsal.free_board_comment;
set foreign_key_checks = 1;

-- 회원
create table letsfutsal.user
(
  user_id            bigint auto_increment,                                        -- [PK] 1부터 시작
  email              varchar(100)            not null,
  password           varchar(255)            not null,
  nickname           varchar(30)             not null,
  created_at         datetime                         default current_timestamp(), -- 계정 생성일 (자동 생성)
  gender             enum ('MALE', 'FEMALE') not null,
  preferred_position varchar(30)             null,                                 -- 선호 포지션
  introduction       text                    null,                                 -- 자기 소개
  point              bigint                  not null default 0,                   -- 누적 경험치 포인트
  grade              int                     not null default 0,                   -- 변동 가능한 실력 등급 (0 ~ 3)
  constraint pk_user primary key (user_id),
  constraint uk_user_email unique (email),
  constraint uk_user_nickname unique (nickname)
);

-- 팀
create table letsfutsal.team
(
  team_id      bigint auto_increment,                -- [PK] 1부터 시작
  team_name    varchar(100)                    not null,
  leader_id    bigint                          not null,
  gender       enum ('MALE', 'FEMALE', 'BOTH') null,
  min_grade    int                             null, -- (0 ~ 3)
  max_grade    int                             null, -- (0 ~ 3)
  region       varchar(100)                    null, -- 개략적인 지역 (서울, 충북 등)
  introduction text                            null, -- 팀 소개
  constraint pk_team primary key (team_id),
  constraint fk_team_user_leader_id foreign key (leader_id) references letsfutsal.user (user_id)
);

-- 팀 멤버 목록
create table letsfutsal.team_member
(
  team_id   bigint not null, -- [PK]
  user_id   bigint not null, -- [PK]
  joined_at datetime default current_timestamp(),
  constraint pk_tm primary key (team_id, user_id),
  constraint fk_tm_team_team_id foreign key (team_id) references letsfutsal.team (team_id),
  constraint fk_tm_user_user_id foreign key (user_id) references letsfutsal.user (user_id)
);

-- 회원/팀 묶음 (회원이거나 팀이거나) - Polymorphic Association (Supertype/Subtype pattern)
create table letsfutsal.entity
(
  entity_id   bigint auto_increment, -- [PK] 1부터 시작
  entity_type enum ('USER', 'TEAM') not null,
  user_id     bigint                null,
  team_id     bigint                null,
  constraint pk_entity primary key (entity_id),
  constraint uk_user_id unique (user_id),
  constraint uk_team_id unique (team_id),
  constraint fk_entity_user_user_id foreign key (user_id) references letsfutsal.user (user_id) on delete cascade,
  constraint fk_entity_team_team_id foreign key (team_id) references letsfutsal.team (team_id) on delete cascade,
  constraint chk_uid_tid check (
    (entity_type = 'USER' and user_id is not null and team_id is null) or
    (entity_type = 'TEAM' and team_id is not null and user_id is null)
    )
);

-- 구장
create table letsfutsal.stadium
(
  stadium_id   bigint auto_increment, -- [PK] 1부터 시작
  name         varchar(100) not null, -- 구장 이름
  region       varchar(100) not null, -- 개략적인 지역 (서울, 충북 등)
  location     varchar(300) not null, -- 상세 주소 (서울 동작구 XX동 등)
  start_hour   time         not null, -- 운영 시작 시각
  end_hour     time         not null, -- 운영 종료 시각
  introduction text         null,     -- 구장 소개
  constraint pk_stadium primary key (stadium_id)
);

-- 경기 (개인, 팀, 대여 모두 포함)
create table letsfutsal.game_match
(
  match_id         bigint auto_increment,                        -- [PK] 1부터 시작
  stadium_id       bigint                              not null,
  renter_entity_id bigint                              null,
  match_type       enum ('INDIVIDUAL', 'TEAM', 'RENT') not null,
  match_datetime   datetime                            not null,
  gender           enum ('MALE', 'FEMALE', 'BOTH')     not null,
  min_grade        int                                 not null, -- (0 ~ 3)
  max_grade        int                                 not null, -- (0 ~ 3)
  status           tinyint                             not null default 0,
  constraint pk_gm primary key (match_id),
  constraint fk_gm_stadium_sid foreign key (stadium_id) references letsfutsal.stadium (stadium_id),
  constraint fk_gm_entity_reid foreign key (renter_entity_id) references letsfutsal.entity (entity_id)
);

-- 개인 경기
create table letsfutsal.match_individual_players
(
  match_id bigint not null, -- [PK]
  user_id  bigint not null, -- [PK]
  constraint pk_mip primary key (match_id, user_id),
  constraint fk_mip_gm_mid foreign key (match_id) references letsfutsal.game_match (match_id),
  constraint fk_mip_user_uid foreign key (user_id) references letsfutsal.user (user_id)
);

-- 팀 경기
create table letsfutsal.match_team_participants
(
  match_id bigint not null, -- [PK]
  team_id  bigint not null, -- [PK]
  constraint pk_mtp primary key (match_id, team_id),
  constraint fk_mtp_gm_mid foreign key (match_id) references letsfutsal.game_match (match_id),
  constraint fk_mtp_team_tid foreign key (team_id) references letsfutsal.team (team_id)
);

-- 자유 게시판 카테고리
create table letsfutsal.free_board_category
(
  cate_id   bigint auto_increment, -- [PK] 카테고리 ID / 1부터 시작
  cate_name varchar(50) not null,
  constraint pk_fbc primary key (cate_id)
);

-- 자유 게시판
create table letsfutsal.free_board
(
  article_id bigint auto_increment,                             -- [PK] 글 ID (자동 생성) / 1부터 시작
  cate_id    bigint       not null,                             -- 카테고리 ID
  author_id  bigint       not null,                             -- 작성자(회원) ID
  title      varchar(100) not null,
  content    text         not null,
  created_at datetime     not null default current_timestamp(), -- 글 생성일 (자동 생성)
  views      bigint       not null default 0,                   -- 조회수
  constraint pk_fb primary key (article_id),
  constraint fk_fb_fbc_cid foreign key (cate_id) references letsfutsal.free_board_category (cate_id),
  constraint fk_fb_user_aid foreign key (author_id) references letsfutsal.user (user_id)
);

-- 자유 게시판 댓글
create table letsfutsal.free_board_comment
(
  comment_id bigint auto_increment,                -- [PK] 댓글 ID (자동 생성) / 1부터 시작
  article_id bigint not null,
  author_id  bigint not null,
  parent_id  bigint null,                          -- (존재할 시) 상위 댓글
  content    text   not null,
  created_at datetime default current_timestamp(), -- 댓글 생성일 (자동 생성)
  is_deleted boolean  default false,               -- 삭제된 댓글 플래그 (댓글 트리 구조 보존을 위해 필요)
  constraint pk_fbc primary key (comment_id),
  constraint fk_fbc_fbc_pid foreign key (parent_id) references letsfutsal.free_board_comment (comment_id),
  constraint fk_fbc_fb_artiid foreign key (article_id) references letsfutsal.free_board (article_id) on delete cascade,
  constraint fk_fbc_user_authid foreign key (author_id) references letsfutsal.user (user_id)
);

-- 트리거
delimiter //
create definer = letsfutsal@localhost trigger trg_user_after_insert
  after insert
  on letsfutsal.user
  for each row
begin
  insert into letsfutsal.entity (entity_type, user_id, team_id)
  values ('USER', NEW.user_id, null);
end//

create definer = letsfutsal@localhost trigger trg_team_after_insert
  after insert
  on letsfutsal.team
  for each row
begin
  insert into letsfutsal.entity (entity_type, user_id, team_id)
  values ('TEAM', null, NEW.team_id);
end//
delimiter ;
