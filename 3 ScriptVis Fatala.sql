DROP VIEW vista_usuarios;
DROP VIEW vista_primerosCincoUsuarios;
DROP VIEW vista_ventas;
DROP VIEW vista_Consultas;
DROP VIEW vista_Consulta;

 /*VISTA SIMPLE DE ARTICULOS CON SU ID,COSTO,PRECIOFINAL Y STOCK */
CREATE VIEW 
vista_simple_articulos AS 
SELECT id_articulo, costo, precioFinal, stock
FROM articulo;

SELECT * FROM vista_simple_articulos;

/*VISTA DE DOS TABLAS JUNTAS DE USUARIOS CON COMENTARIOS NEGATIVOS*/
CREATE VIEW 
vista_usuarios_comentarios AS 
SELECT nombre, apellido, telefono, nombreUsuario, consulta
FROM consulta INNER JOIN usuario
USING (id_usuario)
WHERE positiva !=1;

SELECT * FROM vista_usuarios_comentarios;

/*VISTA PUBLICACIONES ORDENAS POR CANTIDAD DE VISITAS */
CREATE VIEW 
vista_publicaciones_ordenadas_por_visitas AS 
SELECT * FROM publicacion
ORDER BY visitas DESC;

SELECT * FROM vista_publicaciones_ordenadas_por_visitas;

/*VISTA PUBLICACIONES SELECCIONADAS POR MAYOR PROMEDIO DE LA MEDIA */
CREATE VIEW 
vista_publicacion_vistas_mayor_al_promedio AS 
SELECT *
FROM publicacion
WHERE visitas > (
				select avg(visitas)
                FROM publicacion
				)
;

SELECT * FROM vista_publicacion_vistas_mayor_al_promedio;

/*EN LA SIGUIENTE CREO UNA VISTA DE USUARIOS PARA LUEGO ALTERARLA CONCATENANDO NOMBRE Y APELLIDO EN UNA SOLA COLUMNA */
CREATE VIEW 
vista_nombres_usuarios AS 
SELECT id_usuario,nombre,apellido,telefono 
FROM usuario;

ALTER VIEW 
vista_nombres_usuarios AS 
SELECT id_usuario,CONCAT(nombre,' ',apellido)AS nombreCompleto,telefono 
FROM usuario;

SELECT * FROM vista_nombres_usuarios;