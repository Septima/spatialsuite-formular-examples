-- Table: selvbetjening.formular_drikkevandsanalyse

-- DROP TABLE selvbetjening.formular_drikkevandsanalyse;

CREATE TABLE selvbetjening.formular_drikkevandsanalyse
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_drikkevandsanalyse_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  analyseaarsag character varying,
  analysefil character varying,
  ikkealmentvv character varying,
  laboratorium character varying,
  laboratorium_andet character varying,
  kontrolniveau character varying,
  navn character varying,
  adresse character varying,
  email character varying,
  tlf integer,
  id integer,
  ref character varying,
  standardanalyse character varying,
  analysebehov character varying,
  levering_til_naboer character varying,
  antal_adresser integer,
  andre_adresseret character varying,
  andre_adresserto character varying,
  andre_adressertre character varying,
  andre_adresserfire character varying,
  andre_adresserfem character varying,
  andre_adresserseks character varying,
  andre_adressersyv character varying,
  andre_adresserotte character varying,
  andre_adresserni character varying,
  adresse_boring character varying,
  adresse_ejer character varying,
  mobilnummer character varying,
  traeffetid character varying,
  bemaerkning character varying,
  jupiterid character varying,
  dagsdato character varying,
  aar character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  CONSTRAINT formular_drikkevandsanalyse_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_drikkevandsanalyse
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_drikkevandsanalyse_geom_idx

-- DROP INDEX selvbetjening.formular_drikkevandsanalyse_geom_idx;

CREATE INDEX formular_drikkevandsanalyse_geom_idx
  ON selvbetjening.formular_drikkevandsanalyse
  USING gist
  (wkb_geometry);

