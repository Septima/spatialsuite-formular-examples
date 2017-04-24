-- Table: selvbetjening.formular_arrangement150

-- DROP TABLE selvbetjening.formular_arrangement150;

CREATE TABLE selvbetjening.formular_arrangement150
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_arrangement150_ogc_fid_seq'::regclass),
  wkb_geometry geometry,
  address character varying(100),
  startdato character varying(50),
  slutdato character varying(50),
  start_tid character varying(50),
  slut_tid character varying(50),
  antalpersoner character varying(50),
  art character varying(50),
  sted character varying(50),
  navn character varying(50),
  email character varying(50),
  tlf character varying(50),
  id integer,
  filnavn character varying(200),
  antal_dage integer,
  filnavn2 character varying(200),
  formular character varying(100),
  ref character varying(100),
  adresseansvarlig character varying(200),
  konflikttekst1 character varying(200),
  konflikttekst2 character varying(200),
  artvalg character varying(200),
  stedvalg character varying(200),
  journalnr character varying(100),
  ts_alteret timestamp without time zone DEFAULT now(),
  kommune character varying,
  CONSTRAINT formular_arrangement150_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_arrangement150
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_arrangement150_geom_idx

-- DROP INDEX selvbetjening.formular_arrangement150_geom_idx;

CREATE INDEX formular_arrangement150_geom_idx
  ON selvbetjening.formular_arrangement150
  USING gist
  (wkb_geometry);

