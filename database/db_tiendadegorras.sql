-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2025 a las 18:19:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tiendadegorras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categorias` int(11) NOT NULL,
  `nombre_categoria` varchar(200) NOT NULL,
  `descripción` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Inserción de datos en categorías
-- --------------------------------------------------------
INSERT INTO `categorias` (`id_categorias`,`nombre_categoria`, `descripción`) VALUES
(1, 'Snapback', 'Gorras planas con broche ajustable'),
(2, 'Trucker', 'Gorras con red trasera y visera curva'),
(3, 'DadHat', 'Gorras suaves y ajustables con visera curvada'),
(4, 'Flexfit', 'Gorras elásticas que se ajustan a la cabeza'),
(5, 'Deportiva', 'Gorras diseñadas para actividades físicas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `id_categorias` int(11) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `precio` int(11) NOT NULL,
  `talle` int(11) NOT NULL,
  `color` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Inserción de datos en productos
-- --------------------------------------------------------
INSERT INTO `productos` (`id_productos`,`id_categorias`, `nombre_producto`, `precio`, `talle`, `color`) VALUES
-- SNAPBACK
(1, 1, 'Gorra Snapback Negra Classic', 9500, 58, 'Negro'),
(2, 1, 'Gorra Snapback Roja Supreme', 11000, 59, 'Rojo'),
(3, 1, 'Gorra Snapback Blanca Urban', 9800, 58, 'Blanco'),
(4, 1, 'Gorra Snapback Verde Army', 10200, 60, 'Verde Militar'),

-- TRUCKER
(5, 2, 'Gorra Trucker Blanca y Negra', 8700, 57, 'Blanco y Negro'),
(6, 2, 'Gorra Trucker Azul Marino Logo', 9200, 58, 'Azul Marino'),
(7, 2, 'Gorra Trucker Roja Retro', 8900, 59, 'Rojo'),
(8, 2, 'Gorra Trucker Gris Shadow', 9100, 58, 'Gris'),

-- DAD HAT
(9, 3, 'Gorra Dad Hat Azul Denim', 9800, 56, 'Azul'),
(10, 3, 'Gorra Dad Hat Rosa Vintage', 9700, 56, 'Rosa'),
(11, 3, 'Gorra Dad Hat Negra Minimal', 9900, 57, 'Negro'),

-- FLEXFIT
(12, 4, 'Gorra Flexfit Gris Minimal', 10500, 58, 'Gris'),
(13, 4, 'Gorra Flexfit Azul Oscuro', 10800, 59, 'Azul Oscuro'),
(23, 4, 'Gorra Flexfit Blanca Premium', 10700, 58, 'Blanco'),

-- DEPORTIVA
(24, 5, 'Gorra Deportiva Nike Dri-Fit', 11500, 60, 'Negro'),
(29, 5, 'Gorra Deportiva Adidas Run', 11200, 59, 'Azul'),
(30, 5, 'Gorra Deportiva Puma Active', 10900, 58, 'Gris');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pass` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Inserción de datos en productos
-- --------------------------------------------------------

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `email`, `pass`) VALUES
(1, 'Tomas Gonzalez', 'tomasgonzalez24@gmail.com', '$2y$10$i9WiWDC.gqusSMLWVeP96u0PrgTyhyicR1SSRGeOcBucHBFPzoL5K'),
(2, 'webadmin', 'webadmin@unicen.com', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categorias`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `id_categorias` (`id_categorias`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categorias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
