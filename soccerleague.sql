
DROP DATABASE IF EXISTS soccerleague_db;
CREATE DATABASE soccerleague_db;
\c soccerleague_db;


CREATE TABLE "teams" (
    "id" SERIAL PRIMARY KEY,
    "team_name" text NOT NULL,
    "home_city" text NOT NULL
);

CREATE TABLE "players" (
    "id" SERIAL PRIMARY KEY,
    "team_id" INTEGER REFERENCES teams ON DELETE SET NULL,
    "name" TEXT NOT NULL,
    "birthday" DATE NOT NULL
);

CREATE TABLE "referees" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "seasons" (
    "id" SERIAL PRIMARY KEY,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);

CREATE TABLE "matches" (
    "id" SERIAL PRIMARY KEY, 
    "season_id" INTEGER REFERENCES seasons ON DELETE CASCADE,
    "home_team_id" INTEGER REFERENCES teams ON DELETE SET NULL,
    "away_team_id" INTEGER REFERENCES teams ON DELETE SET NULL,
    "referee_id" INTEGER REFERENCES referees ON DELETE SET NULL,
    "match_date" DATE NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE "results" (
    "id" SERIAL PRIMARY KEY,
    "season_id" INTEGER REFERENCES seasons ON DELETE CASCADE,
    "match_id" INTEGER REFERENCES matches  ON DELETE CASCADE,
    "team_id" INTEGER REFERENCES teams ON DELETE CASCADE,
    "result" TEXT NOT NULL
);

CREATE TABLE "goals" (
    "id" SERIAL PRIMARY KEY,
    "player_id" INTEGER REFERENCES players ON DELETE SET NULL,
    "match_id" INTEGER REFERENCES matches ON DELETE CASCADE,
    "match_time" TIME NOT NULL
);

CREATE INDEX teams_index ON teams (team_name);
CREATE INDEX players_index ON players (name);
CREATE INDEX referees_index ON referees (name);
CREATE INDEX match_index_hometeam ON matches (home_team_id);
CREATE INDEX match_index_awayteam ON matches (away_team_id);
CREATE INDEX goals_index ON goals (player_id);
