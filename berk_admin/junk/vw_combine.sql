CREATE OR REPLACE  VIEW vw_ber_adm AS
  SELECT
    `match`.`berkeley_app`.`apply_year` AS `apply_year`,
    `match`.`berkeley_app`.`school`     AS `school`,
    `match`.`berkeley_app`.`city`       AS `city`,
    `match`.`berkeley_app`.`county`       AS `county`,
    `match`.`berkeley_app`.`name`       AS `name`,
    `match`.`berkeley_app`.`val`        AS `val`
  FROM `match`.`berkeley_app`
  WHERE (`match`.`berkeley_app`.`name` = 'adm');
CREATE OR REPLACE  VIEW vw_ber_enr AS
  SELECT
    `match`.`berkeley_app`.`apply_year` AS `apply_year`,
    `match`.`berkeley_app`.`school`     AS `school`,
    `match`.`berkeley_app`.`city`       AS `city`,
    `match`.`berkeley_app`.`county`       AS `county`,
    `match`.`berkeley_app`.`name`       AS `name`,
    `match`.`berkeley_app`.`val`        AS `val`
  FROM `match`.`berkeley_app`
  WHERE (`match`.`berkeley_app`.`name` = 'enr');

CREATE OR REPLACE VIEW vw_ber_app AS
  SELECT
    `match`.`berkeley_app`.`apply_year` AS `apply_year`,
    `match`.`berkeley_app`.`school`     AS `school`,
    `match`.`berkeley_app`.`city`       AS `city`,
    `match`.`berkeley_app`.`county`       AS `county`,
    `match`.`berkeley_app`.`name`       AS `name`,
    `match`.`berkeley_app`.`val`        AS `val`
  FROM `match`.`berkeley_app`
  WHERE (`match`.`berkeley_app`.`name` = 'enr');
