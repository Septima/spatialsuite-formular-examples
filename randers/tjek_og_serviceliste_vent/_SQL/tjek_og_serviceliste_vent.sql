-- Table: selvbetjening.tjek_og_serviceliste_vent

-- DROP TABLE selvbetjening.tjek_og_serviceliste_vent;

CREATE TABLE selvbetjening.tjek_og_serviceliste_vent
(
  ogc_fid integer NOT NULL DEFAULT nextval('tjek_og_serviceliste_vent_ogc_fid_seq'::regclass),
  wkb_geometry geometry(Geometry,25832),
  anlaeg character varying,
  service_afsluttet character varying,
  udskiftning_filtre character varying,
  udskiftning_remme character varying,
  udskiftning_andet character varying,
  passer_serviceinterval character varying,
  tjek_serviceliste character varying,
  dato timestamp with time zone,
  ref character varying,
  formular character varying,
  id integer,
  foreslag_serviceinterval character varying,
  energieftersyn_lve character varying,
  service_dato character varying,
  ts_alteret timestamp without time zone DEFAULT now(),
  CONSTRAINT tjek_og_serviceliste_vent_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.tjek_og_serviceliste_vent
  OWNER TO gistestedit;

-- Index: selvbetjening.tjek_og_serviceliste_vent_geom_idx

-- DROP INDEX selvbetjening.tjek_og_serviceliste_vent_geom_idx;

CREATE INDEX tjek_og_serviceliste_vent_geom_idx
  ON selvbetjening.tjek_og_serviceliste_vent
  USING gist
  (wkb_geometry);

