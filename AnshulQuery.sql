-- 1st and 2nd queries
SELECT player, MAX(pts_per_g) AS max_points
-- Retrieves players with the highest average points per game (PTS) in playoffs
FROM playoffStats
GROUP BY player
ORDER BY max_points DESC;

SELECT pos, AVG(fg_pct) AS avg_fg_percentage
-- Calculates average field goal percentage (FG%) for each position (pos) in playoffs
FROM playoffStats
GROUP BY pos; 