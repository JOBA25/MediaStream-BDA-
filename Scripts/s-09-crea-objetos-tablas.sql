-- @Autor:                  Barcenas Avelar Jorge Octavio - 
--                          Abraham Josué Lazaro Martínez
-- @Fecha creación:         05/01/2022
-- @Descripción:            Creacion de tablas

connect sys/system as sysdba 

whenever sqlerror exit rollback;

-- 
-- TABLE: TIPO_VIDEO 
--

CREATE TABLE MULTIMEDIA.TIPO_VIDEO(
    TIPO_VIDEO_ID    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION      VARCHAR2(50)     NOT NULL,
    CONSTRAINT TIPO_VIDEO_PK PRIMARY KEY (TIPO_VIDEO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.TV_TIPO_VIDEO_ID_UK
        ON  MULTIMEDIA.TIPO_VIDEO(TIPO_VIDEO_ID)
        TABLESPACE MULTIMEDIA_IX_TBS 
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: PROTOCOLO_TRANSMICION 
--

CREATE TABLE MULTIMEDIA.PROTOCOLO_TRANSMICION(
    PROTOCOLO_TRANSMICION_ID    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION                 VARCHAR2(5)      NOT NULL,
    CONSTRAINT PROTOCOLO_TRANSMICION_PK PRIMARY KEY (PROTOCOLO_TRANSMICION_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.PT_PROTOCOLO_TRANSMICION_ID_UK
        ON  MULTIMEDIA.PROTOCOLO_TRANSMICION(PROTOCOLO_TRANSMICION_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: TIPO_TRANSPORTE 
--

CREATE TABLE MULTIMEDIA.TIPO_TRANSPORTE(
    TIPO_TRANSPORTE_ID    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION           VARCHAR2(5)      NOT NULL,
    CONSTRAINT TIPO_TRANSPORTE_PK PRIMARY KEY (TIPO_TRANSPORTE_ID)
    USING INDEX(
        CREATE UNIQUE INDEX MULTIMEDIA.TP_TIPO_TRANSPORTE_ID_UK
        ON  MULTIMEDIA.TIPO_TRANSPORTE(TIPO_TRANSPORTE_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: CODIFICACION_VIDEO 
--

CREATE TABLE MULTIMEDIA.CODIFICACION_VIDEO(
    CODIFICACION_VIDEO_ID    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION              VARCHAR2(10)         NOT NULL,
    CONSTRAINT CODIFICACION_VIDEO_PK PRIMARY KEY (CODIFICACION_VIDEO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.CV_CODIFICACION_VIDEO_ID_UK
        ON  MULTIMEDIA.CODIFICACION_VIDEO(CODIFICACION_VIDEO_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: FORMATO_AUDIO 
--

CREATE TABLE MULTIMEDIA.FORMATO_AUDIO(
    FORMATO_AUDIO_ID    NUMBER(10, 0)    NOT NULL,
    EXTENSION           VARCHAR2(5)      NOT NULL,
    DESCRIPCION         VARCHAR2(100)    NOT NULL,
    CONSTRAINT FORMATO_AUDIO_PK PRIMARY KEY (FORMATO_AUDIO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.FA_FORMATO_AUDIO_ID_UK
        ON  MULTIMEDIA.FORMATO_AUDIO(FORMATO_AUDIO_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: PLAN_SUBSCRIPCION 
--

CREATE TABLE CLIENTE.PLAN_SUBSCRIPCION(
    PLAN_SUBSCRIPCION_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE                   VARCHAR2(10)     NOT NULL,
    NOMBRE                  VARCHAR2(200)    NOT NULL,
    COSTO                   NUMBER(5, 2)     NOT NULL,
    DESCRIPCION             VARCHAR2(300)    NOT NULL,
    CONSTRAINT PLAN_SUBSCRIPCION_PK PRIMARY KEY (PLAN_SUBSCRIPCION_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.PS_PLAN_SUBSCRIPCION_ID_UK
        ON  CLIENTE.PLAN_SUBSCRIPCION(PLAN_SUBSCRIPCION_ID)
        TABLESPACE CLIENTE_IX_TBS
    )
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: PLAN_SUBSCRIPCION_HISTORICO 
--

CREATE TABLE CLIENTE.PLAN_SUBSCRIPCION_HISTORICO(
    PLAN_SUBSCRIPCION_HISTORICO_ID    NUMBER(10, 0)    NOT NULL,
    COSTO                             NUMBER(5, 2)     NOT NULL,
    FECHA_INICIO                      DATE     NOT NULL,
    FECHA_TERMINO                     DATE     NOT NULL,
    PLAN_SUBSCRIPCION_ID              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAN_SUBSCRIPCION_HISTORICO_PK PRIMARY KEY (PLAN_SUBSCRIPCION_HISTORICO_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.PSH_PLAN_SUBSCRIPCION_HISTORICO_ID_UK
        ON  CLIENTE.PLAN_SUBSCRIPCION_HISTORICO(PLAN_SUBSCRIPCION_HISTORICO_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT PSH_PLAN_SUBSCRIPCION_ID_FK
    FOREIGN KEY (PLAN_SUBSCRIPCION_ID)
    REFERENCES CLIENTE.PLAN_SUBSCRIPCION(PLAN_SUBSCRIPCION_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: GENERO 
--

CREATE TABLE MULTIMEDIA.GENERO(
    GENERO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE       VARCHAR2(100)    NOT NULL,
    CONSTRAINT GENERO_PK PRIMARY KEY (GENERO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.GENERO_GENERO_ID_UK
        ON  MULTIMEDIA.GENERO(GENERO_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: AUTOR 
--

CREATE TABLE MULTIMEDIA.AUTOR(
    AUTOR_ID            NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(100)    NOT NULL,
    APELLIDO_PATERNO    VARCHAR2(100)    NOT NULL,
    APELLIDO_MATERNO    VARCHAR2(100),
    EMAIL               VARCHAR2(100),
    NOMBRE_ARTISTICO    VARCHAR2(100)    NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.A_AUTOR_ID_UK ON MULTIMEDIA.AUTOR(AUTOR_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: USUARIO 
--

CREATE TABLE CLIENTE.USUARIO(
    USUARIO_ID                  NUMBER(10, 0)    NOT NULL,
    USERNAME                    VARCHAR2(100)    NOT NULL,
    PASSWORD                    VARCHAR2(30)     NOT NULL,
    EMAIL                       VARCHAR2(100)    NOT NULL,
    NOMBRE                      VARCHAR2(100)    NOT NULL,
    APELLIDO_PATERNO            VARCHAR2(100)    NOT NULL,
    APELLIDO_MATERNO            VARCHAR2(100),
    RFC                         VARCHAR2(13),
    USUARIO_DUENIO_CUENTA_ID    NUMBER(10, 0),
    PLAN_SUBSCRIPCION_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT USUARIO_PK PRIMARY KEY (USUARIO_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.USUARIO_USUARIO_ID_UK
        ON  CLIENTE.USUARIO(USUARIO_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT USUARIO_PLAN_SUBSCRIPCION_ID_FK 
    FOREIGN KEY (PLAN_SUBSCRIPCION_ID)
    REFERENCES CLIENTE.PLAN_SUBSCRIPCION(PLAN_SUBSCRIPCION_ID),
    CONSTRAINT USUARIO_USUARIO_DUENIO_CUENTA_ID_FK
    FOREIGN KEY (USUARIO_DUENIO_CUENTA_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: TARJETA_CREDITO 
--

CREATE TABLE CLIENTE.TARJETA_CREDITO(
    TARJETA_CREDITO_ID    NUMBER(10, 0)    NOT NULL,
    NUMERO                NUMBER(19, 0)    NOT NULL,
    TIPO                  VARCHAR2(1)      NOT NULL,
    NUMERO_SEGURIDAD      NUMBER(3, 0)     NOT NULL,
    ANIO_VIGENCIA         NUMBER(4, 0)     NOT NULL,
    MES_VIGENCIA          NUMBER(2, 0)     NOT NULL,
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT TARJETA_CREDITO_PK PRIMARY KEY (TARJETA_CREDITO_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.TC_TARJETA_CREDITO_ID_UK
        ON CLIENTE.TARJETA_CREDITO(TARJETA_CREDITO_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT TARJETA_CREDITO_USUARIO_ID_FK
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: CARGO_MENSUAL 
--

CREATE TABLE CLIENTE.CARGO_MENSUAL(
    CARGO_MENSUAL_ID      NUMBER(10, 0)    NOT NULL,
    FECHA_CARGO           DATE     NOT NULL,
    IMPORTE               NUMBER(5, 2)     NOT NULL,
    FOLIO                 VARCHAR2(20)     NOT NULL,
    TARJETA_CREDITO_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CARGO_MENSUAL_PK PRIMARY KEY (CARGO_MENSUAL_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.CM_CARGO_MENSUAL_ID_UK 
        ON CLIENTE.CARGO_MENSUAL(CARGO_MENSUAL_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT CARGO_MENSUAL_TARJETA_CREDITO_ID_FK 
    FOREIGN KEY (TARJETA_CREDITO_ID)
    REFERENCES CLIENTE.TARJETA_CREDITO(TARJETA_CREDITO_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: DISPOSITIVO 
--

CREATE TABLE CLIENTE.DISPOSITIVO(
    DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    TIPO              VARCHAR2(20)     NOT NULL,
    IP                VARCHAR2(40),
    SO                VARCHAR2(30)     NOT NULL,
    NOMBRE            VARCHAR2(50)     NOT NULL,
    MARCA             VARCHAR2(50)     NOT NULL,
    USUARIO_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT DISPOSITIVO_PK PRIMARY KEY (DISPOSITIVO_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.DISPOSITIVO_DISPOSITIVO_ID_UK
        ON CLIENTE.DISPOSITIVO(DISPOSITIVO_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT DISPOSITIVO_USUARIO_ID_FK
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: CONTENIDO_MULTIMEDIA 
--

CREATE TABLE MULTIMEDIA.CONTENIDO_MULTIMEDIA(
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)     NOT NULL,
    CLAVE                      VARCHAR2(16)      NOT NULL,
    NOMBRE                     VARCHAR2(200)     NOT NULL,
    TOTAL_REPRODUCCIONES       NUMBER(38, 0)     NOT NULL, -- NO DEJA PONER 100
    DURACION                   NUMBER(6, 0)      NOT NULL,
    TIPO                       CHAR(1)           NOT NULL,
    GENERO_ID                  NUMBER(10, 0)     NOT NULL,
    CONSTRAINT CONTENIDO_MULTIMEDIA_PK PRIMARY KEY (CONTENIDO_MULTIMEDIA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.CM_CONTENIDO_MULTIMEDIA_ID_UK
        ON  MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    ),
    CONSTRAINT CM_GENERO_ID_FK 
    FOREIGN KEY (GENERO_ID)
    REFERENCES MULTIMEDIA.GENERO(GENERO_ID),
    CONSTRAINT MULTIMEDIA_TIPO_CHK CHECK (TIPO IN ('V','M'))
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: MUSICA 
--

CREATE TABLE MULTIMEDIA.MUSICA(
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)     NOT NULL,
    LETRA_AUDIO                VARCHAR2(1000)    NOT NULL,
    KBPS                       NUMBER(8, 2)      NOT NULL,
    FORMATO_AUDIO_ID           NUMBER(10, 0)     NOT NULL,
    CONSTRAINT MUSICA_PK PRIMARY KEY (CONTENIDO_MULTIMEDIA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.M_CONTENIDO_MULTIMEDIA_ID_PK
        ON  MULTIMEDIA.MUSICA(CONTENIDO_MULTIMEDIA_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    ),
    CONSTRAINT MUSICA_CONTENIDO_MULTIMEDIA_ID_FK
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID),
    CONSTRAINT MUSICA_FORMATO_AUDIO_ID_FK
    FOREIGN KEY (FORMATO_AUDIO_ID)
    REFERENCES MULTIMEDIA.FORMATO_AUDIO(FORMATO_AUDIO_ID)
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: VIDEO 
--

CREATE TABLE MULTIMEDIA.VIDEO(
    CONTENIDO_MULTIMEDIA_ID     NUMBER(10, 0)    NOT NULL,
    CLASIFICACION               VARCHAR2(1)      NOT NULL,
    TIPO_VIDEO_ID               NUMBER(10, 0)    NOT NULL,
    CODIFICACION_VIDEO_ID       NUMBER(10, 0)    NOT NULL,
    TIPO_TRANSPORTE_ID          NUMBER(10, 0)    NOT NULL,
    PROTOCOLO_TRANSMICION_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT VIDEO_PK PRIMARY KEY (CONTENIDO_MULTIMEDIA_ID)
    USING INDEX(
        CREATE UNIQUE INDEX MULTIMEDIA.V_CONTENIDO_MULTIMEDIA_ID_UK
        ON  MULTIMEDIA.VIDEO(CONTENIDO_MULTIMEDIA_ID)
        TABLESPACE MULTIMEDIA_IX_TBS 
    ),
    CONSTRAINT VIDEO_CONTENIDO_MULTIMEDIA_ID_FK
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID),
    CONSTRAINT VIDEO_TIPO_VIDEO_ID_FK
    FOREIGN KEY (TIPO_VIDEO_ID)
    REFERENCES MULTIMEDIA.TIPO_VIDEO(TIPO_VIDEO_ID),
    CONSTRAINT VIDEO_CODIFICACION_VIDEO_ID_FK
    FOREIGN KEY (CODIFICACION_VIDEO_ID)
    REFERENCES MULTIMEDIA.CODIFICACION_VIDEO(CODIFICACION_VIDEO_ID),
    CONSTRAINT VIDEO_TIPO_TRANSPORTE_ID_FK
    FOREIGN KEY (TIPO_TRANSPORTE_ID)
    REFERENCES MULTIMEDIA.TIPO_TRANSPORTE(TIPO_TRANSPORTE_ID),
    CONSTRAINT VIDEO_PROTOCOLO_TRANSMICION_ID_FK
    FOREIGN KEY (PROTOCOLO_TRANSMICION_ID)
    REFERENCES MULTIMEDIA.PROTOCOLO_TRANSMICION(PROTOCOLO_TRANSMICION_ID)
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: SECCION 
--

CREATE TABLE MULTIMEDIA.SECCION(
    SECCION_ID                 NUMBER(10, 0)    NOT NULL,
    SECUENCIA_ID               NUMBER(3, 0)     NOT NULL,
    CONTENIDO                  BLOB             NOT NULL,
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT SECCION_PK PRIMARY KEY (SECCION_ID)
    USING INDEX(
        CREATE UNIQUE INDEX MULTIMEDIA.S_SECCION_ID_UK
        ON  MULTIMEDIA.SECCION(SECCION_ID)
        TABLESPACE MULTIMEDIA_IX_TBS 
    ),
    CONSTRAINT SECCION_CONTENIDO_MULTIMEDIA_ID_FK
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID)
) TABLESPACE MULTIMEDIA_TBS LOB (CONTENIDO) STORE AS (TABLESPACE blob_tbs)
;

-- 
-- TABLE: PLAYLIST 
--

CREATE TABLE CLIENTE.PLAYLIST(
    PLAYLIST_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE         VARCHAR2(50)     NOT NULL,
    USUARIO_ID     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_PK PRIMARY KEY (PLAYLIST_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.PLAYLIST_PLAYLIST_ID_UK
        ON  CLIENTE.PLAYLIST(PLAYLIST_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT PLAYLIST_USUARIO_ID_FK
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: PLAYLIST_MULTIMEDIA 
--

GRANT SELECT ON MULTIMEDIA.CONTENIDO_MULTIMEDIA TO CLIENTE;
GRANT REFERENCES (CONTENIDO_MULTIMEDIA_ID) ON MULTIMEDIA.CONTENIDO_MULTIMEDIA TO CLIENTE; 

CREATE TABLE CLIENTE.PLAYLIST_MULTIMEDIA(
    PLAYLIST_MULTIMEDIA_ID     NUMBER(10, 0)    NOT NULL,
    PLAYLIST_ID                NUMBER(10, 0)    NOT NULL,
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_MULTIMEDIA_PK PRIMARY KEY (PLAYLIST_MULTIMEDIA_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.PM_PLAYLIST_MULTIMEDIA_ID_UK
        ON  CLIENTE.PLAYLIST_MULTIMEDIA(PLAYLIST_MULTIMEDIA_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT PLAYLIST_MULTIMEDIA_PLAYLIST_ID_FK 
    FOREIGN KEY (PLAYLIST_ID)
    REFERENCES CLIENTE.PLAYLIST(PLAYLIST_ID),
    CONSTRAINT PLAYLIST_MULTIMEDIA_CONTENIDO_MULTIMEDIA_ID_FK
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: PLAYLIST_USUARIO_COMPARTIDO 
--

CREATE TABLE CLIENTE.PLAYLIST_USUARIO_COMPARTIDO(
    PLAYLIST_USUARIO_COMPARTIDO_ID    NUMBER(10, 0)    NOT NULL,
    PLAYLIST_ID                       NUMBER(10, 0)    NOT NULL,
    USUARIO_ID                        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_USUARIO_COMPARTIDO_PK PRIMARY KEY (PLAYLIST_USUARIO_COMPARTIDO_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.PUC_PLAYLIST_USUARIO_COMPARTIDO_ID_UK
        ON  CLIENTE.PLAYLIST_USUARIO_COMPARTIDO(PLAYLIST_USUARIO_COMPARTIDO_ID)
        TABLESPACE CLIENTE_IX_TBS
    ),
    CONSTRAINT PLAYLIST_USUARIO_COMPARTIDO_PLAYLIST_ID_FK 
    FOREIGN KEY (PLAYLIST_ID)
    REFERENCES CLIENTE.PLAYLIST(PLAYLIST_ID),
    CONSTRAINT PLAYLIST_USUARIO_COMPARTIDO_USUARIO_ID_FK 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID)
) TABLESPACE CLIENTE_TBS
;

-- 
-- TABLE: CALIFICACION 
--
GRANT SELECT ON CLIENTE.USUARIO TO MULTIMEDIA;
GRANT REFERENCES (USUARIO_ID) ON CLIENTE.USUARIO TO MULTIMEDIA; 

CREATE TABLE MULTIMEDIA.CALIFICACION(
    CALIFICACION_ID            NUMBER(10, 0)    NOT NULL,
    CALIFICACION               NUMBER(1, 0)     NOT NULL,
    USUARIO_ID                 NUMBER(10, 0)    NOT NULL,
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CALIFICACION_PK PRIMARY KEY (CALIFICACION_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.CALIFICACION_CALIFICACION_ID_UK 
        ON MULTIMEDIA.CALIFICACION(CALIFICACION_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    ),
    CONSTRAINT CALIFICACION_USUARIO_ID_FK 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT CALIFICACION_CONTENIDO_MULTIMEDIA_ID_FK 
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID),
    CONSTRAINT CALIFICACION_CALIFICACION_CHK CHECK (CALIFICACION IN (1,2,3,4,5))
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: COMENTARIO 
--

CREATE TABLE MULTIMEDIA.COMENTARIO(
    COMENTARIO_ID              NUMBER(10, 0)    NOT NULL,
    TEXTO                      VARCHAR2(200)    NOT NULL,
    COMENTARIO_ANTERIOR_ID     NUMBER(10, 0),
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    USUARIO_ID                 NUMBER(10, 0)    NOT NULL,
    CONSTRAINT COMENTARIO_PK PRIMARY KEY (COMENTARIO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.C_COMENTARIO_ID_UK
        ON  MULTIMEDIA.COMENTARIO(COMENTARIO_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    ),
    CONSTRAINT COMENTARIO_CONTENIDO_MULTIMEDIA_ID_FK
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID),
    CONSTRAINT COMENTARIO_USUARIO_ID_FK 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT COMENTARIO_COMENTARIO_ANTERIOR_ID_FK
    FOREIGN KEY (COMENTARIO_ANTERIOR_ID)
    REFERENCES MULTIMEDIA.COMENTARIO(COMENTARIO_ID)
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: MULTIMEDIA_AUTOR 
--

CREATE TABLE MULTIMEDIA.MULTIMEDIA_AUTOR(
    MULTIMEDIA_AUTOR_ID        NUMBER(10, 0)    NOT NULL,
    PORCENTAJE                 NUMBER(5, 2)     NOT NULL,
    AUTOR_ID                   NUMBER(10, 0)    NOT NULL,
    CONTENIDO_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MULTIMEDIA_AUTOR_PK PRIMARY KEY (MULTIMEDIA_AUTOR_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA.MU_MULTIMEDIA_AUTOR_ID_UK
        ON  MULTIMEDIA.MULTIMEDIA_AUTOR(MULTIMEDIA_AUTOR_ID)
        TABLESPACE MULTIMEDIA_IX_TBS
    ),
    CONSTRAINT MULTIMEDIA_AUTOR_ID_FK
    FOREIGN KEY (AUTOR_ID)
    REFERENCES MULTIMEDIA.AUTOR(AUTOR_ID),
    CONSTRAINT MULTIMEDIA_AUTOR_CONTENIDO_MULTIMEDIA_FK 
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID)
) TABLESPACE MULTIMEDIA_TBS
;

-- 
-- TABLE: REGISTRO_REPRODUCCION 
--

CREATE TABLE CLIENTE.REGISTRO_REPRODUCCION(
    REGISTRO_REPRODUCCION_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_INICIO                DATE     NOT NULL,
    FECHA_FIN                   DATE     NOT NULL,
    DURACION_MIN                NUMBER(10, 2)    NOT NULL,
    VELOCIDAD_CARGA             NUMBER(10, 2)    NOT NULL,
    VELOCIDAD_DESCARGA          NUMBER(10, 2)    NOT NULL,
    UBICACION_LATITUD           NUMBER(10, 5),
    UBICACION_LONGITUD          NUMBER(10, 5),
    SEGUNDO_INICIAL             NUMBER(10, 0)    NOT NULL,
    SEGUNDO_FINAL               NUMBER(10, 0)    NOT NULL,
    CONTENIDO_MULTIMEDIA_ID     NUMBER(10, 0)    NOT NULL,
    USUARIO_ID                  NUMBER(10, 0)    NOT NULL,
    DISPOSITIVO_ID              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT REGISTRO_REPRODUCCION_PK PRIMARY KEY (REGISTRO_REPRODUCCION_ID)
    USING INDEX(
        CREATE UNIQUE INDEX CLIENTE.RP_REGISTRO_REPRODUCCION_ID_UK
        ON  CLIENTE.REGISTRO_REPRODUCCION(REGISTRO_REPRODUCCION_ID)
        TABLESPACE CLIENTE_IX_TBS 
    ),
    CONSTRAINT REGISTRO_REPRODUCCION_USUARIO_ID_FK
    FOREIGN KEY (USUARIO_ID)
    REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT REGISTRO_REPRODUCCION_DISPOSITIVO_ID_FK 
    FOREIGN KEY (DISPOSITIVO_ID)
    REFERENCES CLIENTE.DISPOSITIVO(DISPOSITIVO_ID),
    CONSTRAINT REGISTRO_REPRODUCCION_CONTENIDO_MULTIMEDIA_ID_FK
    FOREIGN KEY (CONTENIDO_MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA.CONTENIDO_MULTIMEDIA(CONTENIDO_MULTIMEDIA_ID)
) TABLESPACE CLIENTE_TBS 
PARTITION BY RANGE(FECHA_INICIO)
INTERVAL(NUMTOYMINTERVAL(1,'MONTH'))(
    PARTITION P0 VALUES LESS THAN(TO_DATE('01-01-2022','dd-mm-yyyy')),
    PARTITION P1 VALUES LESS THAN(TO_DATE('01-02-2022','dd-mm-yyyy')),
    PARTITION P2 VALUES LESS THAN(TO_DATE('01-03-2022','dd-mm-yyyy'))
);

whenever sqlerror continue none;