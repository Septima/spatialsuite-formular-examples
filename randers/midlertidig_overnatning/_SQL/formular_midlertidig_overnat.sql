-- Table: selvbetjening.formular_midlertidig_overnat

-- DROP TABLE selvbetjening.formular_midlertidig_overnat;

CREATE TABLE selvbetjening.formular_midlertidig_overnat
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_midlertidig_overnat_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  address character varying,
  stedetsnavn character varying,
  date1 character varying,
  date2 character varying,
  antal_dage character varying,
  startkl character varying,
  slutkl character varying,
  lokale character varying,
  antalvoksne character varying,
  antalboern character varying,
  bilag character varying,
  ansvarlig character varying,
  ansvarligmobilnr character varying,
  email character varying,
  accepterer character varying,
  areal character varying,
  ref character varying,
  formular character varying,
  id integer,
  formularnavn character varying,
  overnatningslokalet character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  kommune character varying,
  CONSTRAINT formular_midlertidig_overnat_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_midlertidig_overnat
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_midlertidig_overnat_geom_idx

-- DROP INDEX selvbetjening.formular_midlertidig_overnat_geom_idx;

CREATE INDEX formular_midlertidig_overnat_geom_idx
  ON selvbetjening.formular_midlertidig_overnat
  USING gist
  (wkb_geometry);

