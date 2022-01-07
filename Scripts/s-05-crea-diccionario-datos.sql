-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					28/12/2021
-- @Descripcion		Creación del diccionario de datos

connect sys/system as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

connect system/system as sysoper 

@?/sqlplus/admin/pupbld.sql 
