-- punto 10.
\c paises
SELECT f1.pais_id1,f1.pais_id2,f2.pais_id1 FROM frontera f1 INNER JOIN frontera f2 ON (f2.pais_id1<>f1.pais_id1 AND f2.pais_id1<>f1.pais_id2)
AND (f2.pais_id1 = f1.pais_id1 OR f2.pais_id2 = f1.pais_id2);

CREATE INDEX indice_frontera ON frontera f1 (f1.pais_id1,f1.pais_id2);
