# MediaStream-BDA-

### Scripts
|Num. Script|Nombre del script|Descripción|
|:----|:----|:----|
|0|s-00-scripts.sql|Carga DDL y DML para la base de datos|
|1|s-01-crea-directorios.sh|Creación de los directorios para la base de datos
|
|2|s-02-crea-pwd-param.sh|Creación del archivo de parámetros y de passwords|
|3|s-03-crea-directorios.sh|Creación de los directorios y cambio de permisos, función para otorgarle permisos a oracle en las carpetas
|
|4|s-04-crea-db.sql|Creación de la base de datos|
|5|s-05-crea-diccionario-datos.sql|Creación del diccionario de datos|
|6|s-06-crea-tablespaces.sql|Creación de los tablespaces|
|7|s-07-crea-usuarios.sql|Creación de los usuarios|
|8|s-08-crea-objetos-secuencias.sql|Creación de las secuencias utilizadas|
|9|s-09-crea-objetos-tablas.sql|Creacion de tablas|
|10|s-10-crea-objetos-indices.sql|Creacion de indices|
|11|s-11-carga-datos.sql|Carga inicial de datos a las tablas|
|12|s-12-carga-blob.sql|Carga de datos tipo blob|
|13|s-13-activacion-fra.sql|Configuración para habiliar la FRA|
|14|s-14-activacion-archivelog.sql|Habiliar la archivelog mode|
|15|s-15-activacion-conexiones.sql|Configuración de modos de conexión|
|16|s-16-configuraciones-rman.rman|Configuraciones de rman|
|17|s-17-respaldo-inicial.rman|Backup inicial|
|18|s-18-procedimientos-carga.sql|Creación de procedimientos para carga de datos|
|19|s-19-simulacion-1.sql|Simulación de carga de datos y backup|
|20|s-20-simulacion-2.sql|Simulación de carga de datos y backup|
|21|s-21-simulacion-3.sql|Simulación de carga de datos y backup|
|22|s-22-simulacion-4.sql|Simulación de carga de datos y backup|
|23|s-23-simulacion-5.sql|Simulación de carga de datos y backup|
|24|s-24-simulacion-6.sql|Simulación de carga de datos y backup|
|25|s-25-simulacion-7.sql|Simulación de carga de datos y backup|
|26|s-26-backup-nivel-0.rman|Simulación de carga de datos y backup|
|27|s-27-backup-nivel-1.rman|Simulación de carga de datos y backup|
|28|s-28-complete-media-recovery.rman|Comandos para media recovery|
|29|tnsnames.txt|contenido necesario del archivo tnsnames.ora|



### Planeación para crear la nueva base de datos.
| Configuración      | Descripción y/o configuración |
| ----------- | ----------- |
| Número y ubicación de los archivos de control.      | "3 archivos de control  /disk_1/app/oracle/oradata/BAPROYLA/control01.ctl  /disk_2/app/oracle/oradata/BAPROYLA/control02.ctl  /disk_3/app/oracle/oradata/BAPROYLA/control03.ctl"       |
| Propuesta de grupos de REDO   | 3 grupos. Cada grupo con 3 miembros.        |
|Propuesta de juego de caracteres | "character set: AL32UTF8  national character set: AL16UTF16"|
|Tamaño del bloque de datos. | 8192 bytes|
|Lista de parámetros que serán configurados al crear la base de datos. | "db_name= baproyla memory_target = 768M  control_files = /disk_1/app/oracle/oradata/BAPROYLA/control01.ctl,  /disk_2/app/oracle/oradata/BAPROYLA/control02.ctl,  /disk_3/app/oracle/oradata/BAPROYLA/control03.ctl"|
| Archivo de passwords| Se configuró los usarios sys, system, sysbackup|

### Módulos del sistema.
|  Nombre del módulo   | Descripción |Usuario |
| -----------    | ----------------- |----------------- |
| Cliente        | Agrupa objetos relacionados a la administración de los usuarios             |cliente          |
|Multimedia     | Usado para almacenar y administrar los objetos relacionados con el  contenido multimedia              |multimedia             |

### Diseño lógico de la base de datos.
| Nombre de la tabla      | Nombre del módulo |
| ----------- | ----------- |
| PLAN_SUBSCRIPCION_HISTORICO | CLIENTE |
| PLAN_SUBSCRIPCION | CLIENTE |
| TARJETA_CREDITO | CLIENTE |
| CARGO_MENSUAL | CLIENTE |
| USUARIO | CLIENTE |
| DISPOSITIVO | CLIENTE |
|  PLAYLIST| CLIENTE |
| PLAYLIST_USUARIO_COMPARTIDO | CLIENTE |
| PLAYLIST_MULTIMEDIA | CLIENTE |
| REGISTRO_REPRODUCCION |  CLIENTE|
| CONTENIDO_MULTIMEDIA | MULTIMEDIA |
| CALIFICACION | MULTIMEDIA |
| COMENTARIO | MULTIMEDIA |
| GENERO | MULTIMEDIA |
| MULTIMEDIA_AUTOR | MULTIMEDIA |  
| AUTOR | MULTIMEDIA |
| SECCION | MULTIMEDIA |
|  MUSICA| MULTIMEDIA |
| VIDEO | MULTIMEDIA |
| FORMATO_AUDIO | MULTIMEDIA |  
| TIPO_VIDEO | MULTIMEDIA |
|  PROTOCOLO_TRANSMICION| MULTIMEDIA |
| TIPO_TRANSPORTE | MULTIMEDIA |
| CODIFICACION_VIDEO | MULTIMEDIA |

### Esquema de indexado.
|  Nombre de la tabla  | Nombre del índice |tipo | Propósito|
| -----------    | ----------------- |----------------- |--------------- |
| PLAN_SUBSCRIPCION_HISTORICO | PSH_PLAN_SUBSCRIPCION_HISTORICO_ID_UK | UNIQUE | Prevenir repetición de llave primaria|
| PLAN_SUBSCRIPCION_HISTORICO | PSH_PLAN_SUBSCRIPCION_ID_IX | INDICE |Busqueda eficiente por plan de subcripcion|
| PLAN_SUBSCRIPCION | PS_PLAN_SUBSCRIPCION_ID_UK | UNIQUE | Prevenir repetición de llave primaria|
| PLAN_SUBSCRIPCION | PS_CLAVE_UK | UNIQUE |Prevenir repetición |
| TARJETA_CREDITO | TC_TARJETA_CREDITO_ID_UK | UNIQUE | Prevenir repetición de llave primaria|
| TARJETA_CREDITO | TC_USUARIO_ID_UK | UNIQUE | Cumplir con que el usuario solo tenga una tarjeta|
| CARGO_MENSUAL | CARGO_MENSUAL_CARGO_MENSUAL_ID_UK | UNIQUE | Prevenir repetición de llave primaria|
| CARGO_MENSUAL | CARGO_MENSUAL_TARJETA_CREDITO_ID_IX | INDICE | Hacer busquedas eficientes por Tarjeta Credito|
| CARGO_MENSUAL | CARGO_MENSUAL_FOLIO_UK | UNIQUE | Evitar repetición de folio|
| USUARIO | USUARIO_USUARIO_ID_UK | UNIQUE | Evitar repeticion de llave primaria|
| USUARIO | USUARIO_USERNAME_UK | UNIQUE | Evitar repetición|
| USUARIO | USUARIO_EMAIL_UK | UNIQUE | Evitar repetición|
| USUARIO | USUARIO_RFC_UK | UNIQUE | Evitar repetición|
| USUARIO | USUARIO_DUENIO_CUENTA_ID_IX | INDICE | Hacer busquedas eficientes por Usuario|
| USUARIO | USUARIO_PLAN_SUBSCRIPCION_ID_IX | INDICE | Hacer busquedas eficientes por plan de subscripción|
| DISPOSITIVO | DISPOSITIVO_DISPOSITIVO_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| DISPOSITIVO | DISPOSITIVO_USUARIO_ID_IX | INDICE | Hacer busquedas eficientes por Usuario|
| PLAYLIST | PLAYLIST_PLAYLIST_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| PLAYLIST | PLAYLIST_USUARIO_ID_IX | INDICE | Hacer busqedas eficientes por usuario|
| PLAYLIST_USUARIO_COMPARTIDO |  PUC_PLAYLIST_USUARIO_COMPARTIDO_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| PLAYLIST_USUARIO_COMPARTIDO | PUC_PLAYLIST_ID_IX | INDICE | Hacer busquedas eficientes por playlist|
| PLAYLIST_USUARIO_COMPARTIDO | PUC_USUARIO_ID_IX | INDICE | Hacer busquedas eficientes por usuario|
| PLAYLIST_MULTIMEDIA | PM_PLAYLIST_MULTIMEDIA_ID_UK | UNIQUE |Evitar repetición de llave primaria |
| PLAYLIST_MULTIMEDIA |  PM_PLAYLIST_ID_IX|  INDICE| Hacer busquedas eficientes por playlist|
| PLAYLIST_MULTIMEDIA |  PM_CONTENIDO_MULTIMEDIA_ID_IX| INDICE | Hacer busquedas eficientes por contenido multimedia|
| CALIFICACION | CALIFICACION_CALIFICACION_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| CALIFICACION | CALIFICACION_USUARIO_ID_IX |  INDICE|Hacer busquedas eficientes por Usuario |
| CALIFICACION | CALIFICACION_CONTENIDO_MULTIMEDIA_ID_IX | INDICE |Hacer busquedas eficientes por contenido multimedia |
| CONTENIDO_MULTIMEDIA | CM_CONTENIDO_MULTIMEDIA_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| CONTENIDO_MULTIMEDIA | CM_CLAVE_UK | UNIQUE | Evitar repetición|
| CONTENIDO_MULTIMEDIA | CM_GENERO_ID_IX | INDICE | Hacer busquedas eficientes por genero|
| REGISTRO_REPRODUCCION | RP_REGISTRO_REPRODUCCION_ID_UK | UNIQUE | Evitar repeteción de llave primaria|
| REGISTRO_REPRODUCCION |  RR_CONTENIDO_MULTIMEDIA_ID_IX| INDICE | Hacer busquedas eficientes por contenido multimedia|
| REGISTRO_REPRODUCCION | RR_USUARIO_ID_IX | INDICE | Hacer busquedas eficientes por Usuario|
| REGISTRO_REPRODUCCION | RR_DISPOSITIVO_ID_IX | INDICE | Hacer busquedas eficientes por dispositivo|
| GENERO | GENERO_GENERO_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| COMENTARIO | C_COMENTARIO_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| COMENTARIO | C_COMENTARIO_ANTERIOR_ID_IX | INDICE |Hacer busqedas eficientes por comentario |
| COMENTARIO | C_CONTENIDO_MULTIMEDIA_ID_IX | INDICE | Hacer busquedas eficientes por contenido multimedia|
| COMENTARIO | C_USUARIO_ID_IX | INDICE | Hacer busquedas eficientes por Usuario|
| SECCION | S_SECCION_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| SECCION |  S_CONTENIDO_MULTIMEDIA_ID_IX| INDICE |Hacer busquedas eficientes por contenido multimedia |
| MULTIMEDIA_AUTOR | MU_MULTIMEDIA_AUTOR_ID_UK | UNIQUE | Evitar repeticion de llave primaria|
| MULTIMEDIA_AUTOR | MU_AUTOR_ID_IX | INDICE | Hacer busquedas eficientes por autor|
| MULTIMEDIA_AUTOR | MU_CONTENIDO_MULTIMEDIA_ID_IX | INDICE |Hacer busquedas eficientes por contenido multimedia |
| AUTOR | A_AUTOR_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| AUTOR | A_EMAIL_UK | UNIQUE |Evitar repetición |
| MUSICA | M_CONTENIDO_MULTIMEDIA_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| MUSICA | M_FORMATO_AUDIO_ID_IX | INDICE | Hacer busquedas eficientes por formato audio|
| VIDEO | V_CONTENIDO_MULTIMEDIA_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| VIDEO | V_TIPO_VIDEO_ID_IX | INDICE | Hacer busquedas eficientes por tipo video|
| VIDEO | V_CODIFICACION_VIDEO_ID_IX | INDICE |Hacer busquedas eficientes por codificacion video |
| VIDEO | V_TIPO_TRANSPORTE_ID_IX | INDICE | Hacer busquedas eficientes por tipo transporte|
| VIDEO | V_PROTOCOLO_TRANSMICION_ID_IX | INDICE |Hacer busquedas eficientes por potocolo transmicion |
| TIPO_VIDEO | TV_TIPO_VIDEO_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| PROTOCOLO_TRANSMICION | PT_PROTOCOLO_TRANSMICION_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| TIPO_TRANSPORTE | TP_TIPO_TRANSPORTE_ID_UK | UNIQUE | Evitar repetición de llave primaria|
| CODIFICACION_VIDEO | CV_CODIFICACION_VIDEO_ID_UK | UNIQUE |Evitar repetición de llave primaria |
| FORMATO_AUDIO | FA_FORMATO_AUDIO_ID_UK | UNIQUE | Evitar repetición de llave primaria|

### Definición de tablespaces comunes a los módulos
|Nombre del tablespace|Configuración|
|:----|:----|
|system|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/system01.dbf Definición:Big File, 700M de tamaño inicial, autoextend con incrementos de 1024K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|
|sysaux|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/sysaux01.dbf Definición:  550M de tamaño inicial, autoextend con incrementos de 1024K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|
|users|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/users01.dbf Definición: 500M de tamaño inicial, autoextend y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|
|temp|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/temp01.dbf Definición: 100M de tamaño inicial, autoextend con incrementos de 640K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|
|undo|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/undo01.dbf Definición: 200M de tamaño inicial, autoextend con incrementos de 5120K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|

### DISEÑO FÍSICO BÁSICO DE LA BD.
### Definición de tablespaces por módulo

#### Módulo: Cliente
|Nombre del tablespace|Objetivo / Beneficio|Tipo|
|:----|:----|:----|
|cliente_tbs|Separación e independencia de los objetos del usuario cliente|permanente|
|cliente_ix_tbs|Separación de los indices, para un mejor desempeño|permanente|


#### Módulo: Multimedia
|Nombre del tablespace|Objetivo / Beneficio|Tipo|
|:----|:----|:----|
|multimedia_tbs|Separación e independencia de los objetos del usuario multimedia|permanente|
|multimedia_ix_tbs|Separación de los indices, para un mejor desempeño|permanente|
|blob_tbs|Separación de los objetos de tipo blob para mejor desempeño|permanente|

### DISEÑO FÍSICO BÁSICO DE LA BD.
### Configuración de tablespaces por módulo
#### Módulo: Cliente
|Nombre del tablespace|Configuración|
|:----|:----|
|cliente_tbs|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/cliente_df.dbf Definición: Big File, 2G de tamaño inicial, autoextend con incrementos de 512M y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management, online y logging.|
|cliente_ix_tbs|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/cliente_ix_df.dbf Definición: Big File, 128M de tamaño inicial, autoextend con incrementos de 256K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management, online y logging.|


#### Módulo: Multimedia
|Nombre del tablespace|Configuración|
|:----|:----|
|multimedia_tbs|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/multimedia_df.dbf  Definición:Big File, 1024K de tamaño inicial, autoextend con incrementos de 256K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|
|multimedia_ix_tbs|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/multimedia_ix_df.dbf Definición:Big File, 1024K de tamaño inicial, autoextend con incrementos de 8K y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|
|blob_tbs|Ubicación: /disk_4/app/oracle/oradata/BAPROYLA/blob_df.dbf  Definición:Big File, 2G de tamaño inicial, autoextend con incrementos de 512M y tamaño máximo unlimited, Locally Managed tablespace, Automatic Segment Space Management|

### DISEÑO FÍSICO BÁSICO DE LA BD.
### Asignación de tablespace para tablas de cada módulo
#### Módulo: Cliente
|Nombre de la tabla|Nombre del tablespace|
|:----|:----|
|PLAN_SUBSCRIPCION_HISTORICO|cliente_tbs|
|PLAN_SUBSCRIPCION|cliente_tbs|
|TARJETA_CREDITO|cliente_tbs|
|CARGO_MENSUAL|cliente_tbs|
|USUARIO|cliente_tbs|
|DISPOSITIVO|cliente_tbs|
|PLAYLIST|cliente_tbs|
|PLAYLIST_USUARIO_COMPARTIDO|cliente_tbs|
|PLAYLIST_MULTIMEDIA|cliente_tbs|
|REGISTRO_REPRODUCCION|cliente_tbs|

#### Módulo: Multimedia
|Nombre de la tabla|Nombre del tablespace|
|:----|:----|
|CONTENIDO_MULTIMEDIA|multimedia_tbs|
|CALIFICACION|multimedia_tbs|
|COMENTARIO|multimedia_tbs|
|GENERO|multimedia_tbs|
|MULTIMEDIA_AUTOR|multimedia_tbs|
|AUTOR|multimedia_tbs|
|SECCION|multimedia_tbs|
|MUSICA|multimedia_tbs|
|VIDEO|multimedia_tbs|
|FORMATO_AUDIO|multimedia_tbs|
|TIPO_VIDEO|multimedia_tbs|
|PROTOCOLO_TRANSMICION|multimedia_tbs|
|TIPO_TRANSPORTE|multimedia_tbs|
|CODIFICACION_VIDEO|multimedia_tbs|

### DISEÑO FÍSICO BÁSICO DE LA BD.
### Asignación de tablespace para índices de cada módulo.
#### Módulo: Cliente
|Nombre del índice|Tipo de índice|Nombre de la tabla|Nombre de la columna|Nombre del tablespace|
|:----|:----|:----|:----|:----|
|PSH_PLAN_SUBSCRIPCION_HISTORICO_ID_UK|UNIQUE|PLAN_SUBSCRIPCION_HISTORICO|PLAN_SUBSCRIPCION_HISTORICO_ID|cliente_ix_tbs|
|PSH_PLAN_SUBSCRIPCION_ID_IX|INDICE|PLAN_SUBSCRIPCION_HISTORICO|PLAN_SUBSCRIPCION_ID|cliente_ix_tbs|
|PS_PLAN_SUBSCRIPCION_ID_UK|UNIQUE|PLAN_SUBSCRIPCION|PLAN_SUBSCRIPCION_ID|cliente_ix_tbs|
|PS_CLAVE_UK|UNIQUE|PLAN_SUBSCRIPCION|CLAVE|cliente_ix_tbs|
|TC_TARJETA_CREDITO_ID_UK|UNIQUE|TARJETA_CREDITO|TARJETA_CREDITO_ID|cliente_ix_tbs|
|TC_USUARIO_ID_UK|UNIQUE|TARJETA_CREDITO|USUARIO_ID|cliente_ix_tbs|
|CARGO_MENSUAL_CARGO_MENSUAL_ID_UK|UNIQUE|CARGO_MENSUAL|CARGO_MENSUAL_ID|cliente_ix_tbs|
|CARGO_MENSUAL_TARJETA_CREDITO_ID_IX|INDICE|CARGO_MENSUAL|TARJETA_CREDITO_ID|cliente_ix_tbs|
|CARGO_MENSUAL_FOLIO_UK|UNIQUE|CARGO_MENSUAL|FOLIO|cliente_ix_tbs|
|USUARIO_USUARIO_ID_UK|UNIQUE|USUARIO|USUARIO_ID|cliente_ix_tbs|
|USUARIO_USERNAME_UK|UNIQUE|USUARIO|USERNAME|cliente_ix_tbs|
|USUARIO_EMAIL_UK|UNIQUE|USUARIO|EMAIL|cliente_ix_tbs|
|USUARIO_RFC_UK|UNIQUE|USUARIO|RFC|cliente_ix_tbs|
|USUARIO_DUENIO_CUENTA_ID_IX|INDICE|USUARIO|DUENIO_CUENTA_ID|cliente_ix_tbs|
|USUARIO_PLAN_SUBSCRIPCION_ID_IX|INDICE|USUARIO|PLAN_SUBSCRIPCION_ID|cliente_ix_tbs|
|DISPOSITIVO_DISPOSITIVO_ID_UK|UNIQUE|DISPOSITIVO|DISPOSITIVO_ID|cliente_ix_tbs|
|DISPOSITIVO_USUARIO_ID_IX|INDICE|DISPOSITIVO|USUARIO_ID|cliente_ix_tbs|
|PLAYLIST_PLAYLIST_ID_UK|UNIQUE|PLAYLIST|PLAYLIST_ID|cliente_ix_tbs|
|PLAYLIST_USUARIO_ID_IX|INDICE|PLAYLIST|USUARIO_ID|cliente_ix_tbs|
|PUC_PLAYLIST_USUARIO_COMPARTIDO_ID_UK|UNIQUE|PLAYLIST_USUARIO_COMPARTIDO|PLAYLIST_USUARIO_COMPARTIDO_ID|cliente_ix_tbs|
|PUC_PLAYLIST_ID_IX|INDICE|PLAYLIST_USUARIO_COMPARTIDO|PLAYLIST_ID|cliente_ix_tbs|
|PUC_USUARIO_ID_IX|INDICE|PLAYLIST_USUARIO_COMPARTIDO|USUARIO_ID|cliente_ix_tbs|
|PM_PLAYLIST_MULTIMEDIA_ID_UK|UNIQUE|PLAYLIST_MULTIMEDIA|PLAYLIST_MULTIMEDIA_ID|cliente_ix_tbs|
|PM_PLAYLIST_ID_IX|INDICE|PLAYLIST_MULTIMEDIA|PLAYLIST_ID|cliente_ix_tbs|
|PM_CONTENIDO_MULTIMEDIA_ID_IX|INDICE|PLAYLIST_MULTIMEDIA|CONTENIDO_MULTIMEDIA_ID|cliente_ix_tbs|
|RR_CONTENIDO_MULTIMEDIA_ID_IX|INDICE|REGISTRO_REPRODUCCION|CONTENIDO_MULTIMEDIA_ID|cliente_ix_tbs|
|RR_USUARIO_ID_IX|INDICE|REGISTRO_REPRODUCCION|USUARIO_ID|cliente_ix_tbs|
|RR_DISPOSITIVO_ID|INDICE|REGISTRO_REPRODUCCION|DISPOSITIVO_ID|cliente_ix_tbs|

#### Módulo: Multimedia
|Nombre del índice|Tipo de índice|Nombre de la tabla|Nombre de la columna|Nombre del tablespace|
|:----|:----|:----|:----|:----|
|CALIFICACION_CALIFICACION_ID_UK|UNIQUE|CALIFICACION|CALIFICACION_ID|multimedia_ix_tbs|
|CALIFICACION_USUARIO_ID_IX|INDICE|CALIFICACION|USUARIO_ID|multimedia_ix_tbs|
|CALIFICACION_CONTENIDO_MULTIMEDIA_ID_IX|INDICE|CALIFICACION|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|CM_CONTENIDO_MULTIMEDIA_ID_UK|UNIQUE|CONTENIDO_MULTIMEDIA|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|CM_CLAVE_UK|UNIQUE|CONTENIDO_MULTIMEDIA|CLAVE|multimedia_ix_tbs|
|CM_GENERO_ID_IX|INDICE|CONTENIDO_MULTIMEDIA|GENERO_ID|multimedia_ix_tbs|
|RP_REGISTRO_REPRODUCCION_ID_UK|UNIQUE|REGISTRO_REPRODUCCION|REGISTRO_REPRODUCCION_ID|multimedia_ix_tbs|
|GENERO_GENERO_ID_UK|UNIQUE|GENERO|GENERO_ID|multimedia_ix_tbs|
|C_COMENTARIO_ID_UK|UNIQUE|COMENTARIO|COMENTARIO_ID|multimedia_ix_tbs|
|C_COMENTARIO_ANTERIOR_ID_IX|INDICE|COMENTARIO|COMENTARIO_ANTERIOR_ID|multimedia_ix_tbs|
|C_CONTENIDO_MULTIMEDIA_ID_IX|INDICE|COMENTARIO|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|C_USUARIO_ID_UK|INDICE|COMENTARIO|USUARIO_ID|multimedia_ix_tbs|
|S_SECCION_ID_UK|UNIQUE|SECCION|SECCION_ID|multimedia_ix_tbs|
|S_CONTENIDO_MULTIMEDIA_ID_UK|INDICE|SECCION|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|MU_MULTIMEDIA_AUTOR_ID_UK|UNIQUE|MULTIMEDIA_AUTOR|MULTIMEDIA_AUTOR_ID|multimedia_ix_tbs|
|MU_AUTOR_ID_IX|INDICE|MULTIMEDIA_AUTOR|AUTOR_ID|multimedia_ix_tbs|
|MU_CONTENIDO_MULTIMEDIA_ID_IX|INDICE|MULTIMEDIA_AUTOR|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|A_AUTOR_ID_UK|UNIQUE|AUTOR|AUTOR_ID|multimedia_ix_tbs|
|A_EMAIL_UK|UNIQUE|AUTOR|EMAIL|multimedia_ix_tbs|
|M_CONTENIDO_MULTIMEDIA_ID_UK|UNIQUE|MUSICA|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|FA_FORMATO_AUDIO_ID_IX|INDICE|MUSICA|FORMATO_AUDIO_ID|multimedia_ix_tbs|
|V_CONTENIDO_MULTIMEDIA_ID_UK|UNIQUE|VIDEO|CONTENIDO_MULTIMEDIA_ID|multimedia_ix_tbs|
|V_TIPO_VIDEO_ID_IX|INDICE|VIDEO|TIPO_VIDEO_ID|multimedia_ix_tbs|
|V_CODIFICACION_VIDEO_ID_IX|INDICE|VIDEO|CODIFICACION_VIDEO_ID|multimedia_ix_tbs|
|V_TIPO_TRANSPORTE_ID_IX|INDICE|VIDEO|TIPO_TRANSPORTE_ID|multimedia_ix_tbs|
|V_PROTOCOLO_TRANSMICION_ID_IX|INDICE|VIDEO|PROTOCOLO_TRANSMICION_ID|multimedia_ix_tbs|
|TV_TIPO_VIDEO_ID_UK|UNIQUE|TIPO_VIDEO|TIPO_VIDEO_ID|multimedia_ix_tbs|
|PT_CODIFICACION_VIDEO_ID_UK|UNIQUE|PROTOCOLO_TRANSMICION|CODIFICACION_VIDEO_ID|multimedia_ix_tbs|
|TP_TIPO_TRANSPORTE_ID_UK|UNIQUE|TIPO_TRANSPORTE|TIPO_TRANSPORTE_ID|multimedia_ix_tbs|
|CV_PROTOCOLO_TRANSMICION_ID_UK|UNIQUE|CODIFICACION_VIDEO|PROTOCOLO_TRANSMICION_ID|multimedia_ix_tbs|
|FA_FORMATO_AUDIO_ID_UK|UNIQUE|FORMATO_AUDIO|FORMATO_AUDIO_ID|multimedia_ix_tbs|

### DISEÑO FÍSICO BÁSICO DE LA BD.
### Asignación de tablespaces para columnas CLOB/BLOB de cada módulo.
#### Módulo: Multimedia
|Nombre de la columna CLOB/BLOB|Nombre de índice asociado a la columna CLOB/BLOB|Nombre de la tabla|Nombre del tablespace para la columna CLOB/BLOB|Nombre del tablespace para el índice de la columna  CLOB/BLOB|
|:----|:----|:----|:----|:----|
|contenido|SECCION_CONTENIDO_IX|SECCION|blob_tbs|blob_tbs|

### Simulación de carga diaria
|Fecha y hora|Datos REDO producidos (MB)|Fecha de Respaldo|Tipo de backup|Espacio requerido por el backup|
|:---:|:---:|:---:|:---:|:---:|
|11/01/2022|17|11/01/2022|0|942MB|
|13/01/2022|79|13/01/2022|1|385MB|
|15/01/2022|79|15/01/2022|1|1MB|
|16/01/2022|38|16/01/2022|1|82MB|
|17/01/2022|38|17/01/2022|1|62MB|
|18/01/2022|38|18/01/2022|1|35MB|
|19/01/2022|38|19/01/2022|1|12MB|
|20/01/2022|38|20/01/2022|0|20MB|

