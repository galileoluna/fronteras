-- agregar las primary keys, y foreign keys
\c paises

ALTER TABLE pais  add CONSTRAINT pais_pk   PRIMARY KEY (pais_id);
ALTER TABLE frontera  add CONSTRAINT frontera_pk   PRIMARY KEY (pais_id1,pais_id2);
ALTER TABLE continente  add CONSTRAINT continente_pk   PRIMARY KEY (continente_id);
ALTER TABLE censo  add CONSTRAINT censo_pk   PRIMARY KEY (pais_id,Anio);
ALTER TABLE censo add CONSTRAINT censo_pais_fk FOREIGN KEY (pais_id) REFERENCES pais(pais_id);

