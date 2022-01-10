-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					05/01/2022
-- @Descripcion		Creación de los tablespaces

connect sys/system as sysdba 

whenever sqlerror exit rollback;

-- Módulo: Cliente
prompt Tablespace cliente_tbs
create tablespace cliente_tbs 
  datafile '/disk_4/app/oracle/oradata/BAPROYLA/cliente_df.dbf' 
  size 2g
  autoextend on next 512m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

prompt Tablespace cliente_ix_tbs
create tablespace cliente_ix_tbs 
  datafile '/disk_4/app/oracle/oradata/BAPROYLA/cliente_ix_df.dbf' 
  size 128m
  autoextend on next 256k maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

-- Módulo: Multimedia
prompt Tablespace multimedia_tbs
create tablespace multimedia_tbs 
  datafile '/disk_4/app/oracle/oradata/BAPROYLA/multimedia_df.dbf' 
  size 1024k
  autoextend on next 256k maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

prompt Tablespace multimedia_ix_tbs
create tablespace multimedia_ix_tbs 
  datafile '/disk_4/app/oracle/oradata/BAPROYLA/multimedia_ix_df.dbf' 
  size 1024k
  autoextend on next 8k maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

prompt Tablespace blob_tbs
create tablespace blob_tbs 
  datafile '/disk_4/app/oracle/oradata/BAPROYLA/blob_df.dbf' 
  size 2g
  autoextend on next 512m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

whenever sqlerror continue none;