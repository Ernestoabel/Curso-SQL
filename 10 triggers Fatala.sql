create table tabla_stock_modificado 
(
id_articulo int primary key not null
,stock smallint
);

create table tabla_stock_antes_modificado 
(
id_articulo int primary key not null
,stock smallint
);

create table log_tabla_articulo
(
tsActualiza timestamp
,esquema varchar(51)
,operacion varchar (6)
,registro int
);

create table log_tabla_consulta
(
tsActualiza timestamp
,esquema varchar(51)
,operacion varchar (6)
,registro int
);

/*trigger para la creacion de un log sobre la actualizacion de la tabla articulo */
DELIMITER $$
CREATE TRIGGER tr_update_articulo_log
BEFORE UPDATE ON articulo
FOR EACH ROW
INSERT INTO log_tabla_articulo (tsActualiza,esquema,operacion,registro)
VALUES (now(), database(),'update',1);
END$$;
DELIMITER ;

/*trigger para la creacion de un log sobre el insert de datos de la tabla consulta */
DELIMITER $$
CREATE TRIGGER tr_insert_consulta_log
AFTER INSERT ON consulta
FOR EACH ROW
INSERT INTO log_tabla_consulta (tsActualiza,esquema,operacion,registro)
VALUES (now(), database(),'insert',1);
END$$;
DELIMITER ;

/*trigger para la creacion de una tabla con datos de nuevos stocks en la tabla articulos */
DELIMITER $$
CREATE TRIGGER modificacion_de_stock
AFTER UPDATE ON articulo
FOR EACH ROW
INSERT INTO tabla_stock_modificado (id_articulo,stock)
VALUES (NEW.id_articulo, NEW.stock);
END$$;
DELIMITER ;

/*trigger para la creacion de una tabla con datos anteriores a la actualizacion de stocks en la tabla articulos */
DELIMITER $$
CREATE TRIGGER stock_anterior_modificacion
BEFORE UPDATE ON articulo
FOR EACH ROW
INSERT INTO tabla_stock_antes_modificado (id_articulo,stock)
VALUES (OLD.id_articulo, OLD.stock);
END$$;
DELIMITER ;


UPDATE articulo
SET stock=13
WHERE id_articulo=1001;

SELECT * FROM tabla_stock_modificado;
SELECT * FROM tabla_stock_antes_modificado;

UPDATE articulo
SET stock=5
WHERE id_articulo=1004;

SELECT * FROM tabla_stock_antes_modificado;
SELECT * FROM tabla_stock_modificado;
SELECT * FROM log_tabla_articulo;


create table tabla_nuevo_comentario_positivo
(
id_usuario int
,nombreUsuario varchar (51)
,consulta varchar(500)
,positiva tinyint
);


/*trigger para la creacion de una tabla con nuevas consultas positivas integradas en la tabla consulta */
DELIMITER $$
CREATE TRIGGER nuevo_comentario_positivo
AFTER INSERT ON consulta
FOR EACH ROW
BEGIN
  IF NEW.positiva !=0
  THEN
INSERT INTO tabla_nuevo_comentario_positivo (id_usuario,nombreUsuario,consulta,positiva)
VALUES (NEW.id_usuario,NEW.nombreUsuario,NEW.consulta,NEW.positiva);
 END IF ;
END$$
DELIMITER ;


INSERT INTO consulta (id_usuario,nombreUsuario,consulta,positiva)
VALUES
(10004,'Victorias1000','Excelente producto',1)
,(10007,'Cecidedos','Muchas gracias por la atencion',1)
,(10005,'evalunas','Quiero devolver el producto',0)
,(10006,'Maritonea','No me sirvio el prodducto',0)
,(10001,'Pozitos','Considero que si compro cantidad deberian haceme un descuento, disiento en la negativa',0)
,(10006,'Maritonea','mi doctor lo aprueba',1)
,(10006,'Maritonea','a mi bebe le encanta',1)
,(10001,'Maritonea','consegui mejor precio',0)
,(10006,'Maritonea','voy a comprar otro',1);

SELECT * FROM tabla_nuevo_comentario_positivo;
SELECT * FROM log_tabla_consulta;
