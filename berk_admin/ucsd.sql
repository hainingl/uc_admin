use match;

DROP  TABLE sd_all ;

CREATE TABLE sd_all AS
  SELECT
    app.year,
    app.school,
    app.city,
    app.county,
    app.ethnic,
    app.val AS app,
    adm.val AS adm,
    enr.val AS enr
  FROM
    (SELECT *
     FROM ucsd
     WHERE name = 'app') app
    JOIN
    (SELECT *
     FROM ucsd
     WHERE name = 'adm') adm
      ON app.year = adm.year AND app.cal1 = adm.cal1 AND app.ethnic = adm.ethnic
    JOIN
    (SELECT *
     FROM ucsd
     WHERE name = 'enr') enr
      ON app.year = enr.year AND app.cal1 = enr.cal1 AND app.ethnic = enr.ethnic
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8;

SELECT count(*)
FROM ucsd
LIMIT 10;


DROP TABLE ucsd;

CREATE TABLE  ucsd (
    df_indx INT,
    cal1 VARCHAR(100),
    city VARCHAR(100),
    county VARCHAR(100),
    name VARCHAR(100),
    school VARCHAR(100),
    ethnic VARCHAR(100),
    val INT,
    year INT
) ;


LOAD DATA LOCAL INFILE '/home/hainingliu/ucsd.csv' INTO TABLE ucsd
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    IGNORE 1 LINES
;

select year, count(*) from ucsd group by year;
select count(*) from ucsd;
select * from ucsd limit 30;