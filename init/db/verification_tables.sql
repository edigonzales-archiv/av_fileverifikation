DROP TABLE av_fileverifikation.t_gebaeudeadressen_spinnennetz;
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
