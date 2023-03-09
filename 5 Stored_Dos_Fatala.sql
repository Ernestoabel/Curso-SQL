CREATE DEFINER=`root`@`localhost` PROCEDURE `add_articulo`(	
	IN _costo decimal(18,2)
	,IN _precioVenta decimal(18,2)
	,IN _IVA tinyint
	,IN _precioFinal decimal(18,2)
	,IN _stock smallint
)
BEGIN
	INSERT INTO articulo (costo,precioVenta,IVA,precioFinal,stock)
    VALUES (_costo,_precioVenta,_IVA,_precioFinal,_stock);
END