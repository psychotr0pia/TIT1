-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2023 a las 02:42:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

drop database if exists regcam;
create database regcam;
use regcam;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `regcam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camara`
--
drop table if exists camaras;
CREATE TABLE camaras (
  id_camara int(11) NOT NULL auto_increment,
  locacion varchar(1200) NOT NULL,
  tipo_estado varchar(25) NOT NULL,
  primary key (id_camara)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--
drop table if exists eventos;
CREATE TABLE eventos (
  id_evento int(11) NOT NULL auto_increment,
  tipo_evento varchar(30) NOT NULL,
  descripcion varchar(1200) NOT NULL,
  fecha datetime NOT NULL,
  id_camara int(11) NOT NULL,
  primary key (id_evento),
  foreign key (id_camara) references camaras (id_camara) on update cascade on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

-- INSERT INTO `eventos` (`id`, `tipo`, `descripcion`) VALUES
-- (1, 'Asalto', ''),
-- (2, 'Choque', ''),
-- (3, 'Ilicito', '');


INSERT INTO camaras (locacion, tipo_estado) VALUES
('123 Calle Principal y Avenida Central', 'Activo'),
('456 Avenida Norte y Calle Smith', 'Activo'),
('789 Calle 1 y Avenida Principal', 'Activo'),
('1011 Avenida Principal y Calle 5', 'Activo'),
('222 Estación de Tren, Plataforma 2', 'Activo'),
('333 Centro Comercial, Entrada Principal', 'Activo'),
('789 Calle 1 y Avenida Principal', 'Activo'),
('555 Calle Smith y Avenida Norte', 'Activo'),
('123 Calle Principal y Avenida Central', 'Activo'),
('222 Estación de Tren, Plataforma 2', 'Activo'),
('777 Avenida 2 y Calle Central', 'Activo'),
('333 Centro Comercial, Entrada Principal', 'Activo'),
('456 Avenida Norte y Calle Smith', 'Activo'),
('1011 Avenida Principal y Calle 5', 'Activo'),
('555 Calle Smith y Avenida Norte', 'Activo');

INSERT INTO eventos (tipo_evento, descripcion, fecha, id_camara) VALUES
('Asalto', '3', '0000-00-00 00:00:00', 3),
('Asalto', '123123', '2023-09-27 16:09:34', 1),
('Asalto', '123123', '0000-00-00 00:00:00', 1),
('Asalto', '3', '0000-00-00 00:00:00', 1);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
