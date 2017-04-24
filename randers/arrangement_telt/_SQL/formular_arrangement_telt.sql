-- Table: selvbetjening.formular_arrangement_telt

-- DROP TABLE selvbetjening.formular_arrangement_telt;

CREATE TABLE selvbetjening.formular_arrangement_telt
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_arrangement_telt_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  address character varying,
  startdato character varying,
  slutdato character varying,
  start_tid character varying,
  slut_tid character varying,
  antalpersoner character varying,
  art character varying,
  navn character varying,
  email character varying,
  tlf character varying,
  id integer,
  filnavn character varying,
  antal_dage integer,
  filnavn2 character varying,
  formular character varying,
  ref character varying,
  adresse2 character varying,
  sortdato integer,
  journalnr character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  kommune character varying,
  CONSTRAINT formular_arrangement_telt_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_arrangement_telt
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_arrangement_telt_geom_idx

-- DROP INDEX selvbetjening.formular_arrangement_telt_geom_idx;

CREATE INDEX formular_arrangement_telt_geom_idx
  ON selvbetjening.formular_arrangement_telt
  USING gist
  (wkb_geometry);

