
/*el stored procedure ordenamiento_tabla ordena un campo, de la tabla articulo,
 designado en el primer parametro,
en el orden dado por el segundo parametro */
CALL ordenamiento_tabla('stock', 'ASC');
CALL ordenamiento_tabla('stock', 'DESC');

/*el stored procedure add_articulo inserta un registro en la tabla articulo, con todos sus campos */

CALL add_articulo(4900,6370,21,7707.7,12);
SELECT * FROM articulo;