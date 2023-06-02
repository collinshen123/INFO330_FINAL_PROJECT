Select pt.player_name, dt.stl_pct
From defensive_table as dt
Join composite_table as ct on ct.unique_season_id = dt.unique_season_id
Join player_table as pt on pt.unique_id = ct.unique_id
Order By dt.stl_pct desc
Limit 10; 


Select pt.position, AVG(ot.fg3_pct)
From offensive_table as ot
Join composite_table as ct on ct.unique_season_id = ot.unique_season_id
Join player_table as pt on pt.unique_id = ct.unique_id
Group by pt.position; 