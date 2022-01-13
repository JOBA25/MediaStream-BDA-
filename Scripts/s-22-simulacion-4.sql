-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					12/01/2021
-- @Descripcion		scriipt 4: simulación carga de datos y backup

Prompt fecha 2021/Enero/16  05:01 hrs
!sudo date --set "2021-01-16 05:01"

Prompt conectando como usuario sys
connect sys/system as sysdba

WHENEVER SQLERROR exit rollback;

Prompt insercion en tabla Autor
exec p_carga_autor(100);

Prompt insercion de usuarios (usuario, tarjeta_credito, dispositivo y cargo_mensual)
exec p_carga_usuario(100);

Prompt insercion en tabla registro_reproduccion 
exec p_carga_reproduccion(1000);

commit;

WHENEVER SQLERROR continue none;

Prompt fecha 2021/Enero/17  04:59 hrs
!sudo date --set "2021-01-17 04:56"

PROMPT HORA DE BACKUP NIVEL 1!!!
