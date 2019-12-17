-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "player" (
    "player_id" int   NOT NULL,
    "full_name" varchar(40)   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "is_active" boolean   NOT NULL,
    "born_country" varchar(30)   NOT NULL,
    CONSTRAINT "pk_player" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "team" (
    "team_id" char(3)   NOT NULL,
    "full_name" varchar(30)   NOT NULL,
    "nickname" varchar(15)   NOT NULL,
    "city" varchar(20)   NOT NULL,
    "state" varchar(20)   NOT NULL,
    "year_founded" int   NOT NULL,
    "api_team_id" int   NOT NULL,
    CONSTRAINT "pk_team" PRIMARY KEY (
        "team_id"
     )
);

CREATE TABLE "team_player" (
    "team_id" CHAR(3)   NOT NULL,
    "player_id" INT   NOT NULL,
    "start_season" INT   NOT NULL,
    "end_season" INT   NOT NULL,
    CONSTRAINT "pk_team_player" PRIMARY KEY (
        "team_id","player_id","start_season"
     )
);

CREATE TABLE "salary" (
    "salary_id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "salary" float   NOT NULL,
    "start_season" int   NOT NULL,
    "end_season" int   NOT NULL,
    "id_team" CHAR(3)   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "salary_id"
     )
);

CREATE TABLE "player_stats" (
    "player_id" int   NOT NULL,
    "start_season" int   NOT NULL,
    "end_season" int   NOT NULL,
    "team_id" varchar(3)   NOT NULL,
    "GP" float   NOT NULL,
    "GS" float   NOT NULL,
    "MIN" float   NOT NULL,
    "FGM" float   NOT NULL,
    "FGA" float   NOT NULL,
    "FG_PCT" float   NOT NULL,
    "FG3M" float   NOT NULL,
    "FG3A" float   NOT NULL,
    "FG3_PCT" float   NOT NULL,
    "FTM" float   NOT NULL,
    "FTA" float   NOT NULL,
    "FT_PCT" float   NOT NULL,
    "OREB" float   NOT NULL,
    "DREB" float   NOT NULL,
    "REB" float   NOT NULL,
    "AST" float   NOT NULL,
    "STL" float   NOT NULL,
    "BLK" float   NOT NULL,
    "TOV" float   NOT NULL,
    "PF" float   NOT NULL,
    "PTS" float   NOT NULL,
    CONSTRAINT "pk_player_stats" PRIMARY KEY (
        "player_id","start_season"
     )
);

CREATE TABLE "team_stats" (
    "team_id" varchar(3)   NOT NULL,
    "start_season" int   NOT NULL,
    "end_season" int   NOT NULL,
    "GP" float   NOT NULL,
    "W" float   NOT NULL,
    "L" float   NOT NULL,
    "W_PCT" float   NOT NULL,
    "MIN" float   NOT NULL,
    "FGM" float   NOT NULL,
    "FGA" float   NOT NULL,
    "FG_PCT" float   NOT NULL,
    "FG3M" float   NOT NULL,
    "FG3A" float   NOT NULL,
    "FG3_PCT" float   NOT NULL,
    "FTM" float   NOT NULL,
    "FTA" float   NOT NULL,
    "FT_PCT" float   NOT NULL,
    "OREB" float   NOT NULL,
    "DREB" float   NOT NULL,
    "REB" float   NOT NULL,
    "AST" float   NOT NULL,
    "TOV" float   NOT NULL,
    "STL" float   NOT NULL,
    "BLK" float   NOT NULL,
    "BLKA" float   NOT NULL,
    "PF" float   NOT NULL,
    "PFD" float   NOT NULL,
    "PTS" float   NOT NULL,
    CONSTRAINT "pk_team_stats" PRIMARY KEY (
        "team_id","start_season"
     )
);

ALTER TABLE "team_player" ADD CONSTRAINT "fk_team_player_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("team_id");

ALTER TABLE "team_player" ADD CONSTRAINT "fk_team_player_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "player_stats" ADD CONSTRAINT "fk_player_stats_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("player_id");

ALTER TABLE "team_stats" ADD CONSTRAINT "fk_team_stats_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("team_id");

