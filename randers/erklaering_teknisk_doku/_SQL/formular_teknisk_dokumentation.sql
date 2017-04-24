-- Table: selvbetjening.formular_teknisk_dokumentation

-- DROP TABLE selvbetjening.formular_teknisk_dokumentation;

CREATE TABLE selvbetjening.formular_teknisk_dokumentation
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_teknisk_dokumentation_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  a character varying(10),
  b character varying(10),
  c character varying(10),
  d character varying(10),
  e character varying(10),
  f character varying(10),
  g character varying(10),
  h character varying(10),
  i character varying(10),
  j character varying(10),
  k character varying(10),
  l character varying(10),
  m character varying(10),
  n character varying(10),
  o character varying(10),
  p character varying(10),
  q character varying(10),
  aa character varying(10),
  ab character varying,
  ba character varying(10),
  bb character varying,
  ca character varying(10),
  cb character varying,
  da character varying(10),
  db character varying,
  ea character varying(10),
  eb character varying,
  fa character varying(10),
  fb character varying,
  ga character varying(10),
  gb character varying,
  journalnr character varying(100),
  adresse character varying(200),
  navn character varying,
  tlf character varying,
  mobil character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  CONSTRAINT formular_teknisk_dokumentation_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_teknisk_dokumentation
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_teknisk_dokumentation_geom_idx

-- DROP INDEX selvbetjening.formular_teknisk_dokumentation_geom_idx;

CREATE INDEX formular_teknisk_dokumentation_geom_idx
  ON selvbetjening.formular_teknisk_dokumentation
  USING gist
  (wkb_geometry);

