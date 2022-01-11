-- @Autor:                  Barcenas Avelar Jorge Octavio - 
--                          Abraham Josué Lazaro Martínez
-- @Fecha creación:         2/01/2022
-- @Descripción:            Habiliar la archivelog mode

connect sys/system as sysdba

-- 5 dispatchers, protocolo TCP
alter system set dispatchers='(DISPATCHERS=5)(PROTOCOL=tcp)';

-- 20 shared servers
alter system set shared_servers=20;

-- Registrando servicios en el listener
alter system register;