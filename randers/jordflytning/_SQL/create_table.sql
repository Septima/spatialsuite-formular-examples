-- Table: selvbetjening.formular_jordflytning

-- DROP TABLE selvbetjening.formular_jordflytning;

CREATE TABLE selvbetjening.formular_jordflytning
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_jordflytning_ogc_fid_seq'::regclass),
  wkb_geometry geometry,
  adresse character varying(100),
  fyldtjord character varying(10),
  intaktjord character varying(10),
  byggeaffald character varying(10),
  organisk_materiale character varying(10),
  boreslam character varying(10),
  andet character varying(10),
  andet_tekst character varying(254),
  akutflytning character varying(10),
  akutflytning_begrund character varying(254),
  kategori character varying(254),
  jordplan character varying(10),
  jordplan_fil character varying(254),
  kubikmeter integer,
  ton integer,
  formaal character varying(100),
  k_start character varying(25),
  k_slut character varying(25),
  anmeld_cvr integer,
  anmeld_navn character varying(100),
  anmeld_adr character varying(100),
  anmeld_tlf character varying(100),
  anmeld_email character varying(100),
  anmeld_kontakt character varying(100),
  anmeld_kontakttlf character varying(100),
  anmeld_og_trans_ens character varying(10),
  trans_navn character varying(100),
  trans_adr character varying(100),
  trans_tlf character varying(100),
  trans_email character varying(100),
  trans_kontakt character varying(100),
  trans_kontakttlf character varying(100),
  journalnr character varying(50),
  id integer,
  kon1_ejendom character varying(250),
  kon2_ejer character varying(250),
  kon3_omrklass character varying(250),
  kon4_anafri character varying(250),
  kon5_v1 character varying(250),
  kon6_v2 character varying(250),
  kon7_kortnr character varying(250),
  trans_cvr integer,
  formaal_andet character varying(255),
  ts_alteret timestamp without time zone DEFAULT now(),
  CONSTRAINT formular_jordflytning_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_jordflytning
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_jordflytning_geom_idx

-- DROP INDEX selvbetjening.formular_jordflytning_geom_idx;

CREATE INDEX formular_jordflytning_geom_idx
  ON selvbetjening.formular_jordflytning
  USING gist
  (wkb_geometry);

