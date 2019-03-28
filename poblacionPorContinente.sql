--Devuelve la poblacion total de cada continente
\c paises
CREATE OR REPLACE FUNCTION get_pop_by_continent(continente INT) 
returns int as $$
declare

        total int:=0;
        i pais%rowtype;
begin
	for i in select * from pais   loop
		if i.continente_id=continente then 
        total:=total+i.poblacion;
        end if;
        
	end loop;
	return total;
end;
$$ language plpgsql;