﻿-- Table: selvbetjening.formular_miljoetilsyn

-- DROP TABLE selvbetjening.formular_miljoetilsyn;

CREATE TABLE selvbetjening.formular_miljoetilsyn
(
  ogc_fid integer NOT NULL DEFAULT nextval('formular_miljoetilsyn_ogc_fid_seq'::regclass),
  wkb_geometry geometry,
  formular character varying(50),
  ref character varying(50),
  dato timestamp with time zone,
  sbsys_brugerid character varying(15),
  sagsbehandler_mail character varying(50),
  sagsbehandler_tlf integer,
  frid character varying(50),
  journalnr character varying(50),
  address character varying(100),
  konflikttekst1 character varying(500),
  konflikttekst2 character varying(500),
  dato_tilsyn character varying(15),
  tilsyn_udfoert_af character varying(50),
  virksomhed_deltager character varying(100),
  virksomhed_mail character varying(50),
  virksomhedstype character varying(50),
  mekanisk_reparation character varying(10),
  pladearbejde character varying(10),
  serviceeftersyn character varying(10),
  klargoering character varying(10),
  koeb_salg_biler character varying(10),
  lakering character varying(10),
  undervognsbehandling character varying(10),
  montage character varying(10),
  valsning character varying(10),
  bukning character varying(10),
  tig_svejsening character varying(10),
  mig_mag_svejsning character varying(10),
  opskaering character varying(10),
  spaandtagning character varying(10),
  bemaerkning_andre_virksomheder character varying(2000),
  opstartsdato character varying(50),
  udvidelse_aendringer character varying(2000),
  produktionsareal integer,
  bemaerkning_produktionsareal character varying(2000),
  antal_ansatte integer,
  driftstid character varying(2000),
  stoej_viberationer character varying(5),
  stoej_viberationer_tekst1 character varying(10),
  stoej_viberationer_tekst2 character varying(10),
  stoej_viberationer_tekst3 character varying(10),
  stoej_viberationer_bemaerkning character varying(2000),
  stoej_viberationer_foto character varying(100),
  luftemission character varying(5),
  luftemission_tekst1 character varying(10),
  luftemission_bemaerkning character varying(2000),
  luftemission_foto character varying(100),
  spildevand character varying(5),
  spildevand_tekst1 character varying(10),
  spildevand_tekst2 character varying(10),
  spildevand_bemaerkning character varying(2000),
  spildevand_foto character varying(100),
  raavarer_oplag character varying(5),
  tanke character varying(5),
  tanke_bemaerkning character varying(2000),
  tanke_foto character varying(100),
  affald character varying(5),
  affald_batterier character varying(10),
  affald_savsmuld character varying(10),
  affald_spildolie character varying(10),
  affald_blyakkumulatorer character varying(10),
  affald_koelervaeske character varying(10),
  affald_bremsevaeske character varying(10),
  affald_oliefiltre character varying(10),
  affald_bremsevaskevand character varying(10),
  affald_tomme_spraydaaser character varying(10),
  affald_lysstofroer character varying(10),
  affald_braendbart character varying(10),
  affald_dagrenovation character varying(10),
  affald_papir_pap character varying(10),
  affald_metal character varying(10),
  affald_daek character varying(10),
  affald_isolering character varying(10),
  affald_beton character varying(10),
  affald_tekst1 character varying(10),
  affald_tekst2 character varying(10),
  affald_bemaerkning character varying(2000),
  affald_foto character varying(100),
  andre_miljoeforhold character varying(5),
  opvarmningsmiddel character varying(20),
  reguleringsgrundlag_tekst1 character varying(10),
  reguleringsgrundlag_tekst2 character varying(10),
  reguleringsgrundlag_tekst3 character varying(10),
  reguleringsgrundlag_tekst4 character varying(10),
  reguleringsgrundlag_tekst5 character varying(10),
  reguleringsgrundlag_tekst6 character varying(10),
  reguleringsgrundlag_tekst7 character varying(10),
  reguleringsgrundlag_tekst8 character varying(10),
  miljoemaessige_bemaerkninger character varying(10),
  miljoemaessige_bem_tekst character varying(2000),
  haandhaevelser character varying(10),
  haandhaevelser_tekst character varying(2000),
  id integer,
  raavarer_oplag_bemaerkning character varying(2000),
  raavarer_oplag_foto character varying(100),
  andre_miljoeforhold_bem character varying(2000),
  andre_miljoeforhold_foto character varying(100),
  reguleringsgrundlag_tekst9 character varying(10),
  reguleringsgrundlag_tekst10 character varying(10),
  produktionsforhold character varying(2000),
  affald_tekst3 character varying(10),
  affald_tekst4 character varying(10),
  farligt_affald_tekst1 character varying(10),
  farligt_affald_tekst2 character varying(10),
  farligt_affald_tekst3 character varying(10),
  farligt_affald_tekst character varying(10),
  farligt_affald_bemaerkning character varying(2000),
  farligt_affald_foto character varying(100),
  dato_miljoegodkendelse character varying(100),
  dato_spildevandstilladelse character varying(100),
  jordforurening_bemaerkninger character varying(10),
  jordforurening_bem_tekst character varying(2000),
  oevrige_bemaerkninger character varying(2000),
  farligt_affald_tekst4 character varying(10),
  cvr_nummer integer,
  p_nummer integer,
  virksomhed character varying(300),
  virksomhed_adresse character varying(100),
  virksomhed_postnr_by character varying(50),
  virksomhed_tlf character varying(100),
  tank1_aarstal integer,
  tank2_aarstal integer,
  tank3_aarstal integer,
  tank4_aarstal integer,
  tank5_aarstal integer,
  tank1_placering character varying(250),
  tank2_placering character varying(250),
  tank3_placering character varying(250),
  tank4_placering character varying(250),
  tank5_placering character varying(250),
  tank1_indhold character varying(100),
  tank2_indhold character varying(100),
  tank3_indhold character varying(100),
  tank4_indhold character varying(100),
  tank5_indhold character varying(100),
  tank1_stoerrelse integer,
  tank2_stoerrelse integer,
  tank3_stoerrelse integer,
  tank4_stoerrelse integer,
  tank5_stoerrelse integer,
  tank1_fabrikationsnr character varying(100),
  tank2_fabrikationsnr character varying(100),
  tank3_fabrikationsnr character varying(100),
  tank4_fabrikationsnr character varying(100),
  tank5_fabrikationsnr character varying(100),
  luftafkast1_proces character varying(100),
  luftafkast2_proces character varying(100),
  luftafkast3_proces character varying(100),
  luftafkast4_proces character varying(100),
  luftafkast5_proces character varying(100),
  luftafkast6_proces character varying(100),
  luftafkast7_proces character varying(100),
  luftafkast8_proces character varying(100),
  luftafkast9_proces character varying(100),
  luftafkast10_proces character varying(100),
  luftafkast1_rensning character varying(100),
  luftafkast2_rensning character varying(100),
  luftafkast3_rensning character varying(100),
  luftafkast4_rensning character varying(100),
  luftafkast5_rensning character varying(100),
  luftafkast6_rensning character varying(100),
  luftafkast7_rensning character varying(100),
  luftafkast8_rensning character varying(100),
  luftafkast9_rensning character varying(100),
  luftafkast10_rensning character varying(100),
  luftafkast1_hoejde character varying(100),
  luftafkast2_hoejde character varying(100),
  luftafkast3_hoejde character varying(100),
  luftafkast4_hoejde character varying(100),
  luftafkast5_hoejde character varying(100),
  luftafkast6_hoejde character varying(100),
  luftafkast7_hoejde character varying(100),
  luftafkast8_hoejde character varying(100),
  luftafkast9_hoejde character varying(100),
  luftafkast10_hoejde character varying(100),
  spildevand_tekst3 character varying(10),
  raavarer_oplag_tekst1 character varying(10),
  ts_alteret timestamp without time zone DEFAULT now(),
  opvarmningsmiddel_andet character varying(2000),
  CONSTRAINT formular_miljoetilsyn_pkey PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE selvbetjening.formular_miljoetilsyn
  OWNER TO gistestedit;

-- Index: selvbetjening.formular_miljoetilsyn_geom_idx

-- DROP INDEX selvbetjening.formular_miljoetilsyn_geom_idx;

CREATE INDEX formular_miljoetilsyn_geom_idx
  ON selvbetjening.formular_miljoetilsyn
  USING gist
  (wkb_geometry);

