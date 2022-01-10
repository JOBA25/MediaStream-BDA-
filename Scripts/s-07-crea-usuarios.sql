-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					28/12/2021
-- @Descripcion		Creación de los usuarios

connect sys/system as sysdba 

-- Se borran los usuarios si ya existen
declare 
	v_cuenta number;
	v_usuario varchar2(20) := 'CLIENTE';
begin
	select count(*)
	into v_cuenta
	from all_users 
	where username=v_usuario;

	if v_cuenta>0 then
		execute immediate 'drop user '||v_usuario||' cascade';
	end if;
end;
/

declare 
	v_cuenta number;
	v_usuario varchar2(20) := 'MULTIMEDIA';
begin
	select count(*)
	into v_cuenta
	from all_users 
	where username=v_usuario;

	if v_cuenta>0 then
		execute immediate 'drop user '||v_usuario||' cascade';
	end if;
end;
/

-- Creación de los usuarios
create user cliente identified by cliente 
default tablespace cliente_tbs
quota unlimited on cliente_tbs;

create user multimedia identified by multimedia 
default tablespace multimedia_tbs
quota unlimited on multimedia_tbs;

-- Les damos permisos para consultar sys indices
alter user cliente quota unlimited on cliente_ix_tbs;
alter user multimedia quota unlimited on multimedia_ix_tbs;
alter user multimedia quota unlimited on blob_tbs;

-- Crear un rol
-- Eliminamos el rol si existe
declare
  v_count number(1,0);
	v_rol varchar2(20) := 'ROL_ADMINISTRADOR';
begin
  select count(*) into v_count
  from dba_roles
  where role = v_rol;

  if v_count > 0 then
		execute immediate 'drop role '||v_rol;
  end if;
end;
/

-- Creando el rol
create role rol_administrador;
grant create session, create table, create view, create procedure, 
create sequence, create public synonym, create synonym, create type, 
create trigger, create any index to rol_administrador;

-- Otorgando el rol a los usuarios
grant rol_administrador to cliente;
grant rol_administrador to multimedia;