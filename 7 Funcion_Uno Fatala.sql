CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precioVenta`(costo float, porcentajeDeVenta float) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE resultado FLOAT;
    DECLARE sumaPorcentaje  float;
    SET sumaPorcentaje = (costo * porcentajeDeVenta) / 100;
    SET resultado = costo + sumaPorcentaje;
RETURN resultado;
END