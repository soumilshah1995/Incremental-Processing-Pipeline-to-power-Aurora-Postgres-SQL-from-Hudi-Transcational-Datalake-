CREATE SCHEMA landing;
CREATE SCHEMA stage;

CREATE TABLE IF NOT EXISTS landing.sample
(
    sample_key bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    op character varying(256),
    ts_ms character varying(256),
    date character varying(256),
    message character varying(256),
    precomb character varying(256),
    uuid character varying(256),
    CONSTRAINT sample_key PRIMARY KEY (sample_key)
    )

CREATE TABLE IF NOT EXISTS stage.sample
(
    uuid character varying(256),
    date character varying(256),
    message character varying(256),
    precomb character varying(256)
)