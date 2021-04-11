CREATE DATABASE IF NOT EXISTS `cuentadeahorro` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cuentadeahorro`;

-- Volcando estructura para tabla cuentadeahorro.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `NumeroDeCuenta` int(11) NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `SaldoAnterior` int(11) DEFAULT NULL,
  `SaldoActual` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumeroDeCuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cuentadeahorro.clientes: 1 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`NumeroDeCuenta`, `Nombre`, `SaldoAnterior`, `SaldoActual`) VALUES
	(1545, 'Pedro Vasquez', 2000, 4000);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla cuentadeahorro.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `FechaMov` date NOT NULL,
  `TipoMov` varchar(12) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `NumeroDeCuenta` int(11) DEFAULT NULL,
  PRIMARY KEY (`FechaMov`),
  KEY `NumeroDeCuenta` (`NumeroDeCuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cuentadeahorro.movimientos: 1 rows
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` (`FechaMov`, `TipoMov`, `Cantidad`, `NumeroDeCuenta`) VALUES
	('2010-10-10', 'Deposito', 2000, 1545);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
