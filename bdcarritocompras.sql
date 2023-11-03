-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2023 a las 00:36:58
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) UNSIGNED NOT NULL,
  `Dni` varchar(9) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Dni`, `Nombres`, `Direccion`, `Email`, `Password`) VALUES
(17, '78019778', 'Alexander Fuentes Medina', 'Lambayeque-Ferreñafe', 'alexanderfuentes@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idCliente` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombres`, `Foto`, `Descripcion`, `Precio`, `Stock`) VALUES
(20, 'Donas x 6 unidades', 'C:/apache-tomcat-9.0.80/carrito/mediadocena.jpg.png', 'Llévate 6 donuts clásicas por el precio de 5. Producto sujeto a disponibilidad de tienda. Imágenes referenciales.', 24.9, 100),
(21, '4 Donas Clasicas', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/1693838800_banner-mobile-martes-septiembre.jpg', 'Martes de dulzurua 4 Donas Clasicas a 12.90', 12.9, 150),
(22, 'Croissant Mixto y Bebida', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/mixto-bebida-agosto-dd.png', 'Croissant de jamón y queso, y bebida a elección. Producto sujeto a disponibilidad de tienda', 8.9, 50),
(23, 'Duo Misterio', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/duo-misterio-sa-dunkin-donuts-sabores.png', 'Malteada de chocolate + Dona misteriosa hasta agotar stock o ver disponibilidad de tienda', 14.9, 60),
(24, 'Donas Multisabores por 12 unidades', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/f84eaf0459db7ad1a5c78019c92b17fc.jpg', 'Danas Glaceadas bañadas en chocolate y multisabores por 12 unidades hasta agotar disponibilidad de tienda', 49.9, 100),
(25, 'Pionono de Maracuya', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/veracruzCOW-6-300x300.jpg', 'Pionono de maracuya con cubierta de almibar y glaceado de vainilla hasta agotar stock', 10.9, 50),
(26, 'Cheesecake de Fresa', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/chiskake.jpg', 'El cheesecake de fresa es un postre clásico y delicioso que combina una cremosa base de queso con una cobertura de fresas frescas o salsa de fresa.', 45.9, 20),
(28, 'Torta de chocolate', 'C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/Porcion-de-torta-de-chocolate-DC-1.jpg', 'Torta de chocolate por tajada balada en fosh, hasta agotar unidaes', 5.9, 20),
(29, 'Torta de chantilly', 'file:///C:/Users/jezuz/OneDrive/Desktop/CarritoCompras/img/hq720.jpg', 'Torta de biscochuelo bañado en chantilly hast agaotar stock', 20, 15);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idCliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
