--creación de tablas. PUNTO 1.
\c postgres

DROP DATABASE IF EXISTS paises;
CREATE DATABASE paises;

\c paises

CREATE TABLE IF NOT EXISTS  pais(
        pais_id   INT not NULL,    
        nombre text,
        independencia TEXT,
        continente_id int,  
        forma_de_gobierno TEXT,
        poblacion int
        );

CREATE TABLE IF NOT EXISTS frontera(
        pais_id1    INT ,
        pais_id2    int,
        extension_km INT        
        );

CREATE TABLE continente(
        continente_id int not null,
        Nombre TEXT
        );

CREATE TABLE censo(
        pais_id INT,
        Anio    int,
        poblacion_censo FLOAT
        );
\c paises