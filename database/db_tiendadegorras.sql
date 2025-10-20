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
INSERT INTO `categorias` (`nombre_categoria`, `descripción`) VALUES
('Snapback', 'Gorras planas con broche ajustable'),
('Trucker', 'Gorras con red trasera y visera curva'),
('Dad Hat', 'Gorras suaves y ajustables con visera curvada'),
('Flexfit', 'Gorras elásticas que se ajustan a la cabeza'),
('Deportiva', 'Gorras diseñadas para actividades físicas');

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
INSERT INTO `productos` (`id_categorias`, `nombre_producto`, `precio`, `talle`, `color`) VALUES
-- SNAPBACK
(1, 'Gorra Snapback Negra Classic', 9500, 58, 'Negro'),
(1, 'Gorra Snapback Roja Supreme', 11000, 59, 'Rojo'),
(1, 'Gorra Snapback Blanca Urban', 9800, 58, 'Blanco'),
(1, 'Gorra Snapback Verde Army', 10200, 60, 'Verde Militar'),

-- TRUCKER
(2, 'Gorra Trucker Blanca y Negra', 8700, 57, 'Blanco y Negro'),
(2, 'Gorra Trucker Azul Marino Logo', 9200, 58, 'Azul Marino'),
(2, 'Gorra Trucker Roja Retro', 8900, 59, 'Rojo'),
(2, 'Gorra Trucker Gris Shadow', 9100, 58, 'Gris'),

-- DAD HAT
(3, 'Gorra Dad Hat Azul Denim', 9800, 56, 'Azul'),
(3, 'Gorra Dad Hat Rosa Vintage', 9700, 56, 'Rosa'),
(3, 'Gorra Dad Hat Negra Minimal', 9900, 57, 'Negro'),

-- FLEXFIT
(4, 'Gorra Flexfit Gris Minimal', 10500, 58, 'Gris'),
(4, 'Gorra Flexfit Azul Oscuro', 10800, 59, 'Azul Oscuro'),
(4, 'Gorra Flexfit Blanca Premium', 10700, 58, 'Blanco'),

-- DEPORTIVA
(5, 'Gorra Deportiva Nike Dri-Fit', 11500, 60, 'Negro'),
(5, 'Gorra Deportiva Adidas Run', 11200, 59, 'Azul'),
(5, 'Gorra Deportiva Puma Active', 10900, 58, 'Gris');


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

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `email`, `pass`) VALUES
(1, 'Tomas Gonzalez', 'tomasgonzalez429030@gmail.com', '$2y$10$i9WiWDC.gqusSMLWVeP96u0PrgTyhyicR1SSRGeOcBucHBFPzoL5K'),
(2, 'Brandown Leiva', 'brandonayelenmeamaleiva@gmail.com', '$2y$10$u4heaCRCcQt014uAUpW6KuUz.WxxVZOVIAYhxdf9VUCmh6ju5XPDG');

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
