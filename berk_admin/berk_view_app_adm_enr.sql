-- top
DROP TABLE top_berk_admit;
CREATE TABLE  top_berk_admit AS
SELECT  year, school, city, r_admit, apply, r_admit_rank
  FROM
    (SELECT year, school, city, r_admit,apply,
        @r_admit_rank := IF(@current_year = year, @r_admit_rank + 1, 1) AS r_admit_rank,
        @current_year := year
     FROM match.vw_berkeley_app_adm_enr
      WHERE city NOT LIKE 'N/A' and apply>200
     ORDER BY year, r_admit DESC
    ) ranked
  WHERE
    r_admit_rank <= 10
  ORDER BY year DESC, r_admit_rank ASC
;
select * from top_berk_admit;
-- view of all
CREATE OR REPLACE VIEW vw_berkeley_app_adm_enr AS
  SELECT a.apply_year year,
      a.city city,
      a.school school,
      a.val apply,
      m.val admit,
      e.val enroll,
      100* m.val/a.val  as r_admit,
      100* e.val /m.val as r_enrol
    FROM vw_ber_app a
     LEFT JOIN vw_ber_adm m
      on a.apply_year=m.apply_year AND a.school=m.school AND a.city=m.city
      LEFT JOIN  vw_ber_enr e
      ON a.apply_year=e.apply_year AND a.school=e.school AND a.city=e.city
      GROUP BY 1,2,3,4,5,6
 ;

SELECT * FROM vw_berkeley_app_adm_enr;

-- separate view app/adm/enr

CREATE OR REPLACE VIEW vw_ber_app AS
  SELECT  apply_year, school, city, name, val FROM berkeley_app
  WHERE name='app';

SELECT * FROM vw_berk_app;

CREATE OR REPLACE VIEW vw_ber_adm AS
  SELECT  apply_year, school, city, name, val FROM berkeley_app
  WHERE name='adm';

SELECT * FROM vw_ber_adm;

CREATE OR REPLACE VIEW vw_ber_enr AS
  SELECT  apply_year, school, city, name, val FROM berkeley_app
  WHERE name='enr';

SELECT * FROM vw_ber_enr;


-- foreign
CREATE TABLE  foreign_berk_admit AS
SELECT  year, school, city, r_admit, apply, r_admit_rank
  FROM
    (SELECT year, school, city, r_admit,apply,
        @r_admit_rank := IF(@current_year = year, @r_admit_rank + 1, 1) AS r_admit_rank,
        @current_year := year
     FROM match.vw_berkeley_app_adm_enr
      WHERE city  LIKE 'N/A'
     ORDER BY year, r_admit DESC
    ) ranked
  WHERE
    r_admit_rank <= 10
  ORDER BY year DESC, r_admit_rank ASC