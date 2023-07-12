-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/IVRqna
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Teams" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Goals" (
    "ID" int   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Players" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    "position" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Referees" (
    "ID" int   NOT NULL,
    "name" txt   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Matches" (
    "ID" int   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "date" DATE   NOT NULL,
    "season_id" int   NOT NULL,
    "head_ref_id" int   NOT NULL,
    "assist_ref_id" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Season" (
    "ID" int   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Standings" (
    "ID" int   NOT NULL,
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" text   NOT NULL,
    CONSTRAINT "pk_Standings" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("ID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("ID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_head_ref_id" FOREIGN KEY("head_ref_id")
REFERENCES "Referees" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_assist_ref_id" FOREIGN KEY("assist_ref_id")
REFERENCES "Referees" ("ID");

ALTER TABLE "Standings" ADD CONSTRAINT "fk_Standings_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("ID");

ALTER TABLE "Standings" ADD CONSTRAINT "fk_Standings_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("ID");

