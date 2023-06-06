SELECT pt.player, dt.stl_pct
FROM defensive_table AS dt
JOIN composite_table AS ct ON ct.Comp_ID = dt.Comp_ID
JOIN player_table AS pt ON pt.UniqueID = ct.UniqueID
JOIN season_table AS st ON st.season_id = ct.season_id
WHERE dt.stl_pct IS NOT NULL AND dt.stl_pct <> '' AND st.season = 2022
ORDER BY dt.stl_pct DESC
LIMIT 15;


SELECT pt.position, AVG(ot.fg3_pct) AS avg_fg3_pct
FROM offensive_table AS ot
JOIN composite_table AS ct ON ct.Comp_ID = ot.Comp_ID
JOIN player_table AS pt ON pt.UniqueID = ct.UniqueID
GROUP BY pt.position;