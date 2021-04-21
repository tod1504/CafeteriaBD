/*Ingresa cliente nuevo, en caso de exepcion de sql ejecuta rollback*/
DELIMITER $$

CREATE PROCEDURE nuevoCli(nc INT, nom VARCHAR(40), sant INT, sact INT)
BEGIN
	/*Declara rollback en caso de exepcion*/
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
	START TRANSACTION;
	INSERT INTO clientes VALUES (nc, nom, sant, sact);
	COMMIT;
END$$

DELIMITER ;

/*Actualiza cliente, executa rollback en caso de excepcion*/
DELIMITER $$

CREATE PROCEDURE upCli(nc INT, nom VARCHAR(40), sant INT, sact INT)
BEGIN
	/*Declara rollback en caso de exepcion*/
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
	START TRANSACTION;
	UPDATE clientes SET SaldoAnterior = sant, SaldoActual = sact WHERE NumeroDeCuenta = nc;
	COMMIT;
END$$

DELIMITER ;

/*Borra cliente, executa rollback en caso de excepcion*/
DELIMITER $$

CREATE PROCEDURE delCli(nc INT)
BEGIN
	/*Declara rollback en caso de exepcion*/
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
	START TRANSACTION;
	DELETE FROM clientes WHERE NumeroDeCuenta = nc;
	COMMIT;
END$$

DELIMITER ;
