DROP VIEW av_fileverifikation.v_gebaeudeadressen_lokalisationsnamepos CASCADE;
CREATE OR REPLACE VIEW av_fileverifikation.v_gebaeudeadressen_lokalisationsnamepos AS 
 SELECT b.ogc_fid, b.tid, b.lokalisationsnamepos_von, b.anfindex, b.endindex, 
        b.pos, b.ori, b.hali, b.hali_txt, b.vali, b.vali_txt, b.groesse, b.groesse_txt, 
        b.hilfslinie, ST_X(b.pos) AS y, ST_Y(b.pos) AS x, 
        (100::double precision - b.ori) * 0.9::double precision AS rot, a.benannte, a.text, b.gem_bfs
FROM av_avdpool_ng.gebaeudeadressen_lokalisationsname a, av_avdpool_ng.gebaeudeadressen_lokalisationsnamepos b
WHERE a.gem_bfs = b.gem_bfs 
AND a.tid::text = b.lokalisationsnamepos_von::text;

ALTER TABLE av_fileverifikation.v_gebaeudeadressen_lokalisationsnamepos OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.v_gebaeudeadressen_lokalisationsnamepos TO mspublic;

DROP VIEW av_fileverifikation.v_distanz_gebaeudeeingang_lokalisationsnamepos CASCADE;
CREATE OR REPLACE VIEW av_fileverifikation.v_distanz_gebaeudeeingang_lokalisationsnamepos AS 
SELECT a.tid AS atid, b.tid AS btid, min(ST_Length(ST_GeometryFromText(((((((('LINESTRING('::text || ST_X(a.lage)::text) || ' '::text) || ST_Y(a.lage)::text) || ','::text) || ST_X(b.pos)::text) || ' '::text) || ST_Y(b.pos)::text) || ')'::text, 21781))) AS min, b.gem_bfs
FROM av_avdpool_ng.gebaeudeadressen_gebaeudeeingang a, av_fileverifikation.v_gebaeudeadressen_lokalisationsnamepos b
WHERE a.gebaeudeeingang_von::text = b.benannte::text 
AND a.gem_bfs = b.gem_bfs
GROUP BY a.tid, b.tid, b.gem_bfs
ORDER BY a.tid, min(ST_Length(ST_GeometryFromText(((((((('LINESTRING('::text || ST_X(a.lage)::text) || ' '::text) || ST_Y(a.lage)::text) || ','::text) || ST_X(b.pos)::text) || ' '::text) || ST_Y(b.pos)::text) || ')'::text, 21781)));

ALTER TABLE av_fileverifikation.v_distanz_gebaeudeeingang_lokalisationsnamepos OWNER TO stefan;
GRANT SELECT ON TABLE av_fileverifikation.v_distanz_gebaeudeeingang_lokalisationsnamepos TO mspublic;
