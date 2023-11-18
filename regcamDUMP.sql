-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2023 a las 00:04:04
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
-- Base de datos: `regcam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camara`
--

CREATE TABLE `camara` (
  `id` int(11) NOT NULL,
  `locacion` varchar(1200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camara`
--

INSERT INTO `camara` (`id`, `locacion`) VALUES
(1, 'Locación Nueva 2'),
(2, 'Locación Nueva 2'),
(3, 'Locación Nueva 1'),
(4, 'Locación Nueva 2'),
(5, 'Locación Nueva 2'),
(6, 'Locación Nueva 2'),
(8, 'Locación Nueva 2'),
(9, 'Locación Nueva 2'),
(10, 'Locación Nueva 2'),
(11, 'Locación Nueva 2'),
(12, 'Locación Nueva 1'),
(17, 'Locación Nueva 2'),
(29, 'Locación Nueva 2'),
(30, 'Locación Nueva 2'),
(31, 'Locación Nueva 2'),
(32, 'Locación Nueva 2'),
(33, 'Locación Nueva 2'),
(196, 'Locación Nueva 1'),
(197, 'Locación Nueva 2'),
(198, 'Locación Nueva 1'),
(199, 'Locación Nueva 2'),
(200, 'Locación Nueva 1'),
(201, 'Locación Nueva 2'),
(202, 'Locación Nueva 1'),
(203, 'Locación Nueva 2'),
(204, 'Locación Nueva 1'),
(205, 'Locación Nueva 2'),
(206, 'Locación Nueva 1'),
(207, 'Locación Nueva 2'),
(208, 'Locación Nueva 1'),
(209, 'Locación Nueva 2'),
(210, 'Locación Nueva 1'),
(211, 'Locación Nueva 2'),
(212, 'Locación Nueva 1'),
(213, 'Locación Nueva 2'),
(214, 'Locación Nueva 1'),
(215, 'Locación Nueva 2'),
(216, 'Locación Nueva 1'),
(217, 'Locación Nueva 2'),
(218, 'Locación Nueva 1'),
(219, 'Locación Nueva 2'),
(220, 'Locación Nueva 1'),
(221, 'Locación Nueva 1'),
(222, 'Locación Nueva 1'),
(223, 'Locación Nueva 1'),
(224, 'Locación Nueva 1'),
(225, 'Locación Nueva 1'),
(226, 'Locación Nueva 1'),
(227, 'Locación Nueva 1'),
(228, 'Locación Nueva 1'),
(229, 'Locación Nueva 1'),
(230, 'Locación Nueva 1'),
(231, 'Locación Nueva 1'),
(232, 'Locación Nueva 1'),
(233, 'Locación Nueva 1'),
(234, 'Locación Nueva 1'),
(235, 'Locación Nueva 1'),
(236, 'Locación Nueva 1'),
(237, 'Locación Nueva 1'),
(238, 'Locación Nueva 1'),
(239, 'Locación Nueva 1'),
(240, 'Locación Nueva 1'),
(241, 'Locación Nueva 1'),
(242, 'Locación Nueva 1'),
(243, 'Locación Nueva 1'),
(244, 'Locación Nueva 1'),
(245, 'Locación Nueva 1'),
(246, 'Locación Nueva 1'),
(247, 'Locación Nueva 1'),
(248, 'Locación Nueva 1'),
(249, 'Locación Nueva 1'),
(250, 'Locación Nueva 1'),
(251, 'Locación Nueva 1'),
(252, 'Locación Nueva 1'),
(253, 'Locación Nueva 1'),
(254, 'Locación Nueva 1'),
(255, 'Locación Nueva 1'),
(256, 'Locación Nueva 1'),
(257, 'Locación Nueva 1'),
(258, 'Locación Nueva 1'),
(259, 'Locación Nueva 1'),
(260, 'Locación Nueva 1'),
(261, 'Locación Nueva 1'),
(262, 'Locación Nueva 1'),
(263, 'Locación Nueva 1'),
(264, 'Locación Nueva 1'),
(265, 'Locación Nueva 1'),
(266, 'Locación Nueva 1'),
(267, 'Locación Nueva 1'),
(268, 'Locación Nueva 1'),
(269, 'Locación Nueva 1'),
(270, 'Locación Nueva 1'),
(271, 'Locación Nueva 1'),
(272, 'Locación Nueva 1'),
(273, 'Locación Nueva 1'),
(274, 'Locación Nueva 1'),
(275, 'Locación Nueva 1'),
(276, 'Locación Nueva 1'),
(277, 'Locación Nueva 1'),
(278, 'Locación Nueva 1'),
(279, 'Locación Nueva 1'),
(280, 'Locación Nueva 1'),
(281, 'Locación Nueva 1'),
(292, 'Locación Nueva 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocamara`
--

CREATE TABLE `estadocamara` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `color` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocamara`
--

INSERT INTO `estadocamara` (`id`, `nombre`, `color`) VALUES
(1, 'Apagado', '#3040A5'),
(2, 'Encendida', '#9730A5'),
(3, 'Camara rota', '#f0a059');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descripcion` varchar(1200) NOT NULL,
  `color` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `tipo`, `descripcion`, `color`) VALUES
(1, 'Asalto', '', '#d7fcd6'),
(2, 'Choque', '', '#d0dafb'),
(3, 'Ilicito', '', ' #f9dfcf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `ID` int(11) NOT NULL,
  `id_registro` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `id_camara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`ID`, `id_registro`, `fecha`, `fecha_modificacion`, `descripcion`, `tipo`, `id_camara`) VALUES
(133, 743, '2023-11-12 04:18:18', '2023-11-12 04:18:35', 'asdasdasd', 'Asalto', 199),
(134, 744, '2023-11-12 04:18:26', '2023-11-12 04:43:00', 'asdasdasd', 'Asalto', 199),
(135, 744, '2023-11-12 07:18:26', '2023-11-12 19:01:29', 'asdasdasd', 'Asalto', 198),
(136, 764, '2023-11-13 21:43:38', '2023-11-13 21:45:14', 'evento 1', 'Asalto', 2),
(137, 764, '2023-11-14 00:43:38', '2023-11-13 21:45:34', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal mane', 'Asalto', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialestado`
--

CREATE TABLE `historialestado` (
  `id` int(11) NOT NULL,
  `idCamara` int(11) NOT NULL,
  `idEstadoCamara` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historialestado`
--

INSERT INTO `historialestado` (`id`, `idCamara`, `idEstadoCamara`, `fechaInicio`, `fechaFin`) VALUES
(187, 196, 2, '2023-11-12 03:58:49', '0000-00-00 00:00:00'),
(188, 197, 2, '2023-11-12 03:58:49', '0000-00-00 00:00:00'),
(189, 198, 2, '2023-11-12 03:58:52', '0000-00-00 00:00:00'),
(190, 199, 2, '2023-11-12 03:58:52', '0000-00-00 00:00:00'),
(191, 196, 1, '2023-11-12 03:59:17', '0000-00-00 00:00:00'),
(192, 196, 2, '2023-11-12 03:59:43', '0000-00-00 00:00:00'),
(193, 197, 1, '2023-11-12 04:01:49', '0000-00-00 00:00:00'),
(194, 197, 2, '2023-11-12 04:05:49', '0000-00-00 00:00:00'),
(195, 199, 1, '2023-11-12 04:07:46', '0000-00-00 00:00:00'),
(196, 199, 2, '2023-11-12 04:08:10', '0000-00-00 00:00:00'),
(197, 199, 1, '2023-11-12 04:16:38', '0000-00-00 00:00:00'),
(198, 198, 1, '2023-11-12 04:21:08', '0000-00-00 00:00:00'),
(199, 198, 2, '2023-11-12 04:27:07', '0000-00-00 00:00:00'),
(200, 198, 1, '2023-11-12 04:27:26', '0000-00-00 00:00:00'),
(201, 198, 2, '2023-11-12 04:32:09', '0000-00-00 00:00:00'),
(202, 198, 1, '2023-11-12 04:32:34', '0000-00-00 00:00:00'),
(203, 199, 2, '2023-11-12 04:34:19', '0000-00-00 00:00:00'),
(204, 199, 1, '2023-11-12 04:34:59', '0000-00-00 00:00:00'),
(205, 199, 1, '2023-11-12 04:35:04', '0000-00-00 00:00:00'),
(206, 199, 2, '2023-11-12 04:35:09', '0000-00-00 00:00:00'),
(207, 199, 2, '2023-11-12 04:35:14', '0000-00-00 00:00:00'),
(208, 198, 2, '2023-11-12 04:35:47', '0000-00-00 00:00:00'),
(209, 198, 1, '2023-11-12 04:35:53', '0000-00-00 00:00:00'),
(210, 198, 2, '2023-11-12 04:35:58', '0000-00-00 00:00:00'),
(211, 198, 1, '2023-11-12 04:36:38', '0000-00-00 00:00:00'),
(212, 198, 1, '2023-11-12 04:36:56', '0000-00-00 00:00:00'),
(213, 198, 2, '2023-11-12 04:37:03', '0000-00-00 00:00:00'),
(214, 198, 2, '2023-11-12 04:39:52', '0000-00-00 00:00:00'),
(215, 198, 1, '2023-11-12 04:39:55', '0000-00-00 00:00:00'),
(216, 198, 2, '2023-11-12 04:40:09', '0000-00-00 00:00:00'),
(217, 198, 1, '2023-11-12 04:40:19', '0000-00-00 00:00:00'),
(218, 198, 1, '2023-11-12 04:40:25', '0000-00-00 00:00:00'),
(219, 198, 1, '2023-11-12 04:40:29', '0000-00-00 00:00:00'),
(220, 198, 2, '2023-11-12 04:40:31', '0000-00-00 00:00:00'),
(221, 198, 2, '2023-11-12 04:40:34', '0000-00-00 00:00:00'),
(222, 198, 1, '2023-11-12 04:41:02', '0000-00-00 00:00:00'),
(223, 198, 2, '2023-11-12 04:41:05', '0000-00-00 00:00:00'),
(224, 198, 1, '2023-11-12 04:41:08', '0000-00-00 00:00:00'),
(225, 198, 2, '2023-11-12 04:41:23', '0000-00-00 00:00:00'),
(226, 198, 1, '2023-11-12 04:41:26', '0000-00-00 00:00:00'),
(227, 200, 2, '2023-11-12 19:36:33', '0000-00-00 00:00:00'),
(228, 201, 2, '2023-11-12 19:36:33', '0000-00-00 00:00:00'),
(229, 202, 2, '2023-11-12 19:36:35', '0000-00-00 00:00:00'),
(230, 203, 2, '2023-11-12 19:36:35', '0000-00-00 00:00:00'),
(231, 204, 2, '2023-11-12 19:36:36', '0000-00-00 00:00:00'),
(232, 205, 2, '2023-11-12 19:36:36', '0000-00-00 00:00:00'),
(233, 206, 2, '2023-11-12 19:36:36', '0000-00-00 00:00:00'),
(234, 207, 2, '2023-11-12 19:36:36', '0000-00-00 00:00:00'),
(235, 208, 2, '2023-11-12 19:36:37', '0000-00-00 00:00:00'),
(236, 209, 2, '2023-11-12 19:36:37', '0000-00-00 00:00:00'),
(237, 210, 2, '2023-11-12 19:36:37', '0000-00-00 00:00:00'),
(238, 211, 2, '2023-11-12 19:36:37', '0000-00-00 00:00:00'),
(239, 212, 2, '2023-11-12 19:36:37', '0000-00-00 00:00:00'),
(240, 213, 2, '2023-11-12 19:36:37', '0000-00-00 00:00:00'),
(241, 214, 2, '2023-11-12 19:36:38', '0000-00-00 00:00:00'),
(242, 215, 2, '2023-11-12 19:36:38', '0000-00-00 00:00:00'),
(243, 216, 2, '2023-11-12 19:36:38', '0000-00-00 00:00:00'),
(244, 217, 2, '2023-11-12 19:36:38', '0000-00-00 00:00:00'),
(245, 218, 2, '2023-11-12 19:36:38', '0000-00-00 00:00:00'),
(246, 219, 2, '2023-11-12 19:36:38', '0000-00-00 00:00:00'),
(247, 220, 2, '2023-11-12 19:36:51', '0000-00-00 00:00:00'),
(248, 221, 2, '2023-11-12 19:36:51', '0000-00-00 00:00:00'),
(249, 222, 2, '2023-11-12 19:36:53', '0000-00-00 00:00:00'),
(250, 223, 2, '2023-11-12 19:36:53', '0000-00-00 00:00:00'),
(251, 224, 2, '2023-11-12 19:36:54', '0000-00-00 00:00:00'),
(252, 225, 2, '2023-11-12 19:36:54', '0000-00-00 00:00:00'),
(253, 226, 2, '2023-11-12 19:36:54', '0000-00-00 00:00:00'),
(254, 227, 2, '2023-11-12 19:36:54', '0000-00-00 00:00:00'),
(255, 228, 2, '2023-11-12 19:36:55', '0000-00-00 00:00:00'),
(256, 229, 2, '2023-11-12 19:36:55', '0000-00-00 00:00:00'),
(257, 230, 2, '2023-11-12 19:36:55', '0000-00-00 00:00:00'),
(258, 231, 2, '2023-11-12 19:36:55', '0000-00-00 00:00:00'),
(259, 232, 2, '2023-11-12 19:36:55', '0000-00-00 00:00:00'),
(260, 233, 2, '2023-11-12 19:36:55', '0000-00-00 00:00:00'),
(261, 234, 2, '2023-11-12 19:36:56', '0000-00-00 00:00:00'),
(262, 235, 2, '2023-11-12 19:36:56', '0000-00-00 00:00:00'),
(263, 236, 2, '2023-11-12 19:36:56', '0000-00-00 00:00:00'),
(264, 237, 2, '2023-11-12 19:36:56', '0000-00-00 00:00:00'),
(265, 238, 2, '2023-11-12 19:36:56', '0000-00-00 00:00:00'),
(266, 239, 2, '2023-11-12 19:36:56', '0000-00-00 00:00:00'),
(267, 240, 2, '2023-11-12 19:36:57', '0000-00-00 00:00:00'),
(268, 241, 2, '2023-11-12 19:36:57', '0000-00-00 00:00:00'),
(269, 242, 2, '2023-11-12 19:36:57', '0000-00-00 00:00:00'),
(270, 243, 2, '2023-11-12 19:36:57', '0000-00-00 00:00:00'),
(271, 244, 2, '2023-11-12 19:36:57', '0000-00-00 00:00:00'),
(272, 245, 2, '2023-11-12 19:36:57', '0000-00-00 00:00:00'),
(273, 246, 2, '2023-11-12 19:36:58', '0000-00-00 00:00:00'),
(274, 247, 2, '2023-11-12 19:36:58', '0000-00-00 00:00:00'),
(275, 248, 2, '2023-11-12 19:36:58', '0000-00-00 00:00:00'),
(276, 249, 2, '2023-11-12 19:36:58', '0000-00-00 00:00:00'),
(277, 250, 2, '2023-11-12 19:36:58', '0000-00-00 00:00:00'),
(278, 251, 2, '2023-11-12 19:36:58', '0000-00-00 00:00:00'),
(279, 252, 2, '2023-11-12 19:36:59', '0000-00-00 00:00:00'),
(280, 253, 2, '2023-11-12 19:36:59', '0000-00-00 00:00:00'),
(281, 254, 2, '2023-11-12 19:36:59', '0000-00-00 00:00:00'),
(282, 255, 2, '2023-11-12 19:36:59', '0000-00-00 00:00:00'),
(283, 256, 2, '2023-11-12 19:36:59', '0000-00-00 00:00:00'),
(284, 257, 2, '2023-11-12 19:36:59', '0000-00-00 00:00:00'),
(285, 258, 2, '2023-11-12 19:37:00', '0000-00-00 00:00:00'),
(286, 259, 2, '2023-11-12 19:37:00', '0000-00-00 00:00:00'),
(287, 260, 2, '2023-11-12 19:37:00', '0000-00-00 00:00:00'),
(288, 261, 2, '2023-11-12 19:37:00', '0000-00-00 00:00:00'),
(289, 262, 2, '2023-11-12 19:37:00', '0000-00-00 00:00:00'),
(290, 263, 2, '2023-11-12 19:37:00', '0000-00-00 00:00:00'),
(291, 264, 2, '2023-11-12 19:37:01', '0000-00-00 00:00:00'),
(292, 265, 2, '2023-11-12 19:37:01', '0000-00-00 00:00:00'),
(293, 266, 2, '2023-11-12 19:37:01', '0000-00-00 00:00:00'),
(294, 267, 2, '2023-11-12 19:37:01', '0000-00-00 00:00:00'),
(295, 268, 2, '2023-11-12 19:37:01', '0000-00-00 00:00:00'),
(296, 269, 2, '2023-11-12 19:37:01', '0000-00-00 00:00:00'),
(297, 270, 2, '2023-11-12 19:37:02', '0000-00-00 00:00:00'),
(298, 271, 2, '2023-11-12 19:37:02', '0000-00-00 00:00:00'),
(299, 272, 2, '2023-11-12 19:37:02', '0000-00-00 00:00:00'),
(300, 273, 2, '2023-11-12 19:37:02', '0000-00-00 00:00:00'),
(301, 274, 2, '2023-11-12 19:37:02', '0000-00-00 00:00:00'),
(302, 275, 2, '2023-11-12 19:37:02', '0000-00-00 00:00:00'),
(303, 276, 2, '2023-11-12 19:37:03', '0000-00-00 00:00:00'),
(304, 277, 2, '2023-11-12 19:37:03', '0000-00-00 00:00:00'),
(305, 278, 2, '2023-11-12 19:37:03', '0000-00-00 00:00:00'),
(306, 279, 2, '2023-11-12 19:37:03', '0000-00-00 00:00:00'),
(307, 280, 2, '2023-11-12 19:37:03', '0000-00-00 00:00:00'),
(308, 281, 2, '2023-11-12 19:37:03', '0000-00-00 00:00:00'),
(309, 272, 1, '2023-11-12 19:40:03', '0000-00-00 00:00:00'),
(310, 200, 1, '2023-11-12 19:40:43', '0000-00-00 00:00:00'),
(311, 199, 1, '2023-11-12 19:41:03', '0000-00-00 00:00:00'),
(322, 198, 2, '2023-11-12 22:32:40', '0000-00-00 00:00:00'),
(323, 196, 1, '2023-11-12 23:08:05', '0000-00-00 00:00:00'),
(324, 199, 1, '2023-11-13 00:45:27', '0000-00-00 00:00:00'),
(325, 199, 1, '2023-11-13 00:45:28', '0000-00-00 00:00:00'),
(326, 199, 1, '2023-11-13 00:45:29', '0000-00-00 00:00:00'),
(327, 292, 2, '2023-11-13 05:35:00', '0000-00-00 00:00:00'),
(328, 1, 2, '2023-11-13 06:08:04', '0000-00-00 00:00:00'),
(329, 2, 1, '2023-11-13 06:09:01', '0000-00-00 00:00:00'),
(330, 2, 2, '2023-11-13 06:09:09', '0000-00-00 00:00:00'),
(331, 3, 1, '2023-11-13 06:18:34', '0000-00-00 00:00:00'),
(332, 4, 2, '2023-11-13 06:19:09', '0000-00-00 00:00:00'),
(333, 5, 2, '2023-11-13 06:19:32', '0000-00-00 00:00:00'),
(334, 6, 2, '2023-11-13 06:20:24', '0000-00-00 00:00:00'),
(335, 10, 2, '2023-11-13 06:21:38', '0000-00-00 00:00:00'),
(336, 8, 2, '2023-11-13 06:22:23', '0000-00-00 00:00:00'),
(337, 9, 2, '2023-11-13 06:23:11', '0000-00-00 00:00:00'),
(338, 12, 1, '2023-11-13 06:23:59', '0000-00-00 00:00:00'),
(339, 11, 2, '2023-11-13 06:23:59', '0000-00-00 00:00:00'),
(340, 17, 2, '2023-11-13 17:28:48', '0000-00-00 00:00:00'),
(341, 1, 1, '2023-11-13 17:37:20', '0000-00-00 00:00:00'),
(342, 29, 2, '2023-11-13 17:49:57', '0000-00-00 00:00:00'),
(343, 30, 2, '2023-11-13 17:50:48', '0000-00-00 00:00:00'),
(344, 31, 2, '2023-11-13 17:51:19', '0000-00-00 00:00:00'),
(345, 32, 2, '2023-11-13 17:55:22', '0000-00-00 00:00:00'),
(346, 33, 1, '2023-11-13 17:55:28', '0000-00-00 00:00:00'),
(347, 200, 2, '2023-11-13 20:31:04', '0000-00-00 00:00:00'),
(348, 2, 1, '2023-11-13 20:32:47', '0000-00-00 00:00:00'),
(349, 4, 1, '2023-11-13 20:35:30', '0000-00-00 00:00:00'),
(350, 4, 2, '2023-11-13 20:35:48', '0000-00-00 00:00:00'),
(351, 4, 1, '2023-11-13 20:36:06', '0000-00-00 00:00:00'),
(352, 4, 2, '2023-11-13 20:36:58', '0000-00-00 00:00:00'),
(353, 4, 1, '2023-11-13 20:38:58', '0000-00-00 00:00:00'),
(354, 4, 2, '2023-11-13 20:55:22', '0000-00-00 00:00:00'),
(355, 4, 1, '2023-11-13 20:56:07', '0000-00-00 00:00:00'),
(356, 4, 2, '2023-11-13 20:56:19', '0000-00-00 00:00:00'),
(357, 3, 2, '2023-11-13 21:45:51', '0000-00-00 00:00:00'),
(358, 1, 3, '2023-11-13 21:48:50', '0000-00-00 00:00:00'),
(359, 200, 3, '2023-11-15 22:35:45', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(11) NOT NULL,
  `responsable` varchar(30) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(250) NOT NULL,
  `descripcion` varchar(1200) NOT NULL,
  `id_camara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`id`, `responsable`, `fecha_creacion`, `fecha`, `tipo`, `descripcion`, `id_camara`) VALUES
(743, 'Diego Espinoza', '2023-11-12 04:18:35', '2023-11-12 07:18:18', 'Asalto', 'asdasdasd', 198),
(744, 'Diego Espinoza', '2023-11-12 19:01:29', '2023-11-12 10:18:26', 'Asalto', 'asdasdasd', 199),
(747, 'Operario 1', '2023-11-13 00:01:39', '2023-11-13 00:01:39', 'Asalto', 'asdasdasd', 199),
(756, 'Operario 1', '2023-11-13 06:03:06', '2023-11-13 06:03:06', 'Asalto', 'sasd', 199),
(757, 'Operario 1', '2023-11-13 06:03:09', '2023-11-13 06:03:09', 'Asalto', 'sasd', 199),
(758, 'Operario 1', '2023-11-13 06:03:20', '2023-11-13 06:03:20', 'Asalto', 'diego', 199),
(759, 'Operario 1', '2023-11-13 06:18:52', '2023-11-13 06:18:52', 'Asalto', 'asdasd', 1),
(760, 'Operario 1', '2023-11-13 20:57:03', '2023-11-13 20:57:03', 'Asalto', '123123', 2),
(761, 'Operario 1', '2023-11-13 21:14:26', '2023-11-13 21:14:26', 'Asalto', '123123', 2),
(762, 'Operario 1', '2023-11-13 21:14:30', '2023-11-13 21:14:30', 'Asalto', '123123sad', 2),
(763, 'Operario 1', '2023-11-13 21:14:32', '2023-11-13 21:14:32', 'Asalto', '123123sad', 2),
(764, 'Operario 1', '2023-11-13 21:45:34', '2023-11-14 03:43:38', 'Asalto', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas \"Letraset\", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', 3),
(765, 'Operario 1', '2023-11-15 21:54:00', '2023-11-15 21:54:00', 'Asalto', 'assdasdas', 1),
(766, 'Operario 1', '2023-11-15 22:10:36', '2023-11-15 22:10:36', 'Ilicito', 'asdasd', 1),
(767, 'Operario 1', '2023-11-15 22:36:05', '2023-11-15 22:36:05', 'Asalto', 'sdsadasdas', 1),
(768, 'Operario 1', '2023-11-15 22:38:07', '2023-11-15 22:38:07', 'Asalto', 'sdadasdasasdasd', 1),
(769, 'Operario 1', '2023-11-15 22:38:09', '2023-11-15 22:38:09', 'Asalto', 'sdadasdasasdasd', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`username`, `password`, `rol`) VALUES
('admin', 'admin', 'Admin'),
('Diego', 'Diego', 'Operario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camara`
--
ALTER TABLE `camara`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadocamara`
--
ALTER TABLE `estadocamara`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_registro` (`id_registro`);

--
-- Indices de la tabla `historialestado`
--
ALTER TABLE `historialestado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCamara` (`idCamara`,`idEstadoCamara`),
  ADD KEY `idEstadoCamara` (`idEstadoCamara`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_camara` (`id_camara`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `camara`
--
ALTER TABLE `camara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

--
-- AUTO_INCREMENT de la tabla `estadocamara`
--
ALTER TABLE `estadocamara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `historialestado`
--
ALTER TABLE `historialestado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=770;

--
-- AUTO_INCREMENT de la tabla `users`
--

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historialestado`
--
ALTER TABLE `historialestado`
  ADD CONSTRAINT `historialestado_ibfk_1` FOREIGN KEY (`idCamara`) REFERENCES `camara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historialestado_ibfk_2` FOREIGN KEY (`idEstadoCamara`) REFERENCES `estadocamara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `registros_ibfk_1` FOREIGN KEY (`id_camara`) REFERENCES `camara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
