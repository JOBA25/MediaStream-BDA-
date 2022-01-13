-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					12/01/2021
-- @Descripcion		Creación de procedimientos para carga

create or replace procedure p_carga_autor(
	p_cantidad_registros in number
) is 
	v_index number;
begin 
	for i in 1..p_cantidad_registros loop
		v_index := MULTIMEDIA.SEQ_AUTOR.NEXTVAL;
		insert into MULTIMEDIA.AUTOR (AUTOR_ID, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, EMAIL, NOMBRE_ARTISTICO) 
		values (
			v_index, 
			sys.dbms_random.string('P',100), 
			sys.dbms_random.string('P',100), 
			sys.dbms_random.string('P',100), 
			sys.dbms_random.string('P',100), 
			sys.dbms_random.string('P',100)
		);
	end loop;
end;
/
show errors

create or replace procedure p_carga_usuario(
	p_cantidad_registros in number
) is 
	v_usuario_id number;
	v_tarjeta_id number;
	v_tipo number;
	v_tipo_c varchar2(1);
	v_costo number;
begin 
	for i in 1..p_cantidad_registros loop

		v_usuario_id := CLIENTE.SEQ_USUARIO.NEXTVAL;
		v_tarjeta_id := CLIENTE.SEQ_TARJETA_CREDITO.NEXTVAL;

		-- Tabla cliente.usuario
		insert into CLIENTE.USUARIO(USUARIO_ID, USERNAME, PASSWORD, EMAIL, NOMBRE, APELLIDO_PATERNO, 
			APELLIDO_MATERNO, RFC, PLAN_SUBSCRIPCION_ID, USUARIO_DUENIO_CUENTA_ID) 
		values (
			v_usuario_id, 																	-- Usuario_id
			sys.dbms_random.string('P',100), 								-- username
			sys.dbms_random.string('P',30), 								-- password
			sys.dbms_random.string('P',100),								-- email 
			sys.dbms_random.string('P',100), 								-- nombre
			sys.dbms_random.string('P',100), 								-- apellido_paterno
			sys.dbms_random.string('P',100), 								-- apellido_materno
			sys.dbms_random.string('P',13),									-- RFC 
			(select round(dbms_random.value(1,5)) from dual), -- plan_subscripcion_id 
			NULL);

		-- Tabla cliente.tarjeta_credito
		select round(dbms_random.value(1,2)) 
		into v_tipo
		from dual;

		if v_tipo = 1 then
			v_tipo_c:='C';
		else
			v_tipo_c:='D';
		end if;

		insert into CLIENTE.TARJETA_CREDITO(TARJETA_CREDITO_ID, NUMERO, TIPO, NUMERO_SEGURIDAD, 
			ANIO_VIGENCIA, MES_VIGENCIA, USUARIO_ID) 
		values (
			v_tarjeta_id, 																					-- tarjeta_credito_id
																															-- numero
			(select round(dbms_random.value(1000000000000000000,9999999999999999999)) from dual), 	
			v_tipo_c, 																							-- tipo
			(select round(dbms_random.value(100,999)) from dual), 	-- numero_seguridad
			(select round(dbms_random.value(2022,2100)) from dual), -- anio_vigencia
			(select round(dbms_random.value(1,12)) from dual), 			-- mes_vigencia
			v_usuario_id																						-- usuario_id
		);

		-- Tabla cliente.cargo_mensual
		select p.costo into v_costo
		from cliente.usuario u, cliente.plan_subscripcion p 
		where u.usuario_id = 1 
		and u.plan_subscripcion_id = p.plan_subscripcion_id;

		insert into CLIENTE.CARGO_MENSUAL(CARGO_MENSUAL_ID, FECHA_CARGO, IMPORTE, FOLIO, 
			TARJETA_CREDITO_ID) 
		values (
			CLIENTE.seq_cargo_mensual.NEXTVAL, 	-- cargo_mensual_id
			SYSDATE, 														-- fecha_cargo
			v_costo, 														-- importe
			sys.dbms_random.string('P',20), 		-- folio
			v_tarjeta_id												-- tarjeta_credito_id
		);

		-- Tabla cliente.dispositivo
		insert into CLIENTE.DISPOSITIVO(DISPOSITIVO_ID, TIPO, IP, SO, NOMBRE, MARCA, 
			USUARIO_ID) 
		values (
			CLIENTE.seq_dispositivo.NEXTVAL, 		-- dispositivo_id
			sys.dbms_random.string('P',20), 		-- tipo
			sys.dbms_random.string('P',40), 		-- IP
			sys.dbms_random.string('P',30), 		-- SO
			sys.dbms_random.string('P',50), 		-- Nombre
			sys.dbms_random.string('P',50), 		-- Marca
			v_usuario_id);											-- usuario_id

	end loop;
end;
/
show errors

create or replace procedure p_carga_reproduccion(
	p_cantidad_registros in number
) is 
	v_usuario number;
	v_multimedia number;
	v_dispositivo number;
begin 
	for i in 1..p_cantidad_registros loop

		select usuario_id, dispositivo_id 
		into v_usuario, v_dispositivo
		from cliente.dispositivo SAMPLE(10) 
		where rownum <=1;

		select contenido_multimedia_id into v_multimedia
		from multimedia.contenido_multimedia SAMPLE(10) 
		where rownum <=1;

		insert into CLIENTE.REGISTRO_REPRODUCCION(REGISTRO_REPRODUCCION_ID, FECHA_INICIO, 
			FECHA_FIN, DURACION_MIN, VELOCIDAD_CARGA, VELOCIDAD_DESCARGA, UBICACION_LATITUD, 
			UBICACION_LONGITUD, SEGUNDO_INICIAL, SEGUNDO_FINAL, CONTENIDO_MULTIMEDIA_ID, USUARIO_ID, 
			DISPOSITIVO_ID) 
		values(
			CLIENTE.seq_registro_reproduccion.nextval, 	-- registro_reproduccion_id
			SYSDATE, 																		-- fecha_inicio
			SYSDATE, 																		-- fecha_fin
																									-- duracion_min
			(select round(dbms_random.value(1,300),2) from dual), 
																									-- velocidad_carga
			(select round(dbms_random.value(100,999),2) from dual), 
																									-- velocidad_descarga
			(select round(dbms_random.value(100,999),2) from dual), 
																									-- ubicacion_latitud
			(select round(dbms_random.value(100,999),2) from dual),
																									-- ubicacion_longitud 
			(select round(dbms_random.value(100,999),2) from dual),
																									-- segundo_inicial
			(select round(dbms_random.value(1,18000)) from dual),
																									-- segundo_final 
			(select round(dbms_random.value(1,18000)) from dual), 
			v_multimedia, 
			v_usuario, 
			v_dispositivo);

	end loop;
end;
/
show errors
