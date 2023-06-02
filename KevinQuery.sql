SELECT pt.player_name, COUNT(DISTINCT pt.team_id)
FROM player_table as pt
GROUP BY pt.player_name
HAVING COUNT(DISTINCT pt.team_id) > 1;


Select pt.team_id, AVG(gt.mp_per_g)
From game_table as gt
Join player_table as pt on pt.unique_id = gt.unique_id
Group by pt.team_id;

