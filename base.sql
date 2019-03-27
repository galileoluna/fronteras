\c postgres

drop database if exists base;
create database base;

\c base

CREATE TABLE pais(
        pais_id   INT not NULL,    
        Nombre text,
        independencia TEXT,
        continente_id int,  
        Forma_de_gobierno TEXT,
        poblacion int
)
        ;

CREATE TABLE frontera(
        pais_id1    INT ,
        pais_id2    int,
        extension_km INT)        
;

CREATE TABLE continente(
        continente_id int not null,
        Nombre TEXT)
;
CREATE TABLE censo(
        pais_id INT,
        Anio    int,
        poblacion INT)
;
COPY pais (pais_id,   
        Nombre ,
        independencia ,
       continente_id , 
        Forma_de_gobierno ,
        poblacion) FROM '/home/lilo/BDD2/TP0/Datos_paises.csv' WITH (FORMAT csv);
COPY frontera (
        pais_id1    ,
        pais_id2    ,
        extension_km ) FROM '/home/lilo/BDD2/TP0/fronteras.csv' WITH (FORMAT csv);
COPY continente (continente_id ,
        Nombre ) FROM '/home/lilo/BDD2/TP0/continentes.csv' WITH (FORMAT csv);
COPY censo (
        pais_id ,
        Anio    ,
        poblacion )FROM '/home/lilo/BDD2/TP0/censos.csv' WITH (FORMAT csv);
alter table pais  add constraint pais_pk   primary key (pais_id);
alter table frontera  add constraint frontera_pk   primary key (pais_id1,pais_id2);
alter table continente  add constraint continente_pk   primary key (continente_id);
alter table censo  add constraint censo_pk   primary key (pais_id,Anio);
alter table pais add constraint paises_continente_fk foreign key (continente_id) references CONTINENTE(continente_id);



