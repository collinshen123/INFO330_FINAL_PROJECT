-- creating table called player_table
CREATE TABLE IF NOT EXISTS player_table (
    UniqueID INTEGER PRIMARY KEY,
    player VARCHAR,
    position VARCHAR,
    age INTEGER,
    teamID INTEGER
);


-- Inserting information into player_table from playoff_stat
INSERT INTO player_table (player, position, age, teamID)
SELECT
    playoff_stat.player,
    playoff_stat.pos,
    playoff_stat.age,
    playoff_stat.team_id
FROM playoff_stat;


-- creating a season table
CREATE TABLE IF NOT EXISTS season_table (
    season_id INTEGER PRIMARY KEY,
    season TEXT,
    mp_
);


-- Inserting into season table
INSERT INTO season_table (season)
SELECT
    playoff_stat.season
FROM playoff_stat;


-- creating temp table for games
CREATE TABLE IF NOT EXISTS games_table (
    UniqueID INTEGER PRIMARY KEY AUTOINCREMENT,
	games_played INTEGER,
    games_started INTEGER,
    mp_per_g INTEGER,
    
    FOREIGN KEY(UniqueID) REFERENCES player_table(UniqueID)
);




INSERT INTO games_table (games_played, games_started, mp_per_g)
SELECT
    playoff_stat.g,
    playoff_stat.gs,
    playoff_stat.mp_per_g
FROM playoff_stat;




-- creating composite table
CREATE TABLE IF NOT EXISTS composite_table (
    Comp_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    season_id INTEGER,
    UniqueID INTEGER,
    FOREIGN KEY(season_id) REFERENCES season_table(season_id),
    FOREIGN KEY(UniqueID) REFERENCES player_table(UniqueID)
);


INSERT INTO composite_table (season_id, UniqueID)
SELECT season_table.season_id, player_table.UniqueID
FROM
    season_table
JOIN playoff_stat ON season_table.season = playoff_stat.season
JOIN player_table ON playoff_stat.player = player_table.player
GROUP BY UniqueID;




CREATE TABLE IF NOT EXISTS offensive_table (
    Comp_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    fg_pct INTEGER,
    fg2_pct INTEGER,
    fg3_pct INTEGER,
    ft_pct INTEGER,
    orb_pct INTEGER,
    ast_pct INTEGER,
    tov_pct INTEGER,
    pts_per_g INTEGER,
    FOREIGN KEY (Comp_ID) REFERENCES composite_table(Comp_ID)
);


INSERT INTO offensive_table (fg_pct, fg2_pct, fg3_pct, ft_pct, orb_pct, ast_pct, tov_pct, pts_per_g)
SELECT
    playoff_stat.fg_pct,
    playoff_stat.fg2_pct,
    playoff_stat.fg3_pct,
    playoff_stat.ft_pct,
    playoff_stat.orb_pct,
    playoff_stat.ast_pct,
    playoff_stat.tov_pct,
    playoff_stat.pts_per_g
FROM playoff_stat;


Create table if not exists defensive_table(
    Comp_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    stl_pct INTEGER,
    blk_pct INTEGER,
    drb_pct INTEGER,
    FOREIGN KEY (Comp_ID) REFERENCES composite_table(Comp_ID)
);


INSERT INTO defensive_table (stl_pct, blk_pct, drb_pct)
SELECT
    playoff_stat.stl_pct,
    playoff_stat.blk_pct,
    playoff_stat.drb_pct
FROM playoff_stat; 