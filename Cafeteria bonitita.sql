/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para cafeteria
CREATE DATABASE IF NOT EXISTS `cafeteria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cafeteria`;

-- Volcando estructura para tabla cafeteria.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` varchar(18) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.cliente: 0 rows
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla cafeteria.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `empleado_id` varchar(30) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `puesto_id` varchar(20) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `edad` int(11) NOT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `puesto` (`puesto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.empleado: 0 rows
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla cafeteria.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `producto_id` varchar(18) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `proveedor_id` varchar(18) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  KEY `producto` (`producto_id`),
  KEY `proveedor` (`proveedor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.inventario: 0 rows
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;

-- Volcando estructura para tabla cafeteria.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `producto_id` varchar(18) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.producto: 0 rows
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla cafeteria.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `proveedor_id` varchar(18) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.proveedor: 0 rows
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla cafeteria.puesto
CREATE TABLE IF NOT EXISTS `puesto` (
  `puesto_id` varchar(20) NOT NULL,
  `puesto` varchar(20) NOT NULL,
  `salario` int(11) NOT NULL,
  PRIMARY KEY (`puesto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.puesto: 0 rows
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;

-- Volcando estructura para tabla cafeteria.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `folio` varchar(18) NOT NULL,
  `fecha` date NOT NULL,
  `cliente_id` varchar(18) NOT NULL,
  `empleado_id` varchar(18) NOT NULL,
  `producto_id` varchar(18) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `llaveforanea graciosa 1` (`cliente_id`),
  KEY `empleado` (`empleado_id`),
  KEY `producto` (`producto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cafeteria.venta: 0 rows
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
