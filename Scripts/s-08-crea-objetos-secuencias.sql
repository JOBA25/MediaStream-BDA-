-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					28/12/2021
-- @Descripcion		Creación de los usuarios

connect sys/system as sysdba 

whenever sqlerror exit rollback;

-- Módulo cliente
-- PLAN_SUBSCRIPCION_HISTORICO
create sequence cliente.seq_plan_subscripcion_historico
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- PLAN_SUBSCRIPCION
create sequence cliente.seq_plan_subscripcion 
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- TARJETA_CREDITO
create sequence cliente.seq_tarjeta_credito
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- CARGO_MENSUAL
create sequence cliente.seq_cargo_mensual
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- USUARIO
create sequence cliente.seq_usuario
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- DISPOSITIVO
create sequence cliente.seq_dispositivo 
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- PLAYLIST
create sequence cliente.seq_playlist
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- PLAYLIST_USUARIO_COMPARTIDO
create sequence cliente.seq_playlist_usuario_compartido
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- PLAYLIST_MULTIMEDIA
create sequence cliente.seq_playlist_multimedia
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- REGISTRO_REPRODUCCION 
create sequence cliente.seq_registro_reproduccion
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- Módulo multimedia
-- CONTENIDO_MULTIMEDIA
create sequence multimedia.seq_contenido_multimedia
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- CALIFICACION
create sequence multimedia.seq_calificacion
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- COMENTARIO
create sequence multimedia.seq_comentario
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- GENERO 
create sequence multimedia.seq_genero
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- MULTIMEDIA_AUTOR  
create sequence multimedia.seq_multimedia_autor
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- AUTOR 
create sequence multimedia.seq_autor
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- SECCION
create sequence multimedia.seq_seccion
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- MUSICA
create sequence multimedia.seq_musica
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- VIDEO
create sequence multimedia.seq_video
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- FORMATO_AUDIO
create sequence multimedia.seq_formato_audio
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- TIPO_VIDEO
create sequence multimedia.seq_tipo_video
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- PROTOCOLO_TRANSMICION 
create sequence multimedia.seq_protocolo_transmicion
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- TIPO_TRANSPORTE
create sequence multimedia.seq_tipo_transporte
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

-- CODIFICACION_VIDEO
create sequence multimedia.seq_codificacion_video
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

whenever sqlerror continue none;