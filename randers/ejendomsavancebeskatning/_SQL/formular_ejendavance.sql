-- Table: selvbetjening.formular_ejendavance

-- DROP TABLE selvbetjening.formular_ejendavance;

CREATE TABLE selvbetjening.formular_ejendavance
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_ejendavance_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  firmanavn character varying,
  firmaadresse character varying,
  firmacvrnr character varying,
  id integer,
  kontaktperson character varying,
  samletareal integer,
  matrikelinfo character varying,
  straksafgoerelse character varying,
  login character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  journalnr character varying(100),
  landzone character varying(25),
  lokalplan character varying(25),
  kommuneplan character varying(25),
  tlf character varying,
  CONSTRAINT formular_ejendavance_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_ejendavance
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_ejendavance_geom_idx

-- DROP INDEX selvbetjening.formular_ejendavance_geom_idx;

CREATE INDEX formular_ejendavance_geom_idx
  ON selvbetjening.formular_ejendavance
  USING gist
  (wkb_geometry);

