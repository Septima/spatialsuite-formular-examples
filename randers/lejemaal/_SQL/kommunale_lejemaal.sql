-- Table: kommunale_lejemaal

-- DROP TABLE kommunale_lejemaal;

CREATE TABLE kommunale_lejemaal
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry(Geometry,25832),
  navn character varying,
  status character varying,
  lejemaalstype character varying,
  udlejetfra character varying,
  antalaar character varying,
  gyldigtil character varying,
  aftaletype character varying,
  opkoebsaarsag character varying,
  regulering character varying,
  beregningsmetode character varying,
  regulertidspkt character varying,
  sidstreguler character varying,
  nasestreguler character varying,
  husleje character varying,
  vand character varying,
  varme character varying,
  el character varying,
  renovation character varying,
  forsikring character varying,
  skatafgift character varying,
  aarligleje integer,
  maanedleje double precision,
  id integer,
  areal double precision,
  beroerteejendom character varying,
  ref character varying,
  CONSTRAINT kommunale_lejemaal_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE kommunale_lejemaal
  OWNER TO gistestedit;
GRANT ALL ON TABLE kommunale_lejemaal TO gistestedit;
GRANT SELECT ON TABLE kommunale_lejemaal TO grp_plan_view;

-- Index: kommunale_lejemaal_geom_idx

-- DROP INDEX kommunale_lejemaal_geom_idx;

CREATE INDEX kommunale_lejemaal_geom_idx
  ON kommunale_lejemaal
  USING gist
  (wkb_geometry);

