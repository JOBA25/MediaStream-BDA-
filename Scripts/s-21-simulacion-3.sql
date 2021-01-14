-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					12/01/2022
-- @Descripcion		script 3: simulación carga de datos y backup

Prompt fecha 2022/Enero/15  05:01 hrs
!sudo date --set "2022-01-15 05:01"

Prompt conectando como usuario sys
connect sys/system@baproyla_dedicated as sysdba

WHENEVER SQLERROR exit rollback;

Prompt insercion en tabla Autor
exec p_carga_autor(200);

Prompt insercion de usuarios (usuario, tarjeta_credito, dispositivo y cargo_mensual)
exec p_carga_usuario(500);

Prompt insercion en tabla registro_reproduccion 
exec p_carga_reproduccion(20000);

commit;

WHENEVER SQLERROR continue none;

Prompt fecha 2022/Enero/16  04:59 hrs
!sudo date --set "2022-01-16 04:56"

PROMPT HORA DE BACKUP NIVEL 1!!!
