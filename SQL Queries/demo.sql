SELECT * FROM landing.sample
------------------------------------------------------------------------------------
CALL landing.sample_dedup()
------------------------------------------------------------------------------------
SELECT * FROM landing.sample
------------------------------------------------------------------------------------
TRUNCATE stage.sample
------------------------------------------------------------------------------------
WITH  CTE AS
    (
    SELECT
    s.uuid,
    s.precomb,
    s.message,
    s.date
    FROM
    landing.sample as s
    )
insert into stage.sample(
    date,
    message,
    precomb,
    uuid
) select
      date,
      message,
      precomb,
      uuid
from
    cte


------------------------------------------------------------------------------------
SELECT * FROM stage.sample
-----------------------------------------------------------------------------------

