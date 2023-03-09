CREATE DATABASE panialera_renacer; 

USE  panialera_renacer;

DROP TABLE articulo;
DROP TABLE publicacion;
DROP TABLE facturacion;
DROP TABLE red_social;
DROP TABLE usuario;

create table articulo 
(
id_articulo int primary key not null AUTO_INCREMENT
,costo decimal(18,2)
,precioVenta decimal(18,2)
,IVA tinyint
,precioFinal decimal(18,2)
,stock smallint
);


create table red_social 
(
id_redSocial int primary key not null AUTO_INCREMENT
,redSocial varchar(51)
);



create table usuario 
(
id_usuario int primary key not null AUTO_INCREMENT
,nombre varchar(51)
,apellido varchar(51)
,telefono int
);

create table consulta 
(
id_usuario int
,foreign key (id_usuario) references usuario (id_usuario)
,nombreUsuario varchar (51)
,consulta varchar(500)
,positiva tinyint
);

create table publicacion 
(
id_publicacion int primary key not null AUTO_INCREMENT
,id_articulo int not null
,foreign key (id_articulo) references articulo (id_articulo)
,id_redSocial int not null
,foreign key (id_redSocial) references red_social (id_redSocial)
,fecha date
,visitas int
,cantidadVentas int
);

create table facturacion 
(
id_publicacion int not null
,foreign key (id_publicacion) references publicacion (id_publicacion)
,id_usuario int not null
,foreign key (id_usuario) references usuario (id_usuario)
,numero int primary key not null AUTO_INCREMENT
,CUIT BIGINT
,razonSocial varchar (151)
,domicilioFiscal varchar (151)
,tipo char
);

