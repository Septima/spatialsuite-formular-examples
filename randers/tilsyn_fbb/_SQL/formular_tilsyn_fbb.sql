-- Table: selvbetjening.formular_tilsyn_fbb

-- DROP TABLE selvbetjening.formular_tilsyn_fbb;

CREATE TABLE selvbetjening.formular_tilsyn_fbb
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_tilsyn_fbb_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  created timestamp without time zone DEFAULT now(),
  id character varying,
  journalnr character varying,
  adresse character varying,
  konflikttekst1 character varying,
  konflikttekst2 character varying,
  hovedplan character varying,
  sokkel character varying,
  ydermur character varying,
  tagkonstruktion character varying,
  gavlkonstruktion character varying,
  kvist character varying,
  gesims character varying,
  doer_port character varying,
  vindue character varying,
  bygningsdel character varying,
  udsmykning character varying,
  stilart character varying,
  oprindelig_fuktion character varying,
  nuvaerende_fuktion character varying,
  komplekstype character varying,
  indre_forhold character varying,
  ydre_forhold character varying,
  notatomindreogydreforhold character varying,
  omgivelser character varying,
  notatomomgivelser character varying,
  bebyggelsesmiljo character varying,
  notatombygningsmiljo character varying,
  arkitektoniskvaerdi character varying,
  arkitektonisk character varying,
  kulturhistoriskvaerdi character varying,
  kulturhistorisk character varying,
  miljomaessigvaerdi character varying,
  miljomaessig character varying,
  originalitetsvaerdi character varying,
  originalitets character varying,
  tilstandsvaerdi character varying,
  tilstand character varying,
  bevaringsmaessigvaerdi character varying,
  bevaringsmaessig character varying,
  foto1 character varying,
  foto1_tekst character varying,
  foto2 character varying,
  foto2_tekst character varying,
  foto3 character varying,
  foto3_tekst character varying,
  foto4 character varying,
  foto4_tekst character varying,
  foto5 character varying,
  foto5_tekst character varying,
  foto6 character varying,
  foto6_tekst character varying,
  betegnelse character varying,
  ejdnr bigint,
  bygnr integer,
  konflikttekst1_alt character varying,
  konflikttekst2_alt character varying,
  bygid character varying(100),
  kom_ejdnr character varying(50),
  ts_alteret timestamp without time zone DEFAULT now(),
  grundid character varying,
  CONSTRAINT formular_tilsyn_fbb_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_tilsyn_fbb
  OWNER TO gistestedit;

-- Index: selvbetjening.sidx_formular_tilsyn_fbb_wkb_geometry

-- DROP INDEX selvbetjening.sidx_formular_tilsyn_fbb_wkb_geometry;

CREATE INDEX sidx_formular_tilsyn_fbb_wkb_geometry
  ON selvbetjening.formular_tilsyn_fbb
  USING gist
  (wkb_geometry);

