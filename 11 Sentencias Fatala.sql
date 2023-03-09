CREATE USER luis_narra;
CREATE USER mariano_fatala;

/* En esta sentencia le doy privilegios de sólo lectura al usuario luis_narra */
GRANT SELECT ON *.* to "luis_narra";

SELECT * FROM mysql.user where user like "luis_narra";

/* En esta sentencia le doy privilegios de lectura, inserción y modificación al usuario mariano_fatala */
GRANT SELECT, INSERT, UPDATE ON *.* to mariano_fatala;

SELECT * FROM mysql.user where user like "mariano_fatala";

/*Cambiamos el nombre a los usuarios creados*/
Rename user "luis_narra" to "servidor@invitado";
Rename user "mariano_fatala" to "servidor@administrador";

/*agregamos una clave (1234) para el usuario administrador*/
alter user "servidor@administrador" identified by "1234";



