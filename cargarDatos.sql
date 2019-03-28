--carga de datos de los archivos excel. punto2.
\c paises

DELETE FROM pais;
DELETE FROM frontera;
DELETE FROM continente;
DELETE FROM censo;

COPY pais (pais_id,   
        Nombre ,
        independencia ,
       continente_id , 
        Forma_de_gobierno ,
        poblacion) FROM '/home/julonuel/Documentos/UNGS/baseDeDatos2/bdd2-tp0/Datos_paises.csv' WITH (FORMAT csv);

COPY frontera (
        pais_id1    ,
        pais_id2    ,
        extension_km ) FROM '/home/julonuel/Documentos/UNGS/baseDeDatos2/bdd2-tp0/fronteras.csv' WITH (FORMAT csv);

COPY continente (continente_id ,
        Nombre ) FROM '/home/julonuel/Documentos/UNGS/baseDeDatos2/bdd2-tp0/continentes.csv' WITH (FORMAT csv);

COPY censo (
        pais_id ,
        Anio    ,
        poblacion_censo )FROM '/home/julonuel/Documentos/UNGS/baseDeDatos2/bdd2-tp0/censos.csv' WITH (FORMAT csv);