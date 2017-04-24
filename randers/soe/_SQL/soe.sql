-- Table: soe

-- DROP TABLE soe;

CREATE TABLE soe
(
  ogc_fid serial NOT NULL,
  wkb_geometry geometry(Geometry,25832),
  fot_id integer,
  introduction_time character varying,
  discontinued_time character varying,
  oprindelse integer,
  soetype character varying,
  salt_soe character varying,
  temporaer character varying,
  sae_under_minimum character varying,
  oe_under_minimum character varying,
  id integer,
  CONSTRAINT soe_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE soe
  OWNER TO gistestedit;
GRANT ALL ON TABLE soe TO gistestedit;
GRANT SELECT ON TABLE soe TO grp_plan_view;

-- Index: soe_geom_idx

-- DROP INDEX soe_geom_idx;

CREATE INDEX soe_geom_idx
  ON soe
  USING gist
  (wkb_geometry);

