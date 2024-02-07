SELECT persona.nombre, persona.tlfno
FROM persona
JOIN vivienda ON persona.dni = vivienda.dni_propietario
JOIN municipio ON vivienda.codigo_municipio = municipio.codigo
WHERE municipio.nombre = 'Oviedo';


SELECT persona.nombre, persona.tlfno
FROM persona
JOIN vivienda ON persona.dni = vivienda.dni_propietario
JOIN municipio ON vivienda.codigo_municipio = municipio.codigo
WHERE municipio.nombre = 'Gijon';


SELECT DIRECCION, m2 from vivienda
join municipio on vivienda.codigo = municipio.codigo 
where municipio.nombre = 'Piloña'


select persona.nombre, persona.tlfno from persona
join vivienda on persona.dni = vivienda.dni_propietario
join municipio on vivienda.codigo_municipio = municipio.codigo
where  municipio.nombre = 'Piloña';


select vivienda.DIRECCION, municipio.provincia as provincia, persona.nombre as propietario 
from vivienda
join persona on vivienda.dni_propietario = persona.dni
join municipio on vivienda.codigo_municipio = municipio.codigo
where municipio.nombre = 'Llanes' 


select persona.nombre, vivienda.DIRECCION as DIRECCION, persona.tlfno
from persona 
join vivienda on persona.dni = vivienda.dni_propietario
where codigo_municipio =2; 


select vivienda.DIRECCION, persona.nombre, persona.tlfno
from vivienda 
join persona on vivienda.dni_propietario = persona.dni
where vivienda.m2 >150;


select municipio.nombre from municipio
join vivienda on municipio.codigo = vivienda.codigo_municipio
group by municipio.nombre
having avg(m2)>70


select municipio.nombre, count(*) as numViviendas from municipio
join vivienda on municipio.codigo = vivienda.codigo_municipio
where vivienda.m2 > 300


select count(*) as numcabezasfamilia from persona 
join vivienda on persona.dni = vivienda.dni_propietario
join municipio on vivienda.codigo_municipio = municipio.codigo 
where municipio.nombre = 'Oviedo'


select municipio.provincia, count(*) from municipio


select municipio.nombre ,avg(vivienda.m2) as media_m2 from vivienda
join municipio on vivienda.codigo_municipio = municipio.codigo
group by municipio.nombre;




select persona.nombre, persona.tlfno, vivienda.DIRECCION from persona
join vivienda on persona.dni = vivienda.dni_propietario
join municipio on vivienda.codigo_municipio = municipio.codigo
WHERE municipio.provincia = "Asturias" AND vivienda.m2>
(select max(v.m2) from vivienda v 
join municipio m on v.codigo_municipio = m.codigo
where m.nombre = 'Llanes') ;



// todas las personas por casa 

select vivienda.DIRECCION, persona.nombre, municipio.nombre from vivienda
join persona on vivienda.dni_propietario = persona.dni
join municipio on vivienda.codigo_municipio = municipio.codigo;

    select persona.nombre, vivienda.DIRECCION, persona.tlfno from persona
    join vivienda on persona.dni = vivienda.dni_propietario
    where persona.CABEZA_FAMILIAR is Null 
    and persona.EMPADRONAMIENTO = vivienda.codigo




select persona.nombre, persona.tlfno from persona 
where persona.dni = (
    select persona.CABEZA_FAMILIAR from persona 
    where persona.dni = 'K12121212' 
);



select persona.nombre, count(*) from vivienda
join persona on vivienda.dni_propietario = persona.dni
join municipio on persona.EMPADRONAMIENTO = municipio.codigo
where municipio.PROVINCIA = 'Asturias'
group by vivienda.dni_propietario;


SELECT persona.nombre, persona.tlfno from persona 
join municipio on persona.EMPADRONAMIENTO = municipio.codigo
where municipio.nombre = 'Oviedo' AND persona.nombre LIKE 'M%'


// esta mal pero bueno

select municipio.nombre, count(*) as media_personas_a_cargo from persona
JOIN municipio on persona.EMPADRONAMIENTO = municipio.codigo
group by municipio.nombre




