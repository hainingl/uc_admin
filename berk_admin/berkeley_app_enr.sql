USE match;

-- create berkeley_app
DROP TABLE berkeley_app;

CREATE TABLE berkeley_app  AS
  SELECT 2013 as  apply_year,
    a.*
  FROM berkeley_app_2013 a
  WHERE cal1 in
        (
          SELECT cal1
          FROM berkeley_app_2013 b
          WHERE b.name='app' and b.val>15
        )
    and ethnic='All'

  UNION
  SELECT 2014 as  apply_year, a.*
  FROM berkeley_app_2014 a
  WHERE cal1 in
        (
          SELECT cal1
          FROM berkeley_app_2014 b
          WHERE b.name='app' and b.val>15
        )
        and ethnic='All'
  UNION
  SELECT 2015 as  apply_year, a.*
  FROM berkeley_app_2015 a
  WHERE cal1 in
        (
          SELECT cal1
          FROM berkeley_app_2015 b
          WHERE b.name='app' and b.val>15
        )
        and ethnic='All'
  UNION
  SELECT 2016 as  apply_year, a.*
  FROM berkeley_app_2016 a
  WHERE cal1 in
        (
          SELECT cal1
          FROM berkeley_app_2016 b
          WHERE b.name='app' and b.val>15
        )
        and ethnic='All'
  UNION
  SELECT 2017 as  apply_year, a.*
  FROM berkeley_app_2017 a
  WHERE cal1 in
        (
          SELECT cal1
          FROM berkeley_app_2017 b
          WHERE b.name='app' and b.val>15
        )
        and ethnic='All'

;
SELECT * FROM berkeley_app;

-- load zip_city
-- "zip_code","latitude","longitude","city","state","county"
CREATE TABLE match.zip_city_county (
  zip INT,
  lat FLOAT,
  lon FLOAT,
  city VARCHAR(100),
  state VARCHAR(100),
  county VARCHAR(100)
);

LOAD DATA LOCAL INFILE '/home/hainingliu/zip_codes_states.csv' INTO TABLE zip_city_county
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
;


--- load original data
CREATE TABLE IF NOT EXISTS berkeley_app_2017 (
    cal1 VARCHAR(100),
    city VARCHAR(100),
    county VARCHAR(100),
    name VARCHAR(100),
    school VARCHAR(100),
    ethnic VARCHAR(100),
    val int
) ;

LOAD DATA LOCAL INFILE '/home/hainingliu/2017_FR_ENR_data.csv' INTO TABLE berkeley_2017
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
;