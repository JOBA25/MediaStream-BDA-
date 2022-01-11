-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					28/12/2021
-- @Descripcion		Creación de la base de datos

connect sys/hola1234* as sysdba

#creación pfile
create spfile from pfile;
shutdown

startup nomount

whenever sqlerror exit rollback

create database baproyla
	user sys identified by system
	user system identified by system
	logfile group 1 (
		'/disk_1/app/oracle/oradata/BAPROYLA/redo01a.log',
		'/disk_2/app/oracle/oradata/BAPROYLA/redo01b.log',
		'/disk_3/app/oracle/oradata/BAPROYLA/redo01c.log') 
	size 50m blocksize 512,
	group 2 (
		'/disk_1/app/oracle/oradata/BAPROYLA/redo02a.log',
		'/disk_2/app/oracle/oradata/BAPROYLA/redo02b.log',
		'/disk_3/app/oracle/oradata/BAPROYLA/redo02c.log') 
	size 50m blocksize 512,
	group 3 (
		'/disk_1/app/oracle/oradata/BAPROYLA/redo03a.log',
		'/disk_2/app/oracle/oradata/BAPROYLA/redo03b.log',
		'/disk_3/app/oracle/oradata/BAPROYLA/redo03c.log') 
	size 50m blocksize 512
	maxloghistory 1 
	maxlogfiles 16 
	maxlogmembers 3
	maxdatafiles 1024
	character set AL32UTF8
	national character set AL16UTF16
	extent management local
	-- datafile system
	datafile '/disk_4/app/oracle/oradata/BAPROYLA/system01.dbf'
		size 700m reuse autoextend on next 1024k maxsize unlimited
	-- datafile sysaux
	sysaux datafile '/disk_4/app/oracle/oradata/BAPROYLA/sysaux01.dbf'
		size 550m reuse autoextend on next 1024k maxsize unlimited
	-- datafile users
	default tablespace users
		datafile '/disk_4/app/oracle/oradata/BAPROYLA/users01.dbf'
		size 500m reuse autoextend on maxsize unlimited
	-- datafile temp 
	default temporary tablespace temp
		tempfile '/disk_4/app/oracle/oradata/BAPROYLA/temp01.dbf'
		size 20m reuse autoextend on next 640k maxsize unlimited
	-- datafile undo
	undo tablespace undo
		datafile '/disk_4/app/oracle/oradata/BAPROYLA/undo01.dbf'
		size 200m reuse autoextend on next 5120k maxsize unlimited;



alter user sys identified by system;
alter user system identified by system;
alter user sysbackup identified by system;