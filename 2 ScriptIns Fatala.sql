ALTER TABLE articulo AUTO_INCREMENT = 1000;

INSERT INTO articulo (costo,precioVenta,IVA,precioFinal,stock)
VALUES
(2980.50,4470.75,21,5409.60,15)
,(5480,8220,21,9946.20,10)
,(1980,2970,21,3593.70,35)
,(980,1470,21,1778.70,80)
,(11500,14950,21,18089.50,15)
,(8750,13125,21,15881.25,25)
,(3210,4815,21,5826.15,50)
,(1750,2625,21,3176.25,20)
,(2250,3375,21,4083.75,40)
,(5460,8190,21,9909.90,25);


SELECT * FROM articulo;

ALTER TABLE red_social AUTO_INCREMENT = 1;

INSERT INTO red_social (redSocial)
VALUES
('Faceboock')
,('Instagram')
,('TikTok')
,('Pinterest');



ALTER TABLE `panialera_renacer`.`usuario` 
CHANGE COLUMN `telefono` `telefono` BIGINT NULL DEFAULT NULL ;

ALTER TABLE usuario AUTO_INCREMENT = 10001;

INSERT INTO usuario (nombre,apellido,telefono)
VALUES
('Maria','Pozo',1156984512)
,('Juana','Viales',1148562136)
,('Dario','Dolas',1136458945)
,('Victoria','Nasra',1165841245)
,('Eva','Serral',1178456325)
,('Mariana','Viera',1193456274)
,('Cecilia','Di Tirro',1125458575)
,('Paula','Brigatti',1165457825)
,('Carla','Minones',1124516235)
,('Carlos','Caputo',11957563515);

SELECT * FROM usuario;

/*El campo positiva dunciona como un boolenao,1 es true,0 es false */
INSERT INTO consulta (id_usuario,nombreUsuario,consulta,positiva)
VALUES
(10010,'Carlos1983','Esos pañales sirven para agua',1)
,(10008,'BrigaWinner','Cuanto, en horas, dura la abssorcion',1)
,(10006,'Maritonea','Este chupete,cuan mal hace a los dientes',1)
,(10001,'Pozitos','Me harian descuento por cantidad',1)
,(10006,'Maritonea','Esta comprobado por pediatra?',1)
,(10002,'Juanita1975','cuanto aguanta un panial para un bb pesado?',1)
,(10002,'Juanita1975','mi bb pesa 10kg',1)
,(10004,'Victorias1000','es ecologico?',1)
,(10007,'Cecidedos','eme interesa mucho',1)
,(10005,'evalunas','me parece una cagada',0);

SELECT * FROM consulta;

ALTER TABLE publicacion AUTO_INCREMENT = 101;

INSERT INTO publicacion (id_articulo,id_redSocial,fecha,visitas,cantidadVentas)
VALUES
(1000,1,'2023-01-02',15,2)
,(1001,2,'2023-01-02',23,0)
,(1000,1,'2023-01-03',45,0)
,(1001,2,'2023-01-03',10,0)
,(1004,1,'2023-01-05',8,2)
,(1008,2,'2023-01-05',4,2)
,(1006,1,'2023-01-06',32,1)
,(1002,2,'2023-01-06',24,3)
,(1000,1,'2023-01-08',15,0)
,(1001,2,'2023-01-08',36,0);

SELECT * FROM publicacion;

ALTER TABLE facturacion AUTO_INCREMENT = 100001;

INSERT INTO facturacion (id_publicacion,id_usuario,CUIT,razonSocial,domicilioFiscal,tipo)
VALUES
(101,10008,0,'consumidor final','-','B') 
,(101,10004,20305551911,'cafaro hermanos','constitucion 2680','A')
,(104,10003,30156594582,'panialera bebes','alberti 4580','A')
,(104,10005,0,'consumidor final','-','B') 
,(108,10002,0,'consumidor final','-','B') 
,(108,10001,0,'consumidor final','-','B') 
,(106,10006,0,'consumidor final','-','B') 
,(102,10009,0,'consumidor final','-','B')  
,(102,10007,20234187482,'romina pedrera','jujuy 1503','A')
,(102,10010,20264894562,'carla kaplanm','catamarca 590','A');

SELECT * FROM facturacion;










