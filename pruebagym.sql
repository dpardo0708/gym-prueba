-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2021 a las 03:17:16
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebagym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `city_cod` int(10) NOT NULL,
  `city_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`city_cod`, `city_name`) VALUES
(0, 'Armenia'),
(1, 'Bogota'),
(3, 'Cartagena'),
(4, 'Barranquilla'),
(5, 'Pereira');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `login_cod` int(10) NOT NULL,
  `login_name` varchar(25) NOT NULL,
  `login_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`login_cod`, `login_name`, `login_password`) VALUES
(1, 'Dpardo', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roles_cod` int(10) NOT NULL,
  `roles_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`roles_cod`, `roles_name`) VALUES
(1, 'userGym'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_document`
--

CREATE TABLE `type_document` (
  `type_document_cod` int(10) NOT NULL,
  `type_document_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type_document`
--

INSERT INTO `type_document` (`type_document_cod`, `type_document_name`) VALUES
(1, 'Cedula'),
(2, 'Tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_cod` int(10) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_document_number` varchar(15) NOT NULL,
  `user_gender` varchar(15) DEFAULT NULL,
  `user_address` varchar(25) DEFAULT NULL,
  `user_phonenumber` varchar(15) NOT NULL,
  `roles_cod` int(10) NOT NULL,
  `type_document_cod` int(10) NOT NULL,
  `login_cod` int(10) NOT NULL,
  `venue_cod` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_cod`, `user_name`, `user_document_number`, `user_gender`, `user_address`, `user_phonenumber`, `roles_cod`, `type_document_cod`, `login_cod`, `venue_cod`) VALUES
(2, 'Carlos Diaz', '123456', 'Masculino', 'cll 89', '34343434', 2, 1, 1, 1),
(3, 'Andrea Sanchez', '18908877', 'Femenino', 'cra 56', '898989', 1, 1, 1, 1),
(4, 'Sandra puentes', '11111', 'Femenino', 'TV 20', '2134444444', 1, 1, 1, 2),
(5, 'Maria Torres', '89898', 'Femenino', ' cll 20', '2134444434', 1, 1, 1, 1),
(6, 'Martin Francisco', '89896', 'Masculino', ' cll 20', '31234444434', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venues`
--

CREATE TABLE `venues` (
  `venue_cod` int(10) NOT NULL,
  `venue_name` varchar(25) DEFAULT NULL,
  `venue_address` varchar(25) DEFAULT NULL,
  `venue_phonenumber` varchar(15) DEFAULT NULL,
  `city_cod` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venues`
--

INSERT INTO `venues` (`venue_cod`, `venue_name`, `venue_address`, `venue_phonenumber`, `city_cod`) VALUES
(1, 'Corferias', 'Cra 26 # 68', '4567456', 1),
(2, 'Unicentro', 'cll 100', '234556', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_cod`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_cod`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_cod`);

--
-- Indices de la tabla `type_document`
--
ALTER TABLE `type_document`
  ADD PRIMARY KEY (`type_document_cod`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_cod`),
  ADD KEY `FK_roles_cod` (`roles_cod`),
  ADD KEY `FK_type_document` (`type_document_cod`),
  ADD KEY `FK_login_cod` (`login_cod`),
  ADD KEY `Fk_venue_cod` (`venue_cod`);

--
-- Indices de la tabla `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_cod`),
  ADD KEY `FK_city_cod` (`city_cod`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `login_cod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `roles_cod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT de la tabla `type_document`
--
ALTER TABLE `type_document`
  MODIFY `type_document_cod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_cod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venues`
--
ALTER TABLE `venues`
  MODIFY `venue_cod` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `login_cod` FOREIGN KEY (`login_cod`) REFERENCES `login` (`login_cod`),
  ADD CONSTRAINT `roles_cod` FOREIGN KEY (`roles_cod`) REFERENCES `roles` (`roles_cod`),
  ADD CONSTRAINT `type_document_cod` FOREIGN KEY (`type_document_cod`) REFERENCES `type_document` (`type_document_cod`),
  ADD CONSTRAINT `venue_cod` FOREIGN KEY (`venue_cod`) REFERENCES `venues` (`venue_cod`);

--
-- Filtros para la tabla `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `city_cod` FOREIGN KEY (`city_cod`) REFERENCES `city` (`city_cod`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
