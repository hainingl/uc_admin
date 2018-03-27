use match;


CREATE OR REPLACE VIEW vw_gpa_berk AS
  SELECT a.year, a.school,a.city,  a.county,
    a.app, a.adm,a.enr,
    g.app_gpa, g.adm_gpa,g.enr_gpa
    FROM berk_all a
  JOIN gpa g ON
      a.year=g.year and a.school=g.school
      AND a.county=g.county AND a.city=g.city
  WHERE g.college='berkeley' and a.ethnic='All'
  ;

SELECT * FROM vw_gpa_berk LIMIT 10;

DROP  TABLE gpa ;

CREATE TABLE gpa AS
  SELECT
    app.year,
    app.school,
    app.city,
    app.county,
    app.college,
    app.val AS app_gpa,
    adm.val AS adm_gpa,
    enr.val AS enr_gpa
  FROM
    (SELECT *
     FROM o_gpa
     WHERE name = 'App GPA') app
    JOIN
    (SELECT *
     FROM o_gpa
     WHERE name = 'Adm GPA') adm
      ON app.year = adm.year AND app.cal1 = adm.cal1 AND app.college = adm.college
    JOIN
    (SELECT *
     FROM o_gpa
     WHERE name = 'Enrl GPA') enr
      ON app.year = enr.year AND app.cal1 = enr.cal1 AND app.college = enr.college
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8;

SELECT *
FROM gpa
LIMIT 100;


SELECT count(*)
FROM gpa
LIMIT 10
;

drop table o_gpa;

CREATE TABLE  o_gpa (
    df_indx INT,
    cal1 VARCHAR(100),
    city VARCHAR(100),
    county VARCHAR(100),
    name VARCHAR(100),
    school VARCHAR(100),
    val Float,
    year INT,
    college VARCHAR(100)
) ;

LOAD DATA LOCAL INFILE '/home/hainingliu/gpa_berk_11_17.csv' INTO TABLE o_gpa
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    IGNORE 1 LINES
;

select year, count(*) from o_gpa group by year;
select * from o_gpa limit 30;
select count(*) from o_gpa;
