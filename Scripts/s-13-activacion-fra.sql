-- @Autor:                  Barcenas Avelar Jorge Octavio - 
--                          Abraham Josué Lazaro Martínez
-- @Fecha creación:         2/01/2022
-- @Descripción:            Habiliar la FRA

connect sys/system as sysdba

-- Tamaño de la FRA
alter system set db_recovery_file_dest_size = 5G scope = both;

-- Archivos de la FRA
alter system set db_recovery_file_dest = '/disk_3' scope = both;

-- Cantidad de minutos que se puede realizar flashback
-- 7 días, 1 semana
alter system set db_flashback_retention_target = 10080 scope = spfile;

