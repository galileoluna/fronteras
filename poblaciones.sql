-- vista que devuelva poblacion del ultimo censo de un pais
\c paises
CREATE VIEW ultimoCensoYActual AS SELECT p.nombre,p.poblacion,c.poblacion_censo FROM pais p,censo c where p.pais_id = c.pais_id AND c.Anio = (SELECT MAX(Anio) from censo c where (p.pais_id=c.pais_id)); 