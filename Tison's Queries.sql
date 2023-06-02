-- 3rd & 5th queries

SELECT age, mp_per_g AS average_mins_played
-- find the age and average points per game for players
FROM playoff_stat
GROUP BY age
ORDER BY age;
-- order by sorts the records in ascending order by default
-- so we can see the avg mins played as players get older

SELECT player, pts_per_g AS average_pts_per_game
FROM playoff_stat
GROUP BY player
ORDER BY average_pts_per_game DESC
-- limit 10 in descending order to restrict the output
-- to the top 10 players with the highest average points per game
LIMIT 10; 