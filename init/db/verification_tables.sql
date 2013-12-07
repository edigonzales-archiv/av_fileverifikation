--DROP TABLE av_fileverifikation.t_gebaeudeadressen_spinnennetz;
CREATE TABLE av_fileverifikation.t_gebaeudeadressen_spinnennetz
(
 ogc_fid serial NOT NULL,
 tid character varying,
 line geometry(LINESTRING,21781),
 hausnummer character varying,
 gem_bfs integer,
 CONSTRAINT t_gebaeudeadressen_spinnennetz_pkey PRIMARY KEY (ogc_fid)
) 
WITH (OIDS=FALSE); 

ALTER TABLE av_fileverifikation.t_gebaeudeadressen_spinnennetz OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.t_gebaeudeadressen_spinnennetz TO mspublic;


--DROP TABLE av_fileverifikation.t_shortestline_hausnummerpos;
CREATE TABLE av_fileverifikation.t_shortestline_hausnummerpos
(
 ogc_fid serial NOT NULL,
 strname character varying,
 hausnummer character varying,
 a_tid character varying,
 b_tid character varying,
 lok_tid character varying,
 the_geom geometry(LINESTRING,21781),
 gem_bfs integer,
 CONSTRAINT t_shortestline_hausnummerpos_pkey PRIMARY KEY (ogc_fid)
) 
WITH (OIDS=FALSE); 
ALTER TABLE av_fileverifikation.t_shortestline_hausnummerpos OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.t_shortestline_hausnummerpos TO mspublic;


--DROP TABLE av_fileverifikation.t_falscher_anfangspunkt;
CREATE TABLE av_fileverifikation.t_falscher_anfangspunkt
(
  ogc_fid serial NOT NULL,
  the_geom geometry(POINT,21781),
  gem_bfs integer,
  CONSTRAINT t_falscher_anfangspunkt_pkey PRIMARY KEY (ogc_fid)
) 
WITH (OIDS=FALSE); 

ALTER TABLE av_fileverifikation.t_falscher_anfangspunkt OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.t_falscher_anfangspunkt TO mspublic;


--DROP TABLE av_fileverifikation.t_doppelte_achsen;
CREATE TABLE av_fileverifikation.t_doppelte_achsen
(
  ogc_fid serial NOT NULL,
  the_geom geometry(LINESTRING,21781),
  gem_bfs integer,
  CONSTRAINT t_doppelte_achsen_pkey PRIMARY KEY (ogc_fid)
) 
WITH (OIDS=FALSE); 

ALTER TABLE av_fileverifikation.t_doppelte_achsen OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.t_doppelte_achsen TO mspublic;


--DROP TABLE av_fileverifikation.t_doppelte_eo_linien;
CREATE TABLE av_fileverifikation.t_doppelte_eo_linien
(
  ogc_fid serial NOT NULL,
  the_geom geometry(LINESTRING,21781),
  gem_bfs integer,
  CONSTRAINT t_doppelte_eo_linien_pkey PRIMARY KEY (ogc_fid)
) 
WITH (OIDS=FALSE); 

ALTER TABLE av_fileverifikation.t_doppelte_eo_linien OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.t_doppelte_eo_linien TO mspublic;
