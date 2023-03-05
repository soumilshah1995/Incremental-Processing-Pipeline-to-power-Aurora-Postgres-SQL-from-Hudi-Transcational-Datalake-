INSERT INTO stage.sample(
    date,
    message,
    precomb,
    uuid
)
select
    l.date,
    l.message,
    l.precomb,
    l.uuid
FROM
    landing.sample as l
LEFT JOIN
    stage.sample as s ON s.uuid = l.uuid
ON CONFLICT (uuid) DO UPDATE SET date=EXCLUDED.date, message=EXCLUDED.message, precomb=EXCLUDED.precomb;