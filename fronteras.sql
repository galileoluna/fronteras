--lista de pares de paises fronterizos ordenados de mayor a menor extension de frontera.
\c paises
SELECT pais_id1,pais_id2,extension_km FROM frontera ORDER BY extension_km DESC;