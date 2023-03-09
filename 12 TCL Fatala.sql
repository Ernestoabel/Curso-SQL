
/*Cambair trablas del trigger por conflicto con campos antes creados como primary key*/
drop table tabla_stock_modificado;

drop table tabla_stock_antes_modificado;

create table tabla_stock_modificado 
(
id_articulo int not null
,stock smallint
);

create table tabla_stock_antes_modificado 
(
id_articulo int not null
,stock smallint
);

/**/
select * from articulo;

/*Se inicia una transaction cuando se aumenta el precio de venta si el sotck es considerado poco*/
START transaction;
update articulo
    set precioFinal=precioVenta*1.35
where
	stock < 15;
/*Ejecutar linea 28 para cancelar la actualizacion*/
rollback;    
/*Confirmar el cambio con commit*/
commit;    
    
select * from articulo;

/*Se inicia una transaction con dos lotes de registros agragados*/
START transaction;
INSERT INTO publicacion (id_articulo,id_redSocial,fecha,visitas,cantidadVentas)
VALUES
(1009,1,'2023-01-09',45,2)
,(1009,2,'2023-01-09',12,0)
,(1003,1,'2023-01-15',56,6)
,(1003,2,'2023-01-15',18,0);
savepoint loteUno;
INSERT INTO publicacion (id_articulo,id_redSocial,fecha,visitas,cantidadVentas)
VALUES
(1005,1,'2023-01-18',85,12)
,(1005,2,'2023-01-18',34,2)
,(1005,3,'2023-01-18',12,0);
savepoint loteDos;

select * from publicacion;

/*Si se quiere desacer solo los ultimos tres registro agragados, ejecute la linea 54*/
rollback to loteDos;
/*Otra opcion de liberar un lore es la siguiente*/
release savepoint loteUno;
/*Confirmamos los ingresos*/
commit;