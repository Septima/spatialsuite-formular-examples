-- Table: selvbetjening.formular_etabler_nedsivningsanlaeg

-- DROP TABLE selvbetjening.formular_etabler_nedsivningsanlaeg;

CREATE TABLE selvbetjening.formular_etabler_nedsivningsanlaeg
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_etabler_nedsivningsanlaeg_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  soegtadr character varying(200),
  soegtmatr character varying(1000),
  soegtejer character varying(250),
  ejd_adresse character varying(150),
  ejers_navn character varying(100),
  ejers_adresse character varying(100),
  ejers_email character varying(100),
  ejers_tlf integer,
  benyttelse character varying(50),
  eks_forh_vandforsyning character varying(50),
  eks_forh_vandvaerk character varying(50),
  eks_forh_bundfaeldning character varying(50),
  eks_forh_husspildevand character varying(50),
  eks_forh_bortskaffelse character varying(50),
  eks_forh_bortskaf_beskrivelse character varying(500),
  frem_forh_placering character varying(50),
  frem_forh_accpet character varying(500),
  frem_forh_tryksat character varying(50),
  frem_forh_overterraen character varying(50),
  frem_forh_flerehusstande character varying(50),
  frem_forh_antalhusstande character varying(50),
  frem_forh_spildvandstype character varying(50),
  frem_forh_groeftareal character varying(50),
  frem_forh_sivelaengde integer,
  frem_forh_siveareal integer,
  frem_forh_eksisterendebundtanke character varying(50),
  frem_forh_nytank_kamre integer,
  frem_forh_nytank_vol numeric(20,10),
  frem_forh_nytank_type character varying(250),
  frem_forh_belastning character varying(250),
  afstand_naermestebygning character varying(50),
  afstand_naermesteskel character varying(50),
  afstand_naermesteboring character varying(50),
  afstand_vandvaerkmindre character varying(50),
  afstand_vandvaerkmindrenavn character varying(100),
  afstand_vandvaerkmere character varying(50),
  afstand_vandvaerkmerenavn character varying(100),
  afstand_proj_kyst character varying(100),
  afstand_proj_kyst_meter integer,
  afstand_proj_soe character varying(50),
  afstand_proj_soe_meter integer,
  afstand_proj_vandloeb character varying(50),
  afstand_proj_vandloeb_meter integer,
  afstand_proj_groeft character varying(50),
  afstand_proj_groeft_meter integer,
  afstand_proj_draenled character varying(50),
  afstand_proj_draenled_meter integer,
  afstand_proj_stejle character varying(50),
  afstand_proj_stejle_meter integer,
  proj_gravhoeje character varying(50),
  afstand_proj_gravhoej_meter integer,
  journalnr character varying(50),
  ref character varying(100),
  dagsdato character varying(25),
  login character varying(20),
  afstand_naermesteandenboring character varying(100),
  frem_forh_afstand_sivdraen_gvs numeric(10,1),
  frem_forh_afstand_sivdraen_ter numeric(10,1),
  frem_forh_mile numeric(10,1),
  frem_forh_nytank_type_txt character varying(100),
  km_navn character varying(100),
  km_adresse character varying(100),
  km_mail character varying(100),
  km_cvr character varying(15),
  eks_forh_antalpe character varying(50),
  eks_forh_spabad character varying(10),
  eks_forh_saerlige_forhold character varying(2000),
  frem_forh_sigteanalyse character varying(500),
  afstand_proj_fortidsminder character varying(50),
  afstand_proj_andre_nedsivningsanlaeg character varying(50),
  kloakplan character varying(250),
  afstand_markvandingsboringer character varying(25),
  frem_forh_pejling_dato character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  frem_forh_belastning_detalje character varying(300),
  frem_forh_tro_og_love character varying(10),
  andre_dok character varying(250),
  CONSTRAINT formular_etabler_nedsivningsanlaeg_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_etabler_nedsivningsanlaeg
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_etabler_nedsivningsanlaeg_geom_idx

-- DROP INDEX selvbetjening.formular_etabler_nedsivningsanlaeg_geom_idx;

CREATE INDEX formular_etabler_nedsivningsanlaeg_geom_idx
  ON selvbetjening.formular_etabler_nedsivningsanlaeg
  USING gist
  (wkb_geometry);

