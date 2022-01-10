-- @Autor:                  Barcenas Avelar Jorge Octavio - 
--                          Abraham Josué Lazaro Martínez
-- @Fecha creación:         2/01/2022
-- @Descripción:            Habiliar la archivelog mode

connect sys/system as sysdba 

-- Respaldo de spfile
create pfile from spfile;

-- Re-iniciar la instancia
shutdown immediate
startup

connect sys/system as sysdba  

-- Configuración de los parámetros
alter system set log_archive_max_processes = 5 scope = spfile;
alter system set log_archive_format = 'arch_baproyla_%t_%s_%r.arc' scope = spfile;
alter system set log_archive_dest_1 = 'LOCATION=/baproyla_recovery' scope = spfile;
alter system set log_archive_dest_2 = 'LOCATION=/baproyla_recovery_2' scope = spfile;
alter system set log_archive_dest_3 = 'LOCATION=/disk_3/archive MANDATORY' scope = spfile;
alter system set log_archive_min_succeed_dest = 2 scope = spfile;

-- Re-iniciar la instancia a modo mount
shutdown immediate
startup mount

-- Activamos modo archivelog y abrimos la instancia
alter database archivelog;
alter database open;

-- Verificación
archive log list 