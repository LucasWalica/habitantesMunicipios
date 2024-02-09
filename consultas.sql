Obtener el código necesario para realizar las siguientes consultas:
    
1-Nombre y teléfono de los habitantes de Oviedo.

        SELECT persona.nombre, persona.tlfno
        FROM persona
        JOIN vivienda ON persona.dni = vivienda.dni_propietario
        JOIN municipio ON vivienda.codigo_municipio = municipio.codigo
        WHERE municipio.nombre = 'Oviedo';

2-Nombre y teléfono de los habitantes del municipio de Gijon.

        SELECT persona.nombre, persona.tlfno
        FROM persona
        JOIN vivienda ON persona.dni = vivienda.dni_propietario
        JOIN municipio ON vivienda.codigo_municipio = municipio.codigo
        WHERE municipio.nombre = 'Gijon';

3-Dirección y metros cuadrados de las viviendas del municipio de Piloña.

        SELECT DIRECCION, m2 from vivienda where codigo_municipio = 4;

        SELECT DIRECCION, m2 from vivienda
        join municipio on vivienda.codigo = municipio.codigo 
        where municipio.nombre = 'Piloña';

4- Nombre y teléfono de aquellas personas que poseen una vivienda en Piloña.

        select persona.nombre, persona.tlfno from persona
        join vivienda on persona.dni = vivienda.dni_propietario
        join municipio on vivienda.codigo_municipio = municipio.codigo
        where  municipio.nombre = 'Piloña';

5-  De todas las viviendas del municipio de Llanes, 
    su dirección, localidad y nombre del propietario.

        select vivienda.DIRECCION, municipio.provincia as provincia, persona.nombre as propietario 
        from vivienda
        join persona on vivienda.dni_propietario = persona.dni
        join municipio on vivienda.codigo_municipio = municipio.codigo
        where municipio.nombre = 'Llanes' 

6-  Nombre, dirección y teléfono de todos los cabeza 
    de familia empadronados en el municipio de Gijon.

        select persona.nombre, vivienda.DIRECCION as DIRECCION, persona.tlfno
        from persona 
        join vivienda on persona.dni = vivienda.dni_propietario 
        where codigo_municipio =2; 

7-  Dirección completa de todas las viviendas del municipio
    de Oviedo y nombre y teléfono de su propietario para todas 
    aquellas que superan los 150 m2.
 
        select vivienda.DIRECCION, persona.nombre, persona.tlfno
        from vivienda 
        join persona on vivienda.dni_propietario = persona.dni
        where vivienda.m2 >150;

8-  Nombre de todos los municipios de Asturias 
    en los que la superficie media de sus viviendas supera los 70 m2.

        select municipio.nombre from municipio
        join vivienda on municipio.codigo = vivienda.codigo_municipio
        group by municipio.nombre
        having avg(m2)>70

9-  Nombre de cada municipio de Asturias y cantidad 
    de viviendas en cada uno de ellos que supera los 300 m2
    
        select municipio.nombre, count(*) as numViviendas from municipio
        join vivienda on municipio.codigo = vivienda.codigo_municipio
        where vivienda.m2 > 300

10- Número total de cabezas de familia empadronados en el municipio de Oviedo.

        select count(*) as numcabezasfamilia from persona 
        join vivienda on persona.dni = vivienda.dni_propietario
        join municipio on vivienda.codigo_municipio = municipio.codigo 
        where municipio.nombre = 'Oviedo'

11- Número total de municipios en cada provincia junto 
    con el nombre de la misma.

        select municipio.provincia, count(*) from municipio


12- Cantidad total de personas a cargo de cada cabeza de familia de las 
    localidades de Asturias cuyo nombre empieza o termina por la letra ‘s’.

        select p.nombre, count(*) as personas_a_cargo 
        from persona p
        join municipio on p.EMPADRONAMIENTO = municipio.codigo
        where p.CABEZA_FAMILIAR IS NOT NULL
        AND municipio.provincia = 'Asturias' 
        AND (municipio.nombre LIKE '%s' OR municipio.nombre LIKE 's%' )
        group by p.CABEZA_FAMILIAR;

13- Media de personas a cargo de un cabeza de familia en 
    cada municipio de la provincia de Asturias.

    

14- Tamaño medio en metros cuadrados de las viviendas de cada municipio 
    de la provincia de Asturias.

        select municipio.nombre ,avg(vivienda.m2) as media_m2 from vivienda
        join municipio on vivienda.codigo_municipio = municipio.codigo  
        group by municipio.nombre;

15- Nombre, dirección y teléfono del cabeza de familia responsable de 
    la persona con el D.N.I. K12121212

        select persona.nombre, persona.tlfno from persona 
        where persona.dni = (
        select persona.CABEZA_FAMILIAR from persona 
        where persona.dni = 'K12121212');

16- Nombre y número de viviendas que posee cada cabeza de familia 
    empadronado en un municipio de Asturias.

        select persona.nombre, count(*) from vivienda
        join persona on vivienda.dni_propietario = persona.dni
        join municipio on persona.EMPADRONAMIENTO = municipio.codigo
        where municipio.PROVINCIA = 'Asturias'
        group by vivienda.dni_propietario;

17- Nombre, dirección y teléfono de aquellos cabezas de familia que no 
    poseen una vivienda en el municipio en el que están empadronados.

        select persona.nombre, vivienda.DIRECCION, persona.tlfno from persona
        join vivienda on persona.dni = vivienda.dni_propietario
        where persona.CABEZA_FAMILIAR is Null 
        and persona.EMPADRONAMIENTO = vivienda.codigo

18- Nombre, dirección y teléfono de las personas que están empadronadas 
    o poseen una vivienda en el municipio de Piloña y cuyo nombre 
    empieza por la letra ‘L’. La consulta incluirá una última columna en la 
    que se mostrará el valor “empadronado” si la fila incluye datos de 
    una persona empadronada o el valor “propietario” si la fila incluye 
    datos de una persona que posee una vivienda en el municipio.



19- Dirección completa de la vivienda, junto con el nombre y teléfono de 
    su propietario, de aquellas viviendas de Asturias cuya superficie sea 
    mayor que la de todas las viviendas de Llanes.

        select persona.nombre, persona.tlfno, vivienda.DIRECCION from persona
        join vivienda on persona.dni = vivienda.dni_propietario
        join municipio on vivienda.codigo_municipio = municipio.codigo
        WHERE municipio.provincia = "Asturias" AND vivienda.m2>
        (select max(v.m2) from vivienda v 
        join municipio m on v.codigo_municipio = m.codigo
        where m.nombre = 'Llanes') ;    

20- Nombre, dirección y teléfono de las personas cuyo nombre empieza 
    por la letra ‘M’, que están empadronadas en Oviedo y poseen 
    viviendas en dicho municipio.

        SELECT persona.nombre, persona.tlfno from persona 
        join municipio on persona.EMPADRONAMIENTO = municipio.codigo
        where municipio.nombre = 'Oviedo' AND persona.nombre LIKE 'M%'
