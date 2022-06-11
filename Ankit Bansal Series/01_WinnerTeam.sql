SELECT 
    team_nm,
    COUNT(1) AS matches_played,
    SUM(winner_flg) AS most_won
FROM
    (SELECT 
        team_1 AS team_nm,
            CASE
                WHEN team_1 = winner THEN 1
                ELSE 0
            END AS winner_flg
    FROM
        icc_world_cup UNION ALL 
        SELECT 
        team_2 AS team_nm,
            CASE
                WHEN team_2 = winner THEN 1
                ELSE 0
            END AS winner_flg
    FROM
        icc_world_cup) AS A
GROUP BY team_nm
ORDER BY most_won DESC
