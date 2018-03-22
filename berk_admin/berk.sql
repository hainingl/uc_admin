use match;
DROP  TABLE berk_all ;

CREATE TABLE berk_all AS
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
     FROM berk
     WHERE name = 'app') app
    JOIN
    (SELECT *
     FROM berk
     WHERE name = 'adm') adm
      ON app.year = adm.year AND app.cal1 = adm.cal1 AND app.ethnic = adm.ethnic
    JOIN
    (SELECT *
     FROM berk
     WHERE name = 'enr') enr
      ON app.year = enr.year AND app.cal1 = enr.cal1 AND app.ethnic = enr.ethnic
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8;

SELECT count(*)
FROM berk
LIMIT 10;

SELECT count(*)
FROM berk_all
LIMIT 10;
SELECT *
FROM berk_all
LIMIT 100;


drop table berk;

CREATE TABLE  berk (
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

LOAD DATA LOCAL INFILE '/home/hainingliu/berk_08_12.csv' INTO TABLE berk
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    IGNORE 1 LINES
;

select year, count(*) from berk group by year;
select count(*) from berk;
select * from berk limit 30;