CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenamiento_tabla`(IN campo_orden varchar(50), IN tipo_orden varchar(5))
BEGIN
	SET @s = CONCAT('SELECT * FROM articulo ORDER BY ',campo_orden,' ',tipo_orden);
	PREPARE stmt2 FROM @s;
	EXECUTE stmt2;
DEALLOCATE PREPARE stmt2;
END