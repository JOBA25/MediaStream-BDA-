-- @Autor					Lazaro Martinez Abraham Josue
--								Barcenas Avelar Jorge Octavio
-- @Fecha					04/01/2021
-- @Descripcion		Carga de datos blob

connect sys/system as sysdba

set serveroutput on;

create or replace directory data_dir as '/media/lazaro/dba/curso_bda/proyecto/recursos';
grant read, write on directory data_dir to multimedia;

create or replace procedure p_carga_blob (
	p_contenido_multimedia_id in number,
  p_secuencia_id in number, 
  p_archivo in varchar2
) is 
  v_bfile bfile;
  v_src_offset number := 1;
  v_dest_offset number := 1;
  v_dest_blob blob;
  v_src_length number;
  v_dest_length number;
	v_path_file varchar2(1000) := '/media/lazaro/dba/curso_bda/proyecto/recursos/';
begin 
  v_src_offset := 1;
  v_dest_offset := 1;
  dbms_output.put_line('Cargando ' || p_archivo);

	-- Se genera la dirección del archivo con el path y el nombre
  v_bfile := bfilename('DATA_DIR', p_archivo);

	-- Checamos si existe y si no está abierto
  if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 then 
		-- Cargamos el archivo
    dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
	-- Si no, se lanza un error
  else raise_application_error(-20001, 'El archivo '
    || p_archivo
    || ' no existe en la carpeta '
		|| v_path_file
    || ' o se encuentra abierto');
  end if;

	-- Obtenemos el objeto blob para modificarlo
  select contenido into v_dest_blob
  from multimedia.seccion 
  where secuencia_id  = p_secuencia_id
  and contenido_multimedia_id = p_contenido_multimedia_id
  for update;

	-- Ocupamos una función para que se cargen los archivos
  dbms_lob.loadblobfromfile(
    dest_lob => v_dest_blob, 								-- Blob de destino
    src_bfile => v_bfile,   								-- Archivo de donde se carga
    amount => dbms_lob.getlength(v_bfile),	-- Cantidad de bytes a cargar
    dest_offset => v_dest_offset,						-- Offset de destino
    src_offset => v_src_offset);						-- Offset de la fuente 

	-- Cerramos el archivo
  dbms_lob.close(v_bfile);

	-- Obtenemos el tamaño del archivo y del objeto blob donde se cargo
	-- Para comparar
  v_src_length := dbms_lob.getlength(v_bfile);
  v_dest_length := dbms_lob.getlength(v_dest_blob);

	-- Si los tamaños (cantidad de bytes) son iguales, todo bien
  if v_src_length = v_dest_length then
    dbms_output.put_line('El archivo se cargó de manera correcta');
	-- En caso de que sean diferentes
  else raise_application_error(-20002, 'Error al cargar el archivo.\n'
    || ' Se esperaba escribir '
    || v_src_length
    || ' Pero solo se escribió '
    || v_dest_length);
  end if;

end;
/
show errors

begin
	--          cm_id, sec_id, nombre
  p_carga_blob(1, 1, 'cancion.mp3');
	p_carga_blob(1, 2, 'cancion.mp3');
	p_carga_blob(2, 1, 'cancion.mp3');
	p_carga_blob(2, 2, 'cancion.mp3');
	p_carga_blob(3, 1, 'cancion.mp3');
	p_carga_blob(3, 2, 'cancion.mp3');
	p_carga_blob(3, 3, 'cancion.mp3');
	p_carga_blob(3, 4, 'cancion.mp3');

  -- Insertamos videos
  p_carga_blob(257, 1, 'video.mp4');
  p_carga_blob(257, 2, 'video.mp4');
  p_carga_blob(257, 3, 'video.mp4');
  p_carga_blob(257, 4, 'video.mp4');
  p_carga_blob(257, 5, 'video.mp4');
  p_carga_blob(257, 6, 'video.mp4');
  p_carga_blob(257, 7, 'video.mp4');
  p_carga_blob(257, 8, 'video.mp4');
	p_carga_blob(257, 9, 'video.mp4');

end;
/

--commit;