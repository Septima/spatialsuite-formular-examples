-- Table: selvbetjening.formular_jordvarmeanlaeg

-- DROP TABLE selvbetjening.formular_jordvarmeanlaeg;

CREATE TABLE selvbetjening.formular_jordvarmeanlaeg
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_jordvarmeanlaeg_ogc_fid_seq'::regclass),
  wkb_geometry geometry,
  address character varying(100),
  areal character varying(50),
  foedeledningnorm character varying(50),
  foedeledningens_dimension character varying(50),
  foedeledningens_laengde character varying(50),
  varmeslangensnorm character varying(50),
  varmeslangens_dimension character varying(50),
  varmeslangens_laengde character varying(50),
  antal_sloejfer character varying(50),
  laengde_sloejfer character varying(50),
  nedgravningsdybde character varying(50),
  inspektionsgang character varying(50),
  frostmiddel character varying(50),
  varmepumpe character varying(200),
  trykovervaagning character varying(50),
  alarm character varying(50),
  sikkerhedsanordning character varying(50),
  vandforsyning character varying(50),
  broend_boring character varying(50),
  navn character varying(50),
  email character varying(50),
  tlf character varying(50),
  id integer,
  filnavn character varying(200),
  formular character varying(100),
  ref character varying(100),
  frostmiddel_maengde integer,
  installatoer_navn character varying(50),
  journalnummer character varying(100),
  ts_alteret timestamp without time zone DEFAULT now(),
  CONSTRAINT formular_jordvarmeanlaeg_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_jordvarmeanlaeg
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_jordvarmeanlaeg_geom_idx

-- DROP INDEX selvbetjening.formular_jordvarmeanlaeg_geom_idx;

CREATE INDEX formular_jordvarmeanlaeg_geom_idx
  ON selvbetjening.formular_jordvarmeanlaeg
  USING gist
  (wkb_geometry);

