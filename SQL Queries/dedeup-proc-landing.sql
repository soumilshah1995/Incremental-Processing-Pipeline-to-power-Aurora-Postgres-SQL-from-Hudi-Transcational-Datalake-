-- PROCEDURE: landing.sample_dedup()

-- DROP PROCEDURE IF EXISTS landing.sample_dedup();

CREATE OR REPLACE PROCEDURE landing.sample_dedup()

LANGUAGE 'plpgsql'
AS $BODY$

begin
DELETE  FROM landing.sample where op = 'r';
WITH CTE AS
         (
             SELECT
                 sample_key,
                 row_number() over(partition by op,uuid order by ts_ms desc, uuid desc) as rn
             FROM
                 landing.sample
         )
DELETE FROM
    landing.sample as landing
    using
    cte
WHERE
    landing.sample_key = CTE.sample_key and
    cte.rn > 1;
DELETE  FROM
    landing.sample as landing
    using
    (select uuid from landing.sample where op='u') as update
                                                              where
                                                              landing.uuid = update.uuid and
                                                                                 landing.op='i';

end
$BODY$;
