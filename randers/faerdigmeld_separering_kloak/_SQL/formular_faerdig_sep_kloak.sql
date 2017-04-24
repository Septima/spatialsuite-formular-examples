-- Table: selvbetjening.formular_faerdig_sep_kloak

-- DROP TABLE selvbetjening.formular_faerdig_sep_kloak;

CREATE TABLE selvbetjening.formular_faerdig_sep_kloak
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_faerdig_sep_kloak_ogc_fid_seq'::regclass),
  wkb_geometry geometry,
  bygherre character varying(100),
  vvs_mester character varying(200),
  email character varying(200),
  kommentar character varying(4000),
  adresse character varying(200),
  dato character varying(15),
  vaskeplads character varying(30),
  vaskeplads_str character varying(5),
  konflikttekst character varying(4000),
  olieudskiller character varying(10),
  id integer,
  tagfladevand character varying(100),
  bbrkode integer,
  ref character varying(50),
  skitse character varying(500),
  ts_alteret timestamp without time zone DEFAULT now(),
  bbrtekst character varying,
  erhvervsareal integer,
  moedding character varying,
  CONSTRAINT formular_faerdig_sep_kloak_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_faerdig_sep_kloak
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_faerdig_sep_kloak_geom_idx

-- DROP INDEX selvbetjening.formular_faerdig_sep_kloak_geom_idx;

CREATE INDEX formular_faerdig_sep_kloak_geom_idx
  ON selvbetjening.formular_faerdig_sep_kloak
  USING gist
  (wkb_geometry);

