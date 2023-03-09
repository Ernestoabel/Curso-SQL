CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_precioFinal`(precioVenta float) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE resultado FLOAT;
    DECLARE IVA FLOAT;
    set IVA=1.21;
    SET resultado = precioVenta * IVA;
RETURN resultado;
END