# @Autor					Lazaro Martinez Abraham Josue
#									Barcenas Avelar Jorge Octavio
# @Fecha					28/12/2021
# @Descripcion		Creación del archivo de parámetros y de passwords

# Asignando valor a ORACLE_SID
export ORACLE_SID=baproyla

# Creando archivo de passwords 
orapwd FILE=${ORACLE_HOME}/dbs/orapwbaproyla force=y format=12.2 SYS=password SYSBACKUP=password

# Creando archivo de parámetros
touch ${ORACLE_HOME}/dbs/initbaproyla.ora 

echo "db_name=baproyla
control_files=(	/disk_1/app/oracle/oradata/BAPROYLA/control01.ctl,
								/disk_2/app/oracle/oradata/BAPROYLA/control02.ctl,
								/disk_3/app/oracle/oradata/BAPROYLA/control03.ctl)
memory_target=768M">${ORACLE_HOME}/dbs/initbaproyla.ora 

# Solo para comprobar, se puede omitir
# echo "Comprobando creación de archivos"
# ls -l ${ORACLE_HOME}/dbs/*baproyla*


sqlplus /nolog
startup nomount 
create spfile from pfile;