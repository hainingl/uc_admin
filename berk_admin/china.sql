DROP TABLE china;
CREATE TABLE china AS
  SELECT a.apply_year year,
         a.school school,
         a.val apply,
         m.val admit,
         e.val enroll,
         100* m.val/a.val  as r_admit
#          100* e.val /m.val as r_enrol
  FROM vw_ber_app a
    LEFT JOIN vw_ber_adm m
      on a.apply_year=m.apply_year AND a.school=m.school AND a.city=m.city
    LEFT JOIN  vw_ber_enr e
      ON a.apply_year=e.apply_year AND a.school=e.school AND a.city=e.city
    WHERE a.county LIKE 'CHI%'
  GROUP BY 1,2,3,4,5,6;

