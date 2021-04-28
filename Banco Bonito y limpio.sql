CREATE DATABASE IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `banco`;

-- Volcando estructura para tabla banco.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `NumeroDeCuenta` int(11) NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `SaldoAnterior` int(11) DEFAULT NULL,
  `SaldoActual` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumeroDeCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla banco.clientes: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`NumeroDeCuenta`, `Nombre`, `SaldoAnterior`, `SaldoActual`) VALUES
	(0, '3', 2, 750),
	(1, 'Oscar', 78, 800),
	(12, '3', 2, 750),
	(1457, 'Juan Lopez', 3000, 2357),
	(1545, 'Pedro Vasquez', 2000, 4735),
	(4759, 'Perla Ruiz', 6890, 7835);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para procedimiento banco.delCli
DELIMITER //
CREATE PROCEDURE `delCli`(
	IN `nc` INT
)
BEGIN
	/*Declara rollback en caso de exepcion*/
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
	START TRANSACTION;
	DELETE FROM movimientos WHERE NumeroDeCuenta = nc;
	DELETE FROM clientes WHERE NumeroDeCuenta = nc;
	COMMIT;
END//
DELIMITER ;

-- Volcando estructura para tabla banco.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `FechaMov` date NOT NULL,
  `TipoMov` varchar(12) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `NumeroDeCuenta` int(11) DEFAULT NULL,
  KEY `NumeroDeCuenta` (`NumeroDeCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla banco.movimientos: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` (`FechaMov`, `TipoMov`, `Cantidad`, `NumeroDeCuenta`) VALUES
	('2020-07-11', 'Deposito', 210, 4759),
	('2020-10-10', 'Deposito', 2000, 1545),
	('2021-02-10', 'Retiro', 200, 1457),
	('2021-04-20', 'Deposito', 2, 1457),
	('2021-04-22', 'Deposito', 300, 1457),
	('2021-04-22', 'Retiro', 300, 1457);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;

-- Volcando estructura para procedimiento banco.nuevoCli
DELIMITER //
CREATE PROCEDURE `nuevoCli`(nc INT, nom VARCHAR(40), sant INT, sact INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
	START TRANSACTION;
	INSERT INTO clientes VALUES (nc, nom, sant, sact);
	COMMIT;
END//
DELIMITER ;

-- Volcando estructura para procedimiento banco.upCli
DELIMITER //
CREATE PROCEDURE `upCli`(nc INT, nom VARCHAR(40), sant INT, sact INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT "Cliente no existe";
        ROLLBACK;
    END;
	START TRANSACTION;
	UPDATE clientes SET Nombre = nom, SaldoAnterior = sant, SaldoActual = sact WHERE NumeroDeCuenta = nc;
	COMMIT;
END//
DELIMITER ;
