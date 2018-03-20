SELECT year, school,apply,admit,r_admit
#   @r_admit_rank := IF(@current_year = year, @r_admit_rank + 1, 1) AS rank,
#   @current_year := year as year
FROM match.vw_berkeley_app_adm_enr
WHERE county LIKE 'CHI%'
ORDER BY  r_admit DESC;