-- variacion porcentual anual punto3.
\c paises
CREATE OR REPLACE FUNCTION get_pop_variation_rate(cod_pais INT)
returns FLOAT as $$
declare

        anio_ultimo_censo int;
        anio_anteultimo_censo int;
        ultimo_censo censo%ROWTYPE;
        anteultimo_censo censo%rowtype;
        dif_de_anios FLOAT ;
        coeficiente_de_crecimiento FLOAT;

begin
    SELECT INTO anio_ultimo_censo MAX(Anio) from censo c where (cod_pais=c.pais_id);
    anio_anteultimo_censo:= dar_segundo_mayor(cod_pais,anio_ultimo_censo); 
    SELECT * INTO ultimo_censo FROM censo c where c.Anio = anio_ultimo_censo;
    SELECT * INTO anteultimo_censo FROM censo c where c.Anio = anio_anteultimo_censo;
    dif_de_anios:= anio_ultimo_censo-anio_anteultimo_censo;
    --coeficiente_de_crecimiento:= (((ultimo_censo.poblacion*100)/anteultimo_censo.poblacion)-100)/dif_de_anios;

    coeficiente_de_crecimiento :=  power ((ultimo_censo.poblacion/anteultimo_censo.poblacion),1/dif_de_anios);


	return coeficiente_de_crecimiento;
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION dar_segundo_mayor(cod_pais INT,mayor int)
returns int as $$
declare        
        anio_anteultimo_censo int:=0;
        
        
          j censo%rowtype;
begin
    
for j in select * from censo   loop
		if j.pais_id=cod_pais and anio_anteultimo_censo<j.anio  and j.anio<>mayor  then 
        anio_anteultimo_censo:=j.anio;

        end if;
        
	end loop;

	return anio_anteultimo_censo;
end;
$$ language plpgsql;