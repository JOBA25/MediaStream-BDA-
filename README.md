# MediaStream-BDA-

### Scripts
|  Num. Script   | Nombre del script |Descripción |
| -----------    | ----------------- |----------------- |
| 1         | Title             |Title             |
| 2      | Text              |Text              |
| 3         | Title             |Title             |
| 4      | Text              |Text              |
| 5         | Title             |Title             |
| 6      | Text              |Text              |
| 7         | Title             |Title             |
| 8      | Text              |Text              |



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
|  Nombre de la tabla  | Nombre del índice |tipo |
| -----------    | ----------------- |----------------- |
| PLAN_SUBSCRIPCION_HISTORICO | PSH_PLAN_SUBSCRIPCION_HISTORICO_ID_UK | UNIQUE |
| PLAN_SUBSCRIPCION_HISTORICO | PSH_PLAN_SUBSCRIPCION_ID_IX | INDICE |
| PLAN_SUBSCRIPCION | PS_PLAN_SUBSCRIPCION_ID_UK | UNIQUE |
| PLAN_SUBSCRIPCION | PS_CLAVE_UK | UNIQUE |
| TARJETA_CREDITO | TC_TARJETA_CREDITO_ID_UK | UNIQUE |
| TARJETA_CREDITO | TC_USUARIO_ID_UK | UNIQUE |
| CARGO_MENSUAL | CARGO_MENSUAL_CARGO_MENSUAL_ID_UK | UNIQUE |
| CARGO_MENSUAL | CARGO_MENSUAL_TARJETA_CREDITO_ID_IX | INDICE |
| CARGO_MENSUAL | CARGO_MENSUAL_FOLIO_UK | UNIQUE |
| USUARIO | USUARIO_USUARIO_ID_UK | UNIQUE |
| USUARIO | USUARIO_USERNAME_UK | UNIQUE |
| USUARIO | USUARIO_EMAIL_UK | UNIQUE |
| USUARIO | USUARIO_RFC_UK | UNIQUE |
| USUARIO | USUARIO_DUENIO_CUENTA_ID_IX | INDICE |
| USUARIO | USUARIO_PLAN_SUBSCRIPCION_ID_IX | INDICE |
| DISPOSITIVO | DISPOSITIVO_DISPOSITIVO_ID_UK | UNIQUE |
| DISPOSITIVO | DISPOSITIVO_USUARIO_ID_IX | INDICE |
| PLAYLIST | PLAYLIST_PLAYLIST_ID_UK | UNIQUE |
| PLAYLIST | PLAYLIST_USUARIO_ID_IX | INDICE |
| PLAYLIST_USUARIO_COMPARTIDO | PUC_PLAYLIST_USUARIO_COMPARTIDO_ID_UK | UNIQUE |
| PLAYLIST_USUARIO_COMPARTIDO | PUC_PLAYLIST_ID_IX | INDICE |
| PLAYLIST_USUARIO_COMPARTIDO | PUC_USUARIO_ID_IX | INDICE |
| PLAYLIST_MULTIMEDIA | PM_PLAYLIST_MULTIMEDIA_ID_UK | UNIQUE |
| PLAYLIST_MULTIMEDIA |  PM_PLAYLIST_ID_IX|  INDICE|
| PLAYLIST_MULTIMEDIA |  PM_CONTENIDO_MULTIMEDIA_ID_IX| INDICE |
| CALIFICACION | CALIFICACION_CALIFICACION_ID_UK | UNIQUE |
| CALIFICACION | CALIFICACION_USUARIO_ID_IX |  INDICE|
| CALIFICACION | CALIFICACION_CONTENIDO_MULTIMEDIA_ID_IX | INDICE |
| CONTENIDO_MULTIMEDIA | CM_CONTENIDO_MULTIMEDIA_ID_UK | UNIQUE |
| CONTENIDO_MULTIMEDIA | CM_CLAVE_UK | UNIQUE |
| CONTENIDO_MULTIMEDIA | CM_GENERO_ID_IX | INDICE |
| REGISTRO_REPRODUCCION | RP_REGISTRO_REPRODUCCION_ID_UK | UNIQUE |
| REGISTRO_REPRODUCCION |  RR_CONTENIDO_MULTIMEDIA_ID_IX| INDICE |
| REGISTRO_REPRODUCCION | RR_USUARIO_ID_IX | INDICE |
| REGISTRO_REPRODUCCION | RR_DISPOSITIVO_ID_IX | INDICE |
| GENERO | GENERO_GENERO_ID_UK | UNIQUE |
| COMENTARIO | C_COMENTARIO_ID_UK | UNIQUE |
| COMENTARIO | C_COMENTARIO_ANTERIOR_ID_IX | INDICE |
| COMENTARIO | C_CONTENIDO_MULTIMEDIA_ID_IX | INDICE |
| COMENTARIO | C_USUARIO_ID_IX | INDICE |
| SECCION | S_SECCION_ID_UK | UNIQUE |
| SECCION |  S_CONTENIDO_MULTIMEDIA_ID_IX| INDICE |
| MULTIMEDIA_AUTOR | MU_MULTIMEDIA_AUTOR_ID_UK | UNIQUE |
| MULTIMEDIA_AUTOR | MU_AUTOR_ID_IX | INDICE |
| MULTIMEDIA_AUTOR | MU_CONTENIDO_MULTIMEDIA_ID_IX | INDICE |
| AUTOR | A_AUTOR_ID_UK | UNIQUE |
| AUTOR | A_EMAIL_UK | UNIQUE |
| MUSICA | M_CONTENIDO_MULTIMEDIA_ID_UK | UNIQUE |
| MUSICA | M_FORMATO_AUDIO_ID_IX | INDICE |
| VIDEO | V_CONTENIDO_MULTIMEDIA_ID_UK | UNIQUE |
| VIDEO | V_TIPO_VIDEO_ID_IX | INDICE |
| VIDEO | V_CODIFICACION_VIDEO_ID_IX | INDICE |
| VIDEO | V_TIPO_TRANSPORTE_ID_IX | INDICE |
| VIDEO | V_PROTOCOLO_TRANSMICION_ID_IX | INDICE |
| TIPO_VIDEO | TV_TIPO_VIDEO_ID_UK | UNIQUE |
| PROTOCOLO_TRANSMICION | PT_PROTOCOLO_TRANSMICION_ID_UK | UNIQUE |
| TIPO_TRANSPORTE | TP_TIPO_TRANSPORTE_ID_UK | UNIQUE |
| CODIFICACION_VIDEO | CV_CODIFICACION_VIDEO_ID_UK | UNIQUE |
| FORMATO_AUDIO | FA_FORMATO_AUDIO_ID_UK | UNIQUE |

