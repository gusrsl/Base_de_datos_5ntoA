--RODRIGUEZ SAN LUCAS GUSTAVO EMILIO
--CENTRO DE EVENTOS DEPORTIVOS
--4/11/2021
--5TO NIVEL PARALELO A 

CREATE TABLE cliente
(
    client_id SERIAL NOT NULL ,
    client_nombre character(20)  NOT NULL,
    client_apellido character(20) NOT NULL,
    client_ci character(10) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (client_id)
);



CREATE TABLE servicios_adicionales
(
    paquetad_id SERIAL NOT NULL,
    paquetad_nombre character(30)  NOT NULL,
    paquetad_precio decimal NOT NULL,
    CONSTRAINT pk_servicios_adicionales PRIMARY KEY (paquetad_id)
);

CREATE TABLE tipo_empleado
(
    tipoemp_id SERIAL NOT NULL,
    tipoemp_descripcion character(40)  NOT NULL,
    CONSTRAINT pk_tipo_empleado PRIMARY KEY (tipoemp_id)

);


CREATE TABLE empleado
(
    emp_id SERIAL not null,
    tipoemp_id SERIAL NOT NULL,
    emp_nombre character(25) NOT NULL,
    emp_apellidos character(25)  NOT NULL,
    emp_ci character(10)  NOT NULL,
    emp_direccion character(40)  NOT NULL,
    emp_fechanacimiento date NOT NULL,
    emp_fechainglaborar date NOT NULL,
	emp_sueldo_mensual decimal NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (emp_id),
	
	CONSTRAINT fk1_tipoempleado
      FOREIGN KEY(tipoemp_id) 
	  REFERENCES tipo_empleado(tipoemp_id)
);

CREATE TABLE area_eventodep
(
    areae_id SERIAL NOT NULL ,
    areae_numareadep integer NOT NULL,
    areae_horademantenimiento time without time zone NOT NULL,
    areae_capacidad integer NOT NULL,
    areae_tipo_descripcion character(50) NOT NULL,
	area_costo_alquiler_hora decimal NOT NULL,
	emp_id serial NOT NULL,
	areae_disponibilidad BOOLEAN NOT NULL,
    CONSTRAINT pk_area_eventodep PRIMARY KEY (areae_id),
	
	CONSTRAINT fk1_empleado
      FOREIGN KEY(emp_id) 
	  REFERENCES empleado(emp_id)
	
	
);


CREATE TABLE reserva
(
    res_id SERIAL NOT NULL,
    fac_id SERIAL NOT NULL,
    areae_id SERIAL NOT NULL,
    emp_id SERIAL NOT NULL,
    client_id SERIAL NOT NULL,
    paquetad_id SERIAL NOT NULL,
	res_descripcion character(60) NOT NULL,
    res_fecha_evento date NOT NULL,
    res_hora_inicio time without time zone NOT NULL,
    res_hora_fin time without time zone NOT NULL,
	res_horas_alquiladas int not null,
    CONSTRAINT pk_reserva PRIMARY KEY (res_id),
	
	CONSTRAINT fk1_reserva_area
      FOREIGN KEY(areae_id) 
	  REFERENCES area_eventodep(areae_id),
	
	
	CONSTRAINT fk3_reserva_empleado
      FOREIGN KEY(emp_id) 
	  REFERENCES empleado(emp_id),
	
	CONSTRAINT fk4_reserva_client
      FOREIGN KEY(client_id) 
	  REFERENCES cliente(client_id),
	
	CONSTRAINT fk5_reserva_paquead
      FOREIGN KEY(paquetad_id) 
	  REFERENCES servicios_adicionales(paquetad_id)
	

);

CREATE TABLE factura
(
    fac_id SERIAL  NOT NULL,
	res_id SERIAL NOT NULL,
    fac_fecha DATE NOT NULL,
    fac_subtotal decimal  NOT NULL,
    fac_total decimal NOT NULL,
    fac_iva decimal  NOT NULL,
    CONSTRAINT pk_factura PRIMARY KEY (fac_id),
	
	CONSTRAINT fk1_reserva
      FOREIGN KEY(res_id) 
	  REFERENCES reserva(res_id)
);

CREATE TABLE mantenimiento
(
    man_id serial NOT NULL ,
    emp_id INTEGER NOT NULL ,
    areae_id INTEGER NOT NULL ,
    man_fecha_mant date,
    CONSTRAINT pk_mantenimiento PRIMARY KEY (man_id),
	
	CONSTRAINT fk1_EMPLEADO
      FOREIGN KEY(emp_id) 
	  REFERENCES empleado(emp_id),
	
	CONSTRAINT fk1_Area_Evento
      FOREIGN KEY(areae_id) 
	  REFERENCES area_eventodep(areae_id)
);

--INSERCION DE DATOS TABLAS 






--DATOS DE TABLA CLEINTES FINALIZADA

/*client_id SERIAL NOT NULL ,
    client_nombre character(20)  NOT NULL,
    client_apellido character(20) NOT NULL,
    client_ci character(10) NOT NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (client_id)*/

insert into cliente values (default,'Marcos','Gonzalez','1315689453');
insert into cliente values (default,'Mario','Betancur','1314567945');
insert into cliente values (default,'Luis','Joza','1683940593');
insert into cliente values (default,'Bnejie','Salcedo','1405831956');
insert into cliente values (default,'Raul','Miller','1314560041');
insert into cliente values (default,'Kevin','Rosa','1334067945');
insert into cliente values (default,'Matias','Chica','1314567945');
insert into cliente values (default,'Mario','Betancur','1314567945');
insert into cliente values (default,'Kevin','Cool','1314567945');
insert into cliente values (default,'Axel','Mero','1314567945'); --10
insert into cliente values (default,'Diego','Flores','1300067945');
insert into cliente values (default,'Arturo','Maldini','1314500045');
insert into cliente values (default,'Leo Messi','GOAT','0123567940');
insert into cliente values (default,'Cristiano','Elbicho','1315569945');
insert into cliente values (default,'Axel','Moreira','1310097945');
insert into cliente values (default,'Luis','Mero','1311797945');
insert into cliente values (default,'Andres','Mirando','1312407945');
insert into cliente values (default,'Benjie','Mero','1314090945');
insert into cliente values (default,'Asrael','Pincai','0304567945');
insert into cliente values (default,'Miller','Cedeno','0404567945');--20

--DATOS TABLA SERVICIOS_ADICIONALES FINALIZADA

    /*paquetad_id SERIAL NOT NULL,
    paquetad_nombre character(30)  NOT NULL,
    paquetad_precio money NOT NULL,
    CONSTRAINT pk_servicios_adicionales PRIMARY KEY (paquetad_id)*/

insert into servicios_adicionales values (default,'Servicio comida',15.00);
insert into servicios_adicionales values (default,'Hidratacion',10.00);
insert into servicios_adicionales values (default,'Premiacion',50.00);
insert into servicios_adicionales values (default,'Arbitraje',35.00);
insert into servicios_adicionales values (default,'Ninguno',35.00);


--DATOS DE TIPO DE EMPLEADO FINALIZADA

/*tipoemp_id SERIAL NOT NULL,
    tipoemp_descripcion character(40)  NOT NULL,
    CONSTRAINT pk_tipo_empleado PRIMARY KEY (tipoemp_id)*/


insert into tipo_empleado values (default, 'Atencion al Cliente');
insert into tipo_empleado values (default, 'Mantenimiento de Canchas');
insert into tipo_empleado values (default, 'Mantenimiento de piscina');
insert into tipo_empleado values (default, 'Arabitraje');


--DATOS EMPLEADO FINALIZADA

	/*emp_id SERIAL not null,
    tipoemp_id SERIAL NOT NULL,
    emp_nombre character(25) NOT NULL,
    emp_apellidos character(25)  NOT NULL,
    emp_ci character(10)  NOT NULL,
    emp_direccion character(40)  NOT NULL,
    emp_fechanacimiento date NOT NULL,
    emp_fechainglaborar date NOT NULL,
	emp_sueldo_mensual money NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (emp_id),*/
	

	--ATENCION AL CLIENTE
	INSERT INTO EMPLEADO VALUES (DEFAULT,1,'Teodoro','Sldarriaga','1334519643','Urb coyoacan','2002/01/20','2019/04/20',400);
	INSERT INTO EMPLEADO VALUES (DEFAULT,1,'Geovanito','Munoz','1316354453','Calle 11 av 40','2001/10/30','2019/05/14',500);
	INSERT INTO EMPLEADO VALUES (DEFAULT,1,'Manuel','Pincai','1354516643','Calle 7 av 8','2001/02/21','2019/06/24',450);
	--MANTENIMIENTO DE CANCHAS
	INSERT INTO EMPLEADO VALUES (DEFAULT,2,'Luisa','Pico','1004519643','Calle 17 av 18','2002/05/25','2019/04/04',450);
	INSERT INTO EMPLEADO VALUES (DEFAULT,2,'Lorena','Cevallos','1306374153','Calle 9 av 30','2001/09/14','2019/04/04',470);
	INSERT INTO EMPLEADO VALUES (DEFAULT,2,'Tina','Mendoza','0334519043','Calle 7 av 16','2002/03/19','2019/04/04',500);
	INSERT INTO EMPLEADO VALUES (DEFAULT,2,'Gus','Tinitana','0334019043','Calle 17 av 1','2001/04/30','2019/04/04',500);
	INSERT INTO EMPLEADO VALUES (DEFAULT,3,'Anthony','Palacios','1334519643','urb coyoacan','2003/08/29','2019/04/04',400);
	--MANTENIMIENTO DE PISCINA
	INSERT INTO EMPLEADO VALUES (DEFAULT,3,'Emilio','Flores','1316354453','urb coyoacan','2001/10/11','2019/04/04',400);

	
--DATOS DE AREA_EVENTODEP  FINALIZADA

	-- areae_id SERIAL NOT NULL ,
	-- client_id SERIAL NOT NULL,
    -- areae_numareadep integer NOT NULL,
    -- areae_horademantenimiento time without time zone NOT NULL,
    -- areae_capacidad integer NOT NULL,
    -- areae_tipo_descripcion character(50) NOT NULL,
	-- area_costo_alquiler_hora money NOT NULL,
	-- emp_id serial NOT NULL,
	-- areae_disponibilidad BOOLEAN NOT NULL,
    -- CONSTRAINT pk_area_eventodep PRIMARY KEY (areae_id),

insert into area_eventodep values (default,101,'11:00:00',35,'Cancha de Futbol Cemento',70,4,TRUE);
insert into area_eventodep values (default,102,'10:00:00',40,'Cancha de Basquet',60,5,TRUE);
insert into area_eventodep values (default,103,'16:00:00',35,'Cancha de Volley',50,6,TRUE);
insert into area_eventodep values (default,104,'13:00:00',70,'Cancha Sintetica Futbol',100,7,TRUE);
insert into area_eventodep values (default,105,'14:00:00',45,'Coliseo',70,8,TRUE);
insert into area_eventodep values (default,106,'15:00:00',50,'Piscina',40,9,TRUE);
	

	
--DATOS DE LA RESERVA

	-- res_id SERIAL NOT NULL,
    -- fac_id SERIAL NOT NULL,
    -- areae_id SERIAL NOT NULL,
    -- emp_id SERIAL NOT NULL,
    -- client_id SERIAL NOT NULL,
    -- paquetad_id SERIAL NOT NULL,
	-- res_descripcion character(60) NOT NULL,
    -- res_fecha_evento date NOT NULL,
    -- res_hora_inicio time without time zone NOT NULL,
    -- res_hora_fin time without time zone NOT NULL,
	-- res_horas_alquiladas int not null,
    -- CONSTRAINT pk_reserva PRIMARY KEY (res_id),
	

	
	insert into reserva values (default,1,1,1,1,1,'Torneo de futbol sala','2020/01/03','11:00:00','12:00:00',1);
	insert into reserva values (default,2,2,2,2,4,'Torneo de basquet','2020/01/15','14:00:00','15:00:00',1);
	insert into reserva values (default,3,1,3,3,4,'Torneo de futbol sala','2020/03/05','17:00:00','18:00:00',1);
	insert into reserva values (default,4,2,1,4,2,'Torneo de basquet','2020/03/25','11:00:00','12:00:00',1);
	insert into reserva values (default,5,3,2,5,3,'Torneo de volley','2020/05/05','14:00:00','15:00:00',1);
	insert into reserva values (default,6,3,3,6,4,'Torneo de volley','2020/05/15','17:00:00','18:00:00',1);
	insert into reserva values (default,7,6,1,1,1,'Torneo Natacion','2020/07/01','11:00:00','12:00:00',1);--7
	
	insert into reserva values (default,8,1,1,7,1,'Torneo de futbol sala','2021/01/05','11:00:00','12:00:00',1);
	insert into reserva values (default,9,2,2,7,4,'Torneo de basquet','2021/02/05','11:00:00','12:00:00',1);
	insert into reserva values (default,10,3,3,8,4,'Torneo de volley','2021/03/05','11:00:00','12:00:00',1);
	insert into reserva values (default,11,4,1,9,4,'Torneo de futbol','2021/04/05','11:00:00','12:00:00',1);
	insert into reserva values (default,12,4,2,10,5,'Torneo de futbol','2021/05/05','11:00:00','12:00:00',1);
	insert into reserva values (default,13,4,3,11,5,'Torneo de futbol','2021/06/05','11:00:00','12:00:00',1);
	insert into reserva values (default,14,2,4,12,5,'Torneo de basquet','2021/07/05','11:00:00','12:00:00',1);
	insert into reserva values (default,15,2,1,13,5,'Torneo de basquet','2021/08/05','11:00:00','12:00:00',1);
	insert into reserva values (default,16,1,1,14,5,'Torneo de futbol sala','2021/09/05','11:00:00','12:00:00',1);
	insert into reserva values (default,17,1,2,15,2,'Torneo de futbol sala','2021/10/05','11:00:00','12:00:00',1);
	insert into reserva values (default,18,2,2,16,3,'Torneo de basquet','2021/11/05','11:00:00','12:00:00',1);
	insert into reserva values (default,19,4,2,17,5,'Torneo de futbol sala','2021/11/15','11:00:00','12:00:00',1);
	insert into reserva values (default,20,2,1,1,5,'Torneo de futbol sala','2021/12/05','11:00:00','12:00:00',1);--20
	
	
--DATOS DE FACTURA

/*fac_id SERIAL  NOT NULL,
	res_id SERIAL NOT NULL,	
    fac_fecha DATE NOT NULL,
    fac_subtotal money  NOT NULL,
    fac_total money NOT NULL,
    fac_iva money  NOT NULL,
    CONSTRAINT pk_factura PRIMARY KEY (fac_id)*/
	
	--SELECT * FROM FACTURA
	--select * from public.area_eventodep
	
 	insert into factura values (default,1,'2020/01/03',70,78.4,8.4);
	insert into factura values (default,2,'2020/01/15',60,67.2,7.2);
	insert into factura values (default,3,'2020/03/05',70,78.4,8.4);
	insert into factura values (default,4,'2020/03/25',67.2,60,7.2);
	insert into factura values (default,5,'2020/05/05',50,56,6);
	insert into factura values (default,6,'2020/05/15',50,56,6);--6
	
	insert into factura values (default,7,'2020/07/01',40,44.8,4.8);
	insert into factura values (default,8,'2021/01/05',70,78.4,8.4);
	insert into factura values (default,9,'2021/02/05',60,67.2,7.2);
	insert into factura values (default,10,'2021/03/05',50,56,6);
	insert into factura values (default,11,'2021/04/05',100,112,12);
	insert into factura values (default,12,'2021/05/05',100,112,12);
	insert into factura values (default,13,'2021/06/05',100,112,12);
	insert into factura values (default,14,'2021/07/05',60,67.2,7.2);
	insert into factura values (default,15,'2021/08/05',60,67.2,7.2);
	insert into factura values (default,16,'2021/09/05',100,112,12);
	insert into factura values (default,17,'2021/10/05',100,112,12);
	insert into factura values (default,18,'2021/11/05',60,67.2,7.2);
	insert into factura values (default,19,'2021/11/15',70,78.4,8.4);
	insert into factura values (default,20,'2021/12/05',70,78.4,8.4);--20
	
--DATOS MANTENIMIENTO
/*CREATE TABLE mantenimiento
(
    man_id serial NOT NULL ,
    emp_id integer NOT NULL ,
    areae_id integer NOT NULL ,
    man_fecha_mant date,
    CONSTRAINT pk_mantenimiento PRIMARY KEY (man_id),*/
	
	insert into mantenimiento values (default, 1, 2,'2021/06/05');
	insert into mantenimiento values (default, 2, 1,'2021/06/05');
	insert into mantenimiento values (default, 2, 2,'2021/06/05');
	insert into mantenimiento values (default, 3, 3,'2021/06/05');
	insert into mantenimiento values (default, 4, 4,'2021/06/05');
	insert into mantenimiento values (default, 2, 4,'2021/06/05');
	insert into mantenimiento values (default, 3, 1,'2021/06/05');
	
	--CONSULTA 1 
	 
	--Histórico anual de recaudaciones por tipo de evento. En una columna debe 
	--aparecer el año, en otra el tipo de evento, en otra columna la cantidad 
	--de dinero recolectada.
	

	
	select 
	extract (year from reserva.res_fecha_evento) as Anio,
	reserva.res_descripcion as tipo_evento,
	sum(fac_total) as cantidad_anual
	from 
	factura 
	inner join reserva on reserva.fac_id = factura.fac_id
	inner join area_eventodep on area_eventodep.areae_id = reserva.areae_id
	
	where extract (year from reserva.res_fecha_evento) = 2021
	group by extract (year from reserva.res_fecha_evento),reserva.res_descripcion;
	
	--CONSULTA 2
	
--	•	Histórico de número de tipos de campeonatos celebrados en el centro deportivo. 
--	En una columna debe aparecer el año, en otra columna el tipo de evento deportivo, 
--	en otra columna la cantidad de campeonatos para esa disciplina que se han jugado.
	
	select 
	extract (year from reserva.res_fecha_evento) as Anio,
	reserva.res_descripcion as tipo_evento,
	count(fac_total) as num_campeonatos
	from 
	factura 
	inner join reserva on reserva.fac_id = factura.fac_id
	inner join area_eventodep on area_eventodep.areae_id = reserva.areae_id
	
	where extract (year from reserva.res_fecha_evento) = 2021
	group by extract (year from reserva.res_fecha_evento),reserva.res_descripcion;
	
	--CONSULTA 3
	
--	•	Histórico de mantenimientos realizados al año por cada empleado. En una columna
--	 debe aparecer el año, en otra el nombre de empleado, y en otra la cantidad de 
--	mantenimientos que ese empleado ha dado.

	
	
	select 
	extract (year from mantenimiento.man_fecha_mant) as Anio,
	empleado.emp_nombre || ' ' || empleado.emp_apellidos AS Empleado_Asignado,
	count(mantenimiento.man_id) as num_mantenimiento
	from 
	mantenimiento 
	inner join empleado on empleado.emp_id = mantenimiento.emp_id

	
	where extract (year from mantenimiento.man_fecha_mant) = 2021
	group by extract (year from mantenimiento.man_fecha_mant),empleado.emp_nombre,empleado.emp_apellidos;
	
	--CONSULTA 4
	
--	•	Histórico de cantidad de veces que se ha ocupado anualmente cada área del centro. 
--	En una columna debe aparecer el año, en otra columna el nombre del área, en otra 
--	columna la cantidad de veces que esa área fue ocupada ese año.

	select 
	extract (year from reserva.res_fecha_evento) as Anio,
	area_eventodep.areae_tipo_descripcion as tipo_evento,
	count(fac_total) as cantidad_anual
	from 
	factura 
	inner join reserva on reserva.fac_id = factura.fac_id
	inner join area_eventodep on area_eventodep.areae_id = reserva.areae_id
	
	where extract (year from reserva.res_fecha_evento) = 2021
	group by extract (year from reserva.res_fecha_evento),area_eventodep.areae_tipo_descripcion ;
	
	-------------------PROCEDIMIENTO ALMACENADO-------------	
-- •	Como procedimiento almacenado se puede obtener los ingresos obtenidos por una área 
	-- deportiva en especifico ingresando el area a bosquejar
	
	
	CREATE OR REPLACE FUNCTION Valores_AreaEvento(VARCHAR) 
RETURNS real AS  
$BODY$   

 	select --into total
	sum(fac_total)
	from 
	factura 
	inner join reserva on reserva.fac_id = factura.fac_id
	inner join area_eventodep on area_eventodep.areae_id = reserva.areae_id
	where area_eventodep.areae_tipo_descripcion = $1;
$BODY$ 
LANGUAGE SQL;

--comprobacion 
select valores_areaevento('Cancha de Basquet')

 ---------------------CURSOR--------------------------
 
--DROP FUNCTION expl_cursor1()
-- CASO1 : Uso simple de cursores EXPLÍCITOS 
CREATE OR REPLACE FUNCTION expl_cursor1() RETURNS SETOF void AS
$BODY$
DECLARE
	registro Record;
	
    -- Declaración EXPLICITA del cursor
    cur_clientes CURSOR FOR  
	select extract (year from reserva.res_fecha_evento) as Anio,
	trim(area_eventodep.areae_tipo_descripcion) as tipo_evento,
	count(fac_total) as cantidad_anual,
	sum(fac_total) as recaudacion_anual 
	from 
	factura 
	inner join reserva on reserva.fac_id = factura.fac_id
	inner join area_eventodep on area_eventodep.areae_id = reserva.areae_id
	
	where extract (year from reserva.res_fecha_evento) = 2021
	group by extract (year from reserva.res_fecha_evento),area_eventodep.areae_tipo_descripcion; 
	
    --registro ROWTYPE;
BEGIN
   -- Procesa el cursor
   open cur_clientes;
   fetch cur_clientes into registro;
   while (found) loop
   raise notice 'Anio: %,Evento: %,Cantidad: %, Recaudado:$ %',registro.anio,registro.tipo_evento,
   registro.cantidad_anual,registro.recaudacion_anual;
   fetch cur_clientes into registro;
   END LOOP;
   RETURN;
END $BODY$ LANGUAGE 'plpgsql'

--comprobacion 
select expl_cursor1()

----------------------------TRIGGER QUE SI FUNCIONA---------------------
--	Un trigger que haga un aumento salarial del 20% de su salario actual a aquel empleado
--	el cual posea mas de 4 eventos administrados en un año.


CREATE OR REPLACE FUNCTION Aumento() RETURNS TRIGGER
AS 
    $Aumento$
DECLARE
    Num_Evento BIGINT ;
	Nombre_empleado varchar;
BEGIN
   	select
	count(reserva.emp_id) into Num_Evento
	from 
	reserva
	inner join empleado on empleado.emp_id = reserva.emp_id
	where reserva.emp_id = new.emp_id
	group by reserva.emp_id,empleado.emp_nombre;
	
	select
	empleado.emp_nombre into Nombre_empleado
	from 
	empleado 
	where empleado.emp_id = new.emp_id;

    IF(Num_Evento < 4) THEN
        RAISE NOTICE 'No aplica para Aumento salarial';
    ELSE
        UPDATE empleado SET emp_sueldo_mensual = emp_sueldo_mensual + (emp_sueldo_mensual * 0.20) 
		WHERE empleado.emp_id = NEW.emp_id;
        RAISE NOTICE 'Aumento realizado a: %', Nombre_empleado;
    END IF;
    RETURN NEW;
END;
$Aumento$
LANGUAGE plpgsql;

CREATE TRIGGER Aumento AFTER
INSERT ON reserva FOR EACH ROW
EXECUTE PROCEDURE Aumento();
--Comprobar que al momento de reserva el trigger se dispare (el valor para aignar el empleado es el 4)
insert into reserva values (default,21,2,7,1,5,'Torneo de futbol sala','2021/12/05','11:00:00','12:00:00',1);--20

-----------------COSNULTA PARA EL IREPORT--------------

select
	sum(fac_total) as Dinero_Anual,
	extract (year from reserva.res_fecha_evento) as Año_Consultado
	
	from 
	factura 
	inner join reserva on reserva.fac_id = factura.fac_id
	inner join area_eventodep on area_eventodep.areae_id = reserva.areae_id
	
	group by extract (year from reserva.res_fecha_evento);