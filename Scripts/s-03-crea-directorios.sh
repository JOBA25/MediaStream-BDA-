# @Autor					Lazaro Martinez Abraham Josue
#									Barcenas Avelar Jorge Octavio
# @Fecha					2/01/2021
# @Descripcion		Creación de los directorios y cambio de permisos
# Función para otorgarle permisos a oracle en las carpetas

function permisos(){
	chown -R oracle:oinstall *
	chmod -R 750 *
}

# Primera ruta
cd /disk_1
if [ -d "app" ]; then
  echo "La carpeta ya existe"	
else
	mkdir -p app/oracle/oradata/BAPROYLA
fi;
permisos

# Segunda ruta
cd /disk_2
if [ -d "app" ]; then
  echo "La carpeta ya existe"	
else
	mkdir -p app/oracle/oradata/BAPROYLA
fi;
permisos

# Tercera ruta
cd /disk_3
if [ -d "app" ]; then
  echo "La carpeta ya existe"	
else
	mkdir -p app/oracle/oradata/BAPROYLA
fi;
permisos

# Cuarta ruta
cd /disk_4
if [ -d "app" ]; then
  echo "La carpeta ya existe"	
else
	mkdir -p app/oracle/oradata/BAPROYLA
fi;
permisos

# Quinta ruta
cd /baproyla_recovery
if [ -d "app" ]; then
  echo "La carpeta ya existe"	
else
	mkdir -p app/oracle/oradata/BAPROYLA
fi;
permisos

# Sexta ruta
cd /baproyla_recovery_2
if [ -d "app" ]; then
  echo "La carpeta ya existe"	
else
	mkdir -p app/oracle/oradata/BAPROYLA
fi;
permisos