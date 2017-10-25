-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-10-2017 a las 07:43:09
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quickmatch`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcateg` int(11) NOT NULL,
  `idtiponeg` int(11) NOT NULL,
  `categ` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcateg`, `idtiponeg`, `categ`) VALUES
(1, 1, 'Birria'),
(2, 2, 'Buffete'),
(3, 3, 'Carnes y cortes'),
(4, 4, 'Cochinita pibil'),
(5, 5, 'Comida China'),
(6, 6, 'Comida Italiana'),
(7, 7, 'Comida Japonesa'),
(8, 8, 'Comida Mexicana'),
(9, 9, 'Comida rapida'),
(10, 10, 'Comida Regional'),
(11, 11, 'Gastronomia Internacional'),
(12, 12, 'Gorditas'),
(13, 1, 'Mariscos'),
(14, 2, 'Panaderia Artesanal'),
(15, 3, 'Parrilla'),
(16, 4, 'Pizza'),
(17, 5, 'Restaurante'),
(18, 6, 'Pollo'),
(19, 7, 'Saludable'),
(20, 8, 'Tortas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idestado` int(11) NOT NULL,
  `idpais` int(11) DEFAULT NULL,
  `nom_est` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `idpais`, `nom_est`) VALUES
(1, 1, 'Aguascalientes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `idmun` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  `nom_mun` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`idmun`, `idestado`, `nom_mun`) VALUES
(1, 1, 'Aguascalientes'),
(2, 1, 'Asientos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL,
  `nom_pais` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `nom_pais`) VALUES
(1, 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferences`
--

CREATE TABLE `preferences` (
  `id_preference` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `json_preferences` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `preferences`
--

INSERT INTO `preferences` (`id_preference`, `id_user`, `json_preferences`) VALUES
(1, 2, '10, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11'),
(2, 1, '10, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11'),
(3, 3, '7, 8, 10, 12, 1, 3, 5, 2, 4, 6, 9, 11'),
(4, 4, '6, 1, 2, 3, 4, 5, 7, 9, 10, 11, 12, 8'),
(5, 5, '4, 7, 9, 11, 2, 3, 5, 8, 10, 12, 1, 6'),
(6, 6, '5, 1, 4, 7, 8, 2, 3, 6, 9, 10, 11, 12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idprod` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `imagen` varchar(300) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `idsucursal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idprod`, `nombre`, `descripcion`, `imagen`, `precio`, `idsucursal`) VALUES
(1, 'mole', 'mole tradicional', '<esaf<aef', 123, 1),
(2, 'com', 'computadora.jpg', 'okaoaks', 200, 2),
(3, 'carara', 'camara 18mp', 'camara.jpg', 123, 3),
(4, 'asdfadasd', 'asdaffarwbrWA AEWRTTJ D', 'camara.jpg', 1203, 4),
(5, 'trwrtvw', 'wetsregsnwgwenfdwgerf', 'computadora.jpg', 1000, 5),
(6, 'adswadasd', 'camara 18mp', 'camara.jpg', 200, 2),
(7, 'sdgsdg', 'sdgsdg', 'camara.jpg', 213, 3),
(8, 'sdgsdg', 'sdgsdg', 'camara.jpg', 213, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `idreser` int(11) NOT NULL,
  `hora` timestamp NULL DEFAULT NULL,
  `idprod` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `costo` int(11) NOT NULL,
  `personas` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suctipca`
--

CREATE TABLE `suctipca` (
  `issucursal` int(11) NOT NULL,
  `idpitoneg` int(11) NOT NULL,
  `idcateg` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL,
  `nom_sucursal` varchar(25) NOT NULL,
  `nom_encargado` varchar(30) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `calle` varchar(500) NOT NULL,
  `noext` int(11) NOT NULL,
  `noitn` int(11) NOT NULL,
  `fracc` int(11) NOT NULL,
  `cp` int(11) NOT NULL,
  `mun` int(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `img1` varchar(50) NOT NULL,
  `img2` varchar(50) NOT NULL,
  `img3` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `correo_contacto` varchar(30) NOT NULL,
  `horario` varchar(100) NOT NULL,
  `idprod` int(11) NOT NULL,
  `idtiopneg` int(11) NOT NULL,
  `id_tipous` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_etiquetas` int(11) NOT NULL,
  `idmun` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idsucursal`, `nom_sucursal`, `nom_encargado`, `direccion`, `calle`, `noext`, `noitn`, `fracc`, `cp`, `mun`, `telefono`, `img1`, `img2`, `img3`, `descripcion`, `correo_contacto`, `horario`, `idprod`, `idtiopneg`, `id_tipous`, `id_servicio`, `id_etiquetas`, `idmun`) VALUES
(2, 'Yambak Bar', 'null', 'Andador Paseo Arturo J. Pani 112, Barrio de San Marcos, 20000 Aguascalientes, Ags., Mexico', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5631.5463046963905!2d-102.30169747438528!3d21.876100066414878!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa67935ef5998e6bf!2sPalenque+de+la+Feria+Nacional+de+San+Marcos!5e0!3m2!1ses-419!2smx!4v1494353382305\" width=\"800\" height=\"600\" frameborder=\"0\" style=\"border:0\" allowfullscreen=\"\"></iframe>', 0, 0, 0, 0, 0, '+52 449 916 0969', '', '', '', '', 'yambak@hotmail.com', 'lunes-martes=cerrado  miercoles-jueves=14-2  viernes-sabado=14-4  domingo=14-1\r', 0, 1, 0, 0, 0, 1),
(3, 'Hasta Atras Bar', 'null', '\"Purisima 3, San Jose Aculco, 20000 Mexico, D.F., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 994 0459', '', '', '', '', '', 'lunes-domingo=18-2\r', 0, 1, 0, 0, 0, 1),
(4, 'Hooligan\'s Neighborhood P', 'null', '\"20020, Calle Gral. Ignacio Zaragoza 1601, Circunvalacion Nte., 20020 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 919 6547', '', '', '', '', 'hooligans_pub@hotmail.com', 'miercoles-domingo=18-2  lunes-martes=cerrado\r', 0, 1, 0, 0, 0, 1),
(5, 'San Pancho', 'null', '\"Av. Las Americas 102, Las Americas, 20230 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 918 4853', '', '', '', '', '', 'lunes-domingo=13-2\r', 0, 2, 0, 0, 0, 1),
(6, 'Merendero San Marcos', 'null', '\"De La Feria 144, Barrio de San Marcos, 20070 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 918 1928', '', '', '', '', '', 'lunes-domingo=13-3\r', 0, 2, 0, 0, 0, 1),
(7, 'Merendero Kiko\'s', 'null', '\"Calle Arturo Pani 132, Barrio de San Marcos, 20070 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 916 2191', '', '', '', '', 'jmanueldeanda@yahoo.com', 'lunes-domingo=12-2\r', 0, 2, 0, 0, 0, 1),
(8, 'Merendero Don Chendo', 'null', '\"Andador Arturo J. Pani 130, Barrio de San Marcos, 20070 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 916 1680', '', '', '', '', '', 'lunes-domingo=13-2\r', 0, 3, 0, 0, 0, 1),
(9, 'St. James Irish Pub', 'null', '\"Av Independencia 1872, Jardines de la Concepcion II, Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'martes-sabado=17-2  domingo=14-24  lunes=cerrado\r', 0, 3, 0, 0, 0, 1),
(10, 'El Tunel', 'null', '\"Av Independencia, Jardines de La Concepcion, Jardines de la Concepcion II, 20120 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'jueves-sabado=21-2  domingo-miercoles=cerrado\r', 0, 3, 0, 0, 0, 1),
(11, 'Merendero San Pancho', 'null', '\"Francisco G. Hornedo 715, Barrio de la Purisima, 20259 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 993 0006', '', '', '', '', 'merenderomsp@gmail.com', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(12, 'Merendero San Pancho', 'null', '\"Luis Donaldo Colosio 635, Jardines de la Concepcion, Jardines de la Concepcion II, 20120 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 993 0006', '', '', '', '', 'merenderomsp@gmail.com', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(13, 'Yermanelas ', 'null', '\"Av. Francisco I. Madero 462, Zona Centro, 20000 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 448 6331', '', '', '', '', '', 'miercoles-sabado=20-2  domingo-martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(14, 'MashUp Bar', 'null', '\"Paseo de los Chicahuales 1004, Corral de Barrancos, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-miercoles=16-1  jueves-sabado=16-2  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(15, 'RedBeach Bar', 'null', '\"Avenida Universidad 1209, Los Bosques, 20120 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '9961241', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(16, 'the rock', 'null', '\"De La Feria 106, Barrio de San Marcos, Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'jueves-domingo=18-3  lunes-miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(17, 'RocknRolla', 'null', '\"Av Aguascalientes Nte 421, Bosques del Prado Sur, 20130 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 110 8449', '', '', '', '', '', 'miercoles-sabado=19-2  domingo-martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(18, 'Circus Bar', 'null', '\"Av de la Convencion de 1914 Ote 102, Sta Anita 1ra Secc, 20169 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 266 6104', '', '', '', '', 'mayaxel02@hotmail.com', 'lunes-domingo=16-2\r', 0, 0, 0, 0, 0, 0),
(19, 'Bull Rock\'s', 'null', '\"Avenida Lic Adolfo Lopez Mateos Poniente, 20220 Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(20, 'El Aleman', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 1721, Lomas del Campestre I, Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '01 449 211 6235', '', '', '', '', 'info@elaleman.co.tv', 'lunes-domingo=14-2\r', 0, 0, 0, 0, 0, 0),
(21, 'La ultima Luna', 'null', '\"Av. Las Americas 501, La Fuente, 20239 Aguascalientes, Ags., Mexico\"', '', 0, 0, 0, 0, 0, '914.4840 y 914.2895', '', '', '', '', 'laultimaluna@grupoultimaluna.m', 'jueves-sabado=21:30-5\r', 0, 0, 0, 0, 0, 0),
(22, 'La ultima Luna', 'null', '\"Av. Luis Donaldo Colosio #1711, 20129 Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '914.4840 y 914.2895', '', '', '', '', 'laultimaluna@grupoultimaluna.m', 'jueves-sabado=21:30-5\r', 0, 0, 0, 0, 0, 0),
(23, 'SHAMROCK BAR', 'null', '\"Av. Hacienda de Ojocaliente 103, Haciendas de Aguascalientes, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, ' 01 449 120 4816', '', '', '', '', 'sarai_zurita@hotmail.com', 'miercoles-jueves=17-2  viernes-domingo=17-4  lunes-martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(24, 'Bar El Tio Sam', 'null', '\"Av de la Convencion de 1914 Ote 103, Jardines de la Cruz, 20250 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 970 7249', '', '', '', '', '', 'lunes-domingo=11-23:30\r', 0, 0, 0, 0, 0, 0),
(25, 'La Bola de Pelos Bar', 'null', '\"Local 10 y 13, Plaza Bona Gens, Bona Gens, 20255 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 266 5436', '', '', '', '', '', 'lunes-domingo=12:30-2\r', 0, 0, 0, 0, 0, 0),
(26, 'LOS ORGANITOS', 'null', '\"Av Siglo XXI 822, Ojocaliente Inegi, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(27, 'Mi Canton Bar', 'null', '\"Poder Legislativo 210, Zona Centro, 20259 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 916 4858', '', '', '', '', '', 'lunes-sabado=10:45-1   domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(28, 'Los Adobes', 'null', '\"Av Gabriela Mistral 1001, Fraccionamiento Lomas de Santa Anita, 20164 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 329 1997', '', '', '', '', '', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(29, 'Nacional Bar', 'null', '\"Av. Francisco I. Madero 468, Centro, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 238 3362', '', '', '', '', '', 'lunes-domingo=17-2\r', 0, 0, 0, 0, 0, 0),
(30, 'Una Copa Mas Bar', 'null', '\"General Miguel Barragan 401, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=10-1 domingo=10-20\r', 0, 0, 0, 0, 0, 0),
(31, 'EL REMOLINO', 'null', '\"Dr. Geronimo de Orozco 306, Centro, Gremial, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 915 9080', '', '', '', '', '', 'lunes-domingo=10-14\r', 0, 0, 0, 0, 0, 0),
(32, 'Woodstock Bar', 'null', '\"Venustiano Carranza 205, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, ' 01 449 175 0032', '', '', '', '', 'greatwoodstock@gmail.com', 'martes-jueves y domingo=18-2   viernes-sabado=18-3  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(33, 'BEAR BAR CASA DANZANTE', 'null', '\"Hospitalidad 109, Zona Centro, 20000 Aguascalientes Ags, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 0026', '', '', '', '', '', 'miercoles-domingo=19-2  lunes-martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(34, 'Chicago\'s Bar', 'null', '\"Av de la Convencion de 1914 Sur 1225, Ojo de Agua, 20260 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '449-9151721', '', '', '', '', '', 'jueves-domingo=21-2  lunes-miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(35, 'Salon Aguascalientes Bar', 'null', '\"Jesus Maria Rodriguez 403, Altavista, 20040 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 6591', '', '', '', '', '', 'lunes-sabado=10-1 domingo=CERRADO\r', 0, 0, 0, 0, 0, 0),
(36, 'El Yonke', 'null', '\"Av. Las Americas 1008, Las Americas, 20230 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '044 449 107 2827', '', '', '', '', '', 'miercoles-sabado=18-3  domingo-martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(37, 'La Cantina de Antaño', 'null', '\"Av Heroe de Nacozari 2500, Jardines del Parque, 20276 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 913 4289', '', '', '', '', 'la_cantina@hotmail.es', 'lunes-domingo=13:30-2\r', 0, 0, 0, 0, 0, 0),
(38, 'Big Ben Social Club', 'null', '\"Venustiano Carranza 209, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 494 8664', '', '', '', '', '', 'viernes-sabado=9:30-2:45 domingo-miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(39, '308 Bar', 'null', '\"Av. Francisco I. Madero, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 235 6466', '', '', '', '', '', 'lunes-sabado=17-2  domingo=cerrado \r', 0, 0, 0, 0, 0, 0),
(40, 'Santorum Bistro Bar', 'null', '\"Venustiano Carranza 301-A, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 239 5442', '', '', '', '', '', 'jueves-sabado=19-3  martes-miercoles=19-2  domingo=19-0  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(41, 'Venustiana Bar', 'null', '\"Venustiano Carranza 208, Col. Centro, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 555 2849', '', '', '', '', '', 'martes-domingo=18-2   lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(42, 'Las Cananas', 'null', '\"Av Heroe de Nacozari 2428 local 3, Rinconada del Parque, Residencial del Parque, 20277 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 145 2015', '', '', '', '', 'cananasags@hotmail.com', 'lunes-jueves=18-2   viernes-sabado=18-4  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(43, 'YardAGS', 'null', '\"De La Feria 113, Barrio de San Marcos, 20070 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 916 0364', '', '', '', '', 'yardags@hotmail.com', '\r', 0, 0, 0, 0, 0, 0),
(44, ' Barrio Santo', 'null', '\"Venustiano Carranza 212, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 155 4638', '', '', '', '', '', 'jueves-sabado=18-3  lunes-miercoles=18-2  domingo=15-1 \r', 0, 0, 0, 0, 0, 0),
(45, 'Republica Bar', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 324, Valle de las Trojes, 20129 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 5615', '', '', '', '', 'pr_abogados_ags@hotmail.com', 'lunes-miercoles=cerrado   jueves-viernes=18-2  sabado=18-3   domingo=14-21\r', 0, 0, 0, 0, 0, 0),
(46, 'BAKANO', 'null', '\"Av Paseo de la Cruz 501, Barrio del Encino, 20240 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '44900999', '', '', '', '', '', 'lunes-viernes=17-2   sabado=17-3   domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(47, 'Leyendas Bar', 'null', '\"Av Heroe de Nacozari 2420, Residencial del Parque, 20277 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(48, 'el barranqueño', 'null', '\"Los Laureles 808, Las Flores, 20220 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(49, 'Pullman -Danceteria Stage', 'null', '\"Calle Gral. Ignacio Zaragoza 106, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, ' 01 449 807 6339', '', '', '', '', '', 'martes-sabado=19-3   domingo-lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(50, 'Nitro Bar', 'null', '\"Av de la Convencion de 1914 Poniente 613, San Marcos, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 9069', '', '', '', '', '', 'lunes-domingo=5-2\r', 0, 0, 0, 0, 0, 0),
(51, 'La Mexico', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 325, Jardines de la Concepcion I, 20120 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 251 3939', '', '', '', '', '', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(52, 'Las Palomas Mezcaleria', 'null', '\"Venustiano Carranza 225, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 274 6258', '', '', '', '', 'lapalomamezcal@hotmail.es', 'lunes-domingo=17-4\r', 0, 0, 0, 0, 0, 0),
(53, 'hormiguero-bar', 'null', '\"av. Aguascalientes pte #1674 esquina con av. cedazo, La España, 20999 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 258 9660', '', '', '', '', '', 'lunes-viernes=19-2  sabado-domingo=16-2\r', 0, 0, 0, 0, 0, 0),
(54, 'LA EPOCA DEL Recuerdo', 'null', '\"Avenida Ayuntamiento 319, Lindavista, 20270 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 216 2046', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(55, 'La Bola 11', 'null', '\"Av Siglo XXI 601, Morelos II, 20298 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 106 2935', '', '', '', '', '', 'lunes-domingo=14-2\r', 0, 0, 0, 0, 0, 0),
(56, 'EL PALENQUE', 'null', '\"Benjamin de La Mora 137, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=10:30-21  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(57, 'Barrock', 'null', '\"Universidad 1727, Granjas del Campestre, Lomas del Campestre I, 20129 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 4840', '', '', '', '', '', 'jueves-sabado=21:30-3  domingo-miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(58, 'Michelodias', 'null', 'Avenida de la Convencion de 1914 sur', '', 0, 0, 0, 0, 0, ' 01 449 203 1201', '', '', '', '', '', 'lunes-domingo=15-2\r', 0, 0, 0, 0, 0, 0),
(59, 'MERENDERO El Chapu', 'null', '\"Corregidora 429, Morelos I, 20298 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, ' 01 449 977 0961', '', '', '', '', '', 'lunes-domingo=15-2\r', 0, 0, 0, 0, 0, 0),
(61, 'null', '\"De La Feria 135, Barrio de Sa', '01 449 916 2883', '', 0, 0, 0, 0, 0, 'bar', '', '', '', '', 'https://www.facebook.com/pages', '', 0, 0, 0, 0, 0, 0),
(62, 'Pepinos Bar', 'null', '\"Av. Convencion de 1914 Pte., Residencial del Valle I, 20080 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 915 5041', '', '', '', '', '', 'lunes-domingo=16-2\r', 0, 0, 0, 0, 0, 0),
(63, 'LA POPULAR', 'null', '\"Universidad 1725, Lomas del Campestre I, 20129 Aguascalientes, AGS\"', '', 0, 0, 0, 0, 0, '01 449 914 4840', '', '', '', '', 'lapopular@grupoultimaluna.mx', 'martes-sabado=13-2   domingo-lunes=cerrado   \r', 0, 0, 0, 0, 0, 0),
(64, 'La Barranca Bar', 'null', '\"Los Laureles 706, Las Flores, 20220 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '449160875', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(65, 'Mundo Corona', 'null', '\"Av Aguascalientes Sur 404, Jardines de la Asuncion, 20270 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 235 6384', '', '', '', '', '', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(66, 'Barezzito', 'null', '\"Avenida Luis Donaldo Colosio 602 Local 10, Villas de San Nicolas, 20115 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 844 893 8706', '', '', '', '', 'barezzito.aguascalientes@gmail', 'miercoles-sabado=19-3   domingo-martes=-cerrado\r', 0, 0, 0, 0, 0, 0),
(67, 'LA VAQUITA LOCA', 'null', '\"Manzano 310, Circunvalacion Poniente, 20210 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '994-20-51', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(68, 'Seven Sins', 'null', '\"Av de la Convencion de 1914 Sur No.903, Santa Elena, 20230 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '044 449 326 4649', '', '', '', '', '', 'domingo-jueves=14-2    viernes-sabado=cerrado\r', 0, 0, 0, 0, 0, 0),
(69, 'Cowboys Country Bar', 'null', '\"Licenciado Adolfo Lopez Mateos Poniente 509, Zona Centro, 20070 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 123 6831', '', '', '', '', '', 'viernes-domingo=20-3  lunrs-jueves=cerrado\r', 0, 0, 0, 0, 0, 0),
(70, 'Santos Diablitos Bar', 'null', '\"Esq., Calle General Ignacio Zaragoza, Av. de la Convencion de 1914 Nte. & Calle Gral. Ignacio Zaragoza, Circunvalacion Nte.,\"', '', 0, 0, 0, 0, 0, '01 449 189 2271', '', '', '', '', '', 'jueves-domingo=20-3  lunes-miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(71, 'Restaurante La Estacion', 'null', '\"Calle 28 de Agosto No.210, La Estacion, Barrio de la Estacion, 20259 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 6664', '', '', '', '', 'laestacionrest@yahoo.com.mx', 'lunes-viernes= 8-20   domingo= 9-18\r', 0, 0, 0, 0, 0, 0),
(72, 'La Mestiza', 'null', '\"Abasolo 117, Barrio del Encino, 20240 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 915 9302', '', '', '', '', '', 'lunes-domingo= 8-14\r', 0, 0, 0, 0, 0, 0),
(73, 'Toks', 'null', '\"Avenida Tecnologico, 120, Colonia Ojo Caliente 1 CO, Aguascalientes, Ojocaliente, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 970 0719', '', '', '', '', '', 'lunes-domingo=7-0\r', 0, 0, 0, 0, 0, 0),
(74, 'La Saturnina', 'null', '\"Venustiano Carranza 110, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 994 0449', '', '', '', '', 'lasaturnina@gmail.com', 'lunes-domingo=8-23\r', 0, 0, 0, 0, 0, 0),
(75, 'Marcial\'s chili dogs', 'null', 'ESTAÑO 229 COLONIA FUNDICION', '', 0, 0, 0, 0, 0, '01 449 448 7159', '', '', '', '', 'marcialschillidogs@gmail.com', 'lunes-domingo=18-0\r', 0, 0, 0, 0, 0, 0),
(76, 'El Zodiaco', 'null', 'Galeana 113. Col. Centro, Aguascalientes 20000, Mexico', '', 0, 0, 0, 0, 0, '01 449 915 3181', '', '', '', '', '', 'lunes-domingo=8-21\r', 0, 0, 0, 0, 0, 0),
(77, 'Restaurante La Parra', 'null', '\"Av. Francisco I. Madero 610, Barrio de la Purisima, 20259 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 915 4807', '', '', '', '', '', 'lunes-viernes= 7:30-1:30   sabado-domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(78, 'El campirano', 'null', '\"Avenida Universidad 411, Villas de la Universidad, 20029 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 996 2108', '', '', '', '', '', 'lunes-viernes=8-15  sabado-domingo=8-18\r', 0, 0, 0, 0, 0, 0),
(79, 'Restaurante el campanario', 'null', '\"Los Laureles 804, Las Flores, 20220 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 5297', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(80, 'Casa del fuego', 'null', '\"San Julian 902, Jardines de la Concepcion I, 20120 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '3612208', '', '', '', '', '', 'lunes-sabado=14-23   domingo=14-18\r', 0, 0, 0, 0, 0, 0),
(81, 'Las Antorchas', 'null', 'av.francisco I. Madero 20000 Aguascalientes', '', 0, 0, 0, 0, 0, '01 449 918 9633', '', '', '', '', '', 'lunes-domingo=8-22\r', 0, 0, 0, 0, 0, 0),
(82, 'Catrina', 'null', '\"Calle Nieto #238, Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 6617', '', '', '', '', '', 'martes-lunes=13-19   miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(83, 'Mariscos \"El Güero\"', 'null', '\"Quinta Avenida 507, Las Americas, 20234 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 978 1455', '', '', '', '', '', 'lunes-domingo=10-19\r', 0, 0, 0, 0, 0, 0),
(84, 'Rincon Maya', 'null', '\"Calle Abasolo 113, Barrio del Encino, 20240 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 916 7574', '', '', '', '', '', 'lunes-domingo=14-0\r', 0, 0, 0, 0, 0, 0),
(85, 'El cid campeador', 'null', '\"5 de Mayo 517, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '1750606', '', '', '', '', 'rest.elcampeador@hotmail.com', 'lunes-domingo=13:30-1\r', 0, 0, 0, 0, 0, 0),
(86, 'la perla', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 511, Cristobal Colon, 20120 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 251 4805', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(87, 'El Coliseo', 'null', '\"Calle Gral. Ignacio Zaragoza 617, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 123 7822', '', '', '', '', '', 'martes-domingo=14:30-1:30 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(88, 'Garufa Aguascalientes Sur', 'null', '\"Av. esq., Av Aguascalientes Sur, Agricultura, 20324 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 9147', '', '', '', '', '', 'lunes-domingo=1:30-23\r', 0, 0, 0, 0, 0, 0),
(89, 'Sirloin Stockade', 'null', '\"Av. Heroe de Nacozari Sur 2101, Jardines de Bugambilias, Desarrollo Especial Inegi, 20270 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 5888', '', '', '', '', '', 'lunes-domingo=0-21\r', 0, 0, 0, 0, 0, 0),
(90, 'La haciendita', 'null', '\"Av de la Convencion de 1914 Poniente 107, Circunvalacion Poniente, 20210 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 3264', '', '', '', '', '', 'martes-jueves y domingo=14-2  viernes-sabado=14-2  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(91, 'Las Costillas de Sancho', 'null', '\"Aguascalientes 402, Bosques del Prado Norte, Bosques del Prado Nte., 20127 Aguascalientes, Ags\"', '', 0, 0, 0, 0, 0, '01 449 912 9261', '', '', '', '', '', 'lunes-sabado=13:30-2:30   domingo=13:30-18\r', 0, 0, 0, 0, 0, 0),
(92, 'Los Arcos', 'null', '\"Av Independencia 1703 Interior H, Trojes de Kristal, 20118 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 200 2099', '', '', '', '', '', 'lunes-sabado=11-22:30  domingo=11-20\r', 0, 0, 0, 0, 0, 0),
(93, 'El Almacen del Bife', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 600, Villas de San Nicolas, 20115 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 962 6022', '', '', '', '', '', 'lunes-miercoles=13:30-1 jueves-sabado=13:30-2 domingo=13:30-19\r', 0, 0, 0, 0, 0, 0),
(94, 'MESoN DEL TACO', 'null', '\" Av. Aguascalientes 508, Colinas del Rio, 20010 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 3776', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(95, 'Da Simone', 'null', '\"Avenida Universidad 1703, Campestre, 20129 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 251 5051', '', '', '', '', '', 'lunes-sabado=13:30-0  domingo=13:30-19\r', 0, 0, 0, 0, 0, 0),
(96, 'el POLLO GRIEGO', 'null', '\"Av Canal Interceptor 301, Villas de la Universidad, 20029 Aguascalientes, Ags\"', '', 0, 0, 0, 0, 0, '01 449 414 2369', '', '', '', '', '', 'lunes-domingo=10-19\r', 0, 0, 0, 0, 0, 0),
(97, 'moloko pizza', 'null', '\"Calle Nieto 430, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 769 9426', '', '', '', '', 'molokosocialclub@hotmail.com', 'martes-domingo=15-0 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(98, 'Ladrillos Pizza', 'null', '\"Alfonso Esparza Oteo 218, Barrio de San Marcos, 20070 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 916 1099', '', '', '', '', '', 'lunes-domingo=12-23\r', 0, 0, 0, 0, 0, 0),
(99, 'La Popular Americas', 'null', '\"Av.Las Americas 505, Las Americas, 20239 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 4840', '', '', '', '', '', 'martes-sabado=13-2  domingo y lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(100, 'Sonora\'s Meat', 'null', '\"Av Aguascalientes Sur 906, Jardines de las Fuentes, 20290 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 140 5754', '', '', '', '', '', 'lunes-sabado=10-23  domingo=10-20\r', 0, 0, 0, 0, 0, 0),
(101, 'ANJELIQUE RESTAURANTE', 'null', '\"Frontera 144, Campestre, 20129 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 8155', '', '', '', '', '', 'lunes-miercoles=14-23  jueves-sabado=14-2  domingo014-18\r', 0, 0, 0, 0, 0, 0),
(102, 'Augusto\'s', 'null', '\"Lic Miguel de la Madrid Hurtado 160, El Campestre 2a. Secc., Lomas del Campestre II, 20119 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 9599', '', '', '', '', '', 'lunes-sabado=13:30-23 domingo= 13:30-18\r', 0, 0, 0, 0, 0, 0),
(103, 'EL BUCANERO SEA FOOD & BA', 'null', '\"Av Gabriela Mistral 1010, Sta Anita IV, 20169 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 972 3090', '', '', '', '', '', 'lunes-domingo=12-22\r', 0, 0, 0, 0, 0, 0),
(104, 'Los Adobes', 'null', '\"Av Gabriela Mistral 1001, Fraccionamiento Lomas de Santa Anita, 20164 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 329 1997', '', '', '', '', '', 'lunes-sabado=13-2  domingo=13-0\r', 0, 0, 0, 0, 0, 0),
(105, 'La Jaibita', 'null', '\"Local A, Av. Hacienda de Ojocaliente 288, Haciendas de Aguascalientes, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 250 3702', '', '', '', '', '', 'lunes-domingo=10:30-19:30\r', 0, 0, 0, 0, 0, 0),
(106, 'Xocolatl Mexica', 'null', '\"Centro Comercial Galerias, Centro Comercial Galerias, Avenida Independencia 2351, Col. Trojes de Alonso, Desarrollo Especial Galerias, 20116 Aguascal', '', 0, 0, 0, 0, 0, '01 449 171 3693', '', '', '', '', '', 'lunes-domingo=15-22\r', 0, 0, 0, 0, 0, 0),
(107, 'EL HIDALGUENSE', 'null', '\"Av. Ojocaliente 1110, Ojocaliente I, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 126 9569', '', '', '', '', '', 'lunes-jueves=cerrado viernes-domingo=8-16\r', 0, 0, 0, 0, 0, 0),
(108, 'LOS REYES DEL TACO RT', 'null', '\"Av Siglo XXI 5309, Haciendas de Aguascalientes, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 970 2526', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(109, 'Las Planchitas', 'null', '\"Av Tecnologico 123, La Hacienda, 20190 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 962 2598', '', '', '', '', 'contacto@lasplanchitas.com.mx', 'lunes-sabado=8:30-14  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(110, 'Bestiario Sushi', 'null', '\"Av. Francisco I. Madero 549, Barrio de la Purisima, 20259 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 915 2452', '', '', '', '', '', 'lunes-sabado=13:30-23 domingo=13:30-21\r', 0, 0, 0, 0, 0, 0),
(111, 'Carnitas Mora', 'null', '\"Calle 57 #305, Col del Trabajo, 20180 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 975 0551', '', '', '', '', '', 'martes-domingo=8-17:30  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(112, 'Sottovoce', 'null', '\"Monte Everest, Bosques del Prado Nte., 20127 Aguascalientes, Ags\"', '', 0, 0, 0, 0, 0, '01 449 194 0198', '', '', '', '', '', 'lunes-domingo=14-0\r', 0, 0, 0, 0, 0, 0),
(113, 'sushi kanpai', 'null', '\"Av. Hacienda de Ojocaliente 258, Haciendas de Aguascalientes, 20190 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '1450548', '', '', '', '', '', 'lunes-sabado=13-22  domingo=13-21\r', 0, 0, 0, 0, 0, 0),
(114, 'restaurante del centro', 'null', '\"Av. Francisco I. Madero 224, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=8-0  domingo=9-23\r', 0, 0, 0, 0, 0, 0),
(115, 'el sabor de Guerrero', 'null', '\"Avenida Aguascalientes Oriente 2023, Lomas de Santa Anita, Fraccionamiento Lomas de Santa Anita, 20180 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 320 8205', '', '', '', '', '', 'miercoles-viernes=14-22 domingo=9-17 lunes=cerrado martes=14-20\r', 0, 0, 0, 0, 0, 0),
(116, 'Alfernos pizza', 'null', 'margil de jesus 1811 aguascalientes', '', 0, 0, 0, 0, 0, '01 449 972 7894', '', '', '', '', '', 'lunes-domingo=11-23\r', 0, 0, 0, 0, 0, 0),
(117, 'Amerix Burger', 'null', '\"Av Siglo XXI 5113, Haciendas de Aguascalientes, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 145 4887', '', '', '', '', '', 'lunes-domingo=12-0\r', 0, 0, 0, 0, 0, 0),
(118, 'Super Pollo', 'null', '\"Av. Aguascalientes Ote. 105, Ojocaliente las Torres, 20256 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 974 1940', '', '', '', '', '', 'lunes-domingo=10-21\r', 0, 0, 0, 0, 0, 0),
(119, 'Thai Cocina Oriental', 'null', '\"Plaza Arcos Campestre, Luis Donaldo Colosio 602, Villas de San Nicolas, Desarrollo Especial Colegio Cristobal Colon, 20115 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 994 8918', '', '', '', '', '', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(120, 'El Villamelon Aguascalien', 'null', '\"Jacarandas 907, Jardines de la Cruz, 20250 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 463 2122', '', '', '', '', '', 'martes-domingo=8-16 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(121, 'mariscos la perla', 'null', '\"20206, Jose Maria Gonzalez Bocanegra 916, Jose Lopez Portillo, 20206 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 978 1535', '', '', '', '', '', 'jueves-martes=12-19 miercoles= cerrado\r', 0, 0, 0, 0, 0, 0),
(122, 'El coso uruguayo', 'null', '\"Colosio 201, Desarrollo Especial Colegio Cristobal Colon, 20120 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 996 2361', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(123, 'vinculo', 'null', '\"Av. Aguascalientes Pte. 2617, España, La España, 20205 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 140 7965', '', '', '', '', '', 'lunes-domingo=11-22\r', 0, 0, 0, 0, 0, 0),
(124, 'Sanborn\'s', 'null', '\"Fco. I. Madero No. 111, Centro, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 915 8774', '', '', '', '', '', 'lunes-domingo=7-0:30\r', 0, 0, 0, 0, 0, 0),
(125, 'Mariscos Villa del Mar', 'null', '\"Av Arqueros 702, Vista del Sol I, 20266 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 7257', '', '', '', '', '', 'miercoles-lunes=12-19  martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(126, 'Mariscos La Ranita', 'null', '\"Av Canal Interceptor, Independencia de Mexico, 20130 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 977 9479', '', '', '', '', '', 'lunes-domingo=14-19:30\r', 0, 0, 0, 0, 0, 0),
(127, 'dragon sushi', 'null', '\"Centro Comercial Galerias, Centro Comercial Galerias, Avenida Independencia 2351, Col. Trojes de Alonso, Desarrollo Especial Galerias, 20116 Aguascal', '', 0, 0, 0, 0, 0, '01 449 187 0313', '', '', '', '', '', 'lunes-sabado=12-23  domingo=12-21\r', 0, 0, 0, 0, 0, 0),
(128, 'Orland pizza', 'null', '\"Av. Hacienda de Ojocaliente, Haciendas de Aguascalientes, 20196 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 6070', '', '', '', '', '', 'lunes-domingo= 12-23:30\r', 0, 0, 0, 0, 0, 0),
(129, 'comida china lucky', 'null', '\"Av. Hacienda de Ojocaliente 131, Haciendas de Aguascalientes, 20190 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 239 1431', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(130, 'El Muelle ', 'null', '\"Av. Las Americas 206, La Fuente, 20239 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 962 6999', '', '', '', '', 'muelleamericas.facturas@gmail.', 'lunes-domingo=13-2\r', 0, 0, 0, 0, 0, 0),
(131, 'Yotsuba Sushi', 'null', '\"Av Aguascalientes Sur 609, Jardines de las Fuente, Jardines de las Fuentes, 20278 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 140 7220', '', '', '', '', '', 'lunes-sabado=13-23 domingo=13-20\r', 0, 0, 0, 0, 0, 0),
(132, 'Sakura Sushi', 'null', '\"Paulino N. Marti 502, Villa Teresa, 20126 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 993 0784', '', '', '', '', '', 'lunes-domingo=13-22\r', 0, 0, 0, 0, 0, 0),
(133, 'super hamburguesas alamed', 'null', '\"Prol.Alameda 417, Heroes, 20190 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '044 449 970 4666', '', '', '', '', '', 'lunes-sabado=8-0 domingo=8-11\r', 0, 0, 0, 0, 0, 0),
(134, 'Italianni\'s', 'null', '\"Centro Comercial Altaria, Blvd. A. Zacatecas Nte, 849 L-1065, Trojes de Alonso, 20116 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 912 3100', '', '', '', '', '', 'lunes-jueves=8-23 viernes-sabado=8-0 domingo=8-22\r', 0, 0, 0, 0, 0, 0),
(135, 'Eddys Burger', 'null', '\"Av. Tecnologico 313, Ojocaliente las Torres, 20256 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 974 3467', '', '', '', '', '', 'lunes-domingo=11-22:30\r', 0, 0, 0, 0, 0, 0),
(136, 'Restaurante Vegetariano D', 'null', '\"Emiliano Zapata 201, Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 2721', '', '', '', '', '', 'martes-domingo=9-18 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(137, 'Mc Gourmet Restaurante De', 'null', '\"Av Heroe de Nacozari 2424, Residencial del Parque, 20277 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 2200', '', '', '', '', '', 'lunes-sabado=11-19 domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(138, 'La Palapa de Charly', 'null', '\"Avenida Aguascalientes Sur 3901, Villa Jardin, Desarrollo Especial Villa Asuncion, 20235 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 913 7235', '', '', '', '', '', 'lunes-domingo=12-23\r', 0, 0, 0, 0, 0, 0),
(139, 'Shing Wang', 'null', '\"Plaza Santa Anita, Av Canal Interceptor 123, Fraccionamiento Lomas de Santa Anita, 20164 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=10-22 domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(140, 'LA CASA MEDITERRaNEA di S', 'null', '\"Zaragoza 517, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 994 2123', '', '', '', '', 'lacasamediterraneags@gmail.com', 'martes-domingo=8:30-1 lunes cerrado\r', 0, 0, 0, 0, 0, 0),
(141, 'puerto nuevo', 'null', '\"Av. Fundicion 2001, San Cayetano, 20010 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 996 0928', '', '', '', '', '', 'lunes-domingo=13-19:30\r', 0, 0, 0, 0, 0, 0),
(142, 'ARRACHERA HOUSe', 'null', '\"Centro Comercial Alturia, Salida a Zacatecas 1723, Altaria, Desarrollo Especial Bulevar a Zacatecas, 20270 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'Lunes-Viernes=10:00-23:00  Sabados=22:00-23:00   Domingos=10:00-23:00\r', 0, 0, 0, 0, 0, 0),
(143, 'California Meal\'s', 'null', '\"Av Heroe Inmortal 267, Morelos I, 20298 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 977 1405', '', '', '', '', '', 'domingo-jueves=9-23 viernes-sabado=9-0\r', 0, 0, 0, 0, 0, 0),
(144, 'Los Olivos', 'null', '\"Av Independencia, Trojes de Alonso, 20116 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 7500', '', '', '', '', 'losolivos_restaurant@hotmail.c', 'lunes-sabado=8:30-23 domingo=8:30-18\r', 0, 0, 0, 0, 0, 0),
(145, 'Los Antojos De Carranza', 'null', '\"Jose F. Elizondo 203, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '044 449 994 1977', '', '', '', '', 'jserranotostado@prodigy.net.mx', 'lunes-domingo=8:30-18\r', 0, 0, 0, 0, 0, 0),
(146, 'RESTAURANTE KIMURA', 'null', 'Av. Universidad 1401 Los Bosques aguascalientes ', '', 0, 0, 0, 0, 0, '449 9143228 ', '', '', '', '', 'isao151@gmail.com', 'martes-sabado=13-23   lunes Y domingo=13-22\r', 0, 0, 0, 0, 0, 0),
(147, 'okuma sushi', 'null', '\"Av Las Americas 1402, Jardines de Sta. Elena, Jardines de Santa Elena, 20230 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 175 9775', '', '', '', '', '', 'lunes-domingo=12-23\r', 0, 0, 0, 0, 0, 0),
(148, 'el melon', 'null', '\"Prol Alameda 109, Barrio de la Purisima, 20259 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 8010', '', '', '', '', '', 'lunes-domingo=8-22:30\r', 0, 0, 0, 0, 0, 0),
(149, 'Mariscos Los Cabos', 'null', '\"Ignacio T. Chavez 107, Obraje, 20220 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 918 1146', '', '', '', '', '', 'lunes-domingo=12-19\r', 0, 0, 0, 0, 0, 0),
(150, 'Puerto camaron', 'null', '\"Av. Las Americas 404, Col. Las Fuentes, La Fuente, 20230 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 9428', '', '', '', '', 'puerto.camaron@outlook.com', 'domingo-miercoles=12-20  jueves-sabado=12-20\r', 0, 0, 0, 0, 0, 0),
(151, 'Las delicias de maria', 'null', '\"Av. Jose Ma. Chavez, Lindavista, 20270 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 917 4344', '', '', '', '', '', 'lunes-domingo=7-12\r', 0, 0, 0, 0, 0, 0),
(152, 'Contempo', 'null', '\"Calle del Codo 233, Zona Centro, 20000 Aguascalientes, Ags.', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(153, '01 449 918 8874', 'comida italiana ', '', '', 0, 0, 0, 0, 0, '://www.facebook.com/', '', '', '', '', 'lunes-domingo=14-0\r', '', 0, 0, 0, 0, 0, 0),
(154, 'De La Torre', 'null', '\"Av Aguascalientes Sur 200, Prados del Sur, 20280 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 140 5565', '', '', '', '', '', 'lunes-domingo=12:30-22\r', 0, 0, 0, 0, 0, 0),
(155, 'os Puerto Marquez', 'null', '\"Profr. Enrique Olivares Santana 129, El Dorado 1ra Secc, 20235 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 395 118 2198', '', '', '', '', '', 'lunes-domingo=11-18\r', 0, 0, 0, 0, 0, 0),
(156, 'Tortas Ahogadas La Minerv', 'null', '\"Calle Tokio #202, Fracc. Del Valle 2 Seccion, Residencial del Valle II, 20089 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 916 8590', '', '', '', '', 'laminervags@gmail.com', 'jueves-viernes=11:30-18:30 sabado-domingo=9:30-18:30lunes-miercoles=cerrado\r', 0, 0, 0, 0, 0, 0),
(157, 'Las alitas', 'null', '\"Av. Independencia #1853, Jardines de la Concepcion, Desarrollo Especial Galerias, 20130 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 162 2854', '', '', '', '', '', 'jueves-sabado=12-1  domingo-miercoles=12-0\r', 0, 0, 0, 0, 0, 0),
(158, 'Mi Lola Aguascalientes', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 513, Jardines de la Concepcion II, 20120 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 281 3570', '', '', '', '', '', 'lunes-domingo=14-0\r', 0, 0, 0, 0, 0, 0),
(159, 'Carnitas Guadalajara', 'null', '\"Lopez Mateos 902, Circunvalacion Poniente, 20210 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 916 0062', '', '', '', '', 'carnitasgdl@hotmail.com', 'lunes-domingo=8-18\r', 0, 0, 0, 0, 0, 0),
(160, 'central de tacos', 'null', '\"Convencion 1914 Sur 313A, Las, Las Americas, 20230 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 913 0052', '', '', '', '', '', 'lunes-domingo=12-3\r', 0, 0, 0, 0, 0, 0),
(161, 'Ragazzi', 'null', '\"Frontera, Campestre, 20100 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 996 5555', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(162, 'casa maca', 'null', '\"Av Independencia 2014, Trojes de Oriente II, 20116 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 994 9094', '', '', '', '', '', 'martes-domingo=8-17 lunes cerrado\r', 0, 0, 0, 0, 0, 0),
(163, 'el carnes', 'null', '\"Luis Donaldo Colosio 220, Esq. Agricultura, Granjas del Campestre, Granjas Campestre, 20110 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 239 5507', '', '', '', '', 'elcarnesjosemiguel@gmail.com', 'domingo-miercoles=11:30-1  jueves-sabado=11:30-4:30\r', 0, 0, 0, 0, 0, 0),
(164, 'Las Glorias Del Indio', 'null', '\"Potreros 102, Lomas del Campestre II, 20119 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 912 4461', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(165, 'restaurante las cascadas', 'null', 'Miguel de la Madrid 2828', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(166, 'Quinto Barrio', 'null', '\"Av. Francisco I. Madero 349, Zona Centro, 20000 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-domingo=14-0\r', 0, 0, 0, 0, 0, 0),
(167, 'hiro', 'null', '\"Av Josemaria Escriva de Balaguer 837 A, Rusticos Calpulli, Villa Bonaterra, 20296 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 155 1323', '', '', '', '', '', 'lunes-sabado=12-23  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(168, 'Che chaplin', 'null', '\"Boulevard Miguel de la Madrid 942, Corral de Barrancos, 20900 Jesus Maria, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 993 3587', '', '', '', '', 'gastronomicachaplin@hotmail.co', 'lunes-sabado=13:30-22 domingo=13:30-20\r', 0, 0, 0, 0, 0, 0),
(169, 'las espadas', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 221, Jardines de la Concepcion I, 20115 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 0115', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(170, 'Chili´s Best Place', 'null', '\"Plaza Altaria, Blvd. a Zacatecas No. 849 Norte Local 1001, Planta Baja, Trojes de Alonso, 20116 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 1901', '', '', '', '', '', 'viernes-sabado=8-1  domingo-jueves=8-0\r', 0, 0, 0, 0, 0, 0),
(171, 'Chili\'s Plaza Patio', 'null', '\"Jose Maria Chavez 1531 Local A-02, Agricultura Centro Comercial, Desarrollo Especial Villa Asuncion, 20234 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 978 3469', '', '', '', '', '', 'miercoles-sabado=8-0  domingo-martes=8-23\r', 0, 0, 0, 0, 0, 0),
(172, 'Pizza Express', 'null', '\"San Antonio 507, Jesus Gomez Portugal (Margaritas), Valle de Margaritas, 20909 Jesus Maria, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 994 8470', '', '', '', '', '', 'lunes-domingo=13-21:30\r', 0, 0, 0, 0, 0, 0),
(173, 'Mely de La Torre', 'null', '\"Av Independencia 1870, Trojes de Alonso, 20116 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 153 3446', '', '', '', '', '', 'lunes-domingo=12:23\r', 0, 0, 0, 0, 0, 0),
(174, 'Burger King', 'null', '\"Av Independencia 1872, Jardines de la Concepcion, Jardines de la Concepcion II, 20120 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 996 4938', '', '', '', '', '', 'lunes-domingo=9-23\r', 0, 0, 0, 0, 0, 0),
(175, 'bocca', 'null', '\"Blvd. Luis Donaldo Colosio Murrieta 502, Cristobal Colon, 20115 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 153 3438', '', '', '', '', '', 'lunes-domingo=13-20\r', 0, 0, 0, 0, 0, 0),
(176, 'Vancouver Wings', 'null', '\"Av Universidad 2229, San Jose del Arenal, 20130 Aguascalientes, Ags.\"', '', 0, 0, 0, 0, 0, '01 449 914 7844', '', '', '', '', '', 'lunes-domingo=11-2\r', 0, 0, 0, 0, 0, 0),
(177, 'Bistrot Sante', 'null', '\"Boulevard Luis Donaldo Colosio 400 | Centro Comercial \"\"La Plazita\"\" Local 11, Aguascalientes 20110, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 100 5973', '', '', '', '', 'bistrotsante@gmail.com', 'lunes-jueves=11-18  viernes=8-23  sabado=9:30-22   domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(178, 'Countrybreak', 'null', '\"Prolongacion Ignacio Zaragoza, 312, Aguascalientes 20115, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 153 1530', '', '', '', '', '', 'lunes-domingo=13-23\r', 0, 0, 0, 0, 0, 0),
(179, 'Esthela', 'null', '\"Jose Maria Chavez 644, Aguascalientes 20240, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 918 0751', '', '', '', '', '', 'lunes-domingo=18-0\r', 0, 0, 0, 0, 0, 0),
(180, 'Birrieria Martin', 'null', '\" Boulevard Jose Maria Chavez 527 | Obraje, Aguascalientes 20230, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 913 2088', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(181, 'Antojitos Mexicanos la Pl', 'null', '\" DR. Diaz de Leon 460, Encino, CP. 20240, Aguascalientes 20240, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 449 915 3815', '', '', '', '', '', 'miercoles-lunes=14:30-0:30 martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(182, 'Osteria Italiana', 'null', '\"Calle Alfonso Esparza Oteo # 101-A | A un lado de los Jardines de San marcos, Templo de San Marcos, Aguascalientes 20574, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 449 916 6135', '', '', '', '', '', 'martes-domingo=14-2 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(183, 'Cavalli\'s', 'null', '\"Avenue Paseo San Gerardo 210 | International Local-5, Aguascalientes 20342, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 688 0101', '', '', '', '', 'cavallispizza@hotmail.com', 'lunes-sabado=12-22\r', 0, 0, 0, 0, 0, 0),
(184, 'Le Mexique', 'null', '\" Calle Ignacio Zaragoza 106 | Centro, Aguascalientes 20344, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 918 8888', '', '', '', '', '', 'lunes-martes=18-22:30  miercoles-sabado=14-23:30 domingo=14-21:30\r', 0, 0, 0, 0, 0, 0),
(185, 'azul catedral', 'null', '\"Av. Madero 616 | La Purisima, Aguascalientes 20259, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 915 7059', '', '', '', '', 'azulcatedral@gmail.com', 'martes-sabado=8:30-23:45 domingo=8:30-19:30 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(186, 'Mamatango bife & wine', 'null', '\"blvd a Zacatecas nte 849-1002 | Plaza Altaria, Aguascalientes 20116, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 996 7400', '', '', '', '', 'mamatangoags@eninfinitum.com', 'lunes-sabado=13:30-23 domingo=13:30-18\r', 0, 0, 0, 0, 0, 0),
(187, 'La nona Lola', 'null', '\" Blvd luis donaldo colosio 602 local 14 planta alta, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 994 9216', '', '', '', '', '', 'domingo-miercoles=14-23 jueves-sabado=14-2\r', 0, 0, 0, 0, 0, 0),
(188, 'La Gloria Taqueria', 'null', '\" Calle Aquiles Serdan 203, Aguascalientes 20050, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=17-2:30 domingo=16-2:30\r', 0, 0, 0, 0, 0, 0),
(189, 'Lechon y Barbacoa Los 3 G', 'null', '\"Avenida Siglo Xlx #608 a Col:lomas de Santa Anita, Aguascalientes 20164, Mexico\"', '', 0, 0, 0, 0, 0, ' 523221115550', '', '', '', '', 'enriquegarciacocio2@gmail.com', 'lunes-sabado=16:30-23:30 domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(190, 'Gordas Colosio', 'null', '\"Luis Donaldo Colosio, 323, Aguascalientes 20120, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 449 996 7099', '', '', '', '', '', 'lunes-domingo=8:30-16:30\r', 0, 0, 0, 0, 0, 0),
(191, 'Il Re Italiano', 'null', '\"Calle General Ignacio Zaragoza 232, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 294 8918', '', '', '', '', '', 'lunes-sabado=13:45-22:30  domingo=12-19\r', 0, 0, 0, 0, 0, 0),
(192, 'Il Forno di Bendonni', 'null', '\"Monte Everest esq. Sierra Fria | Fracc. Bosques del Prado Nte., Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'martes-domingo=13:30-23:30  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(193, 'Lago Azul Birrieria', 'null', '\" Avenida Arnulfo M. Vazquez 300, Aguascalientes 20135, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 918 0518', '', '', '', '', '', 'lunes-domingo=14-19:30\r', 0, 0, 0, 0, 0, 0),
(194, 'menudo la granja', 'null', '\"AV. Aguascalientes Norte 508, Bosques Del Prado, Aguascalientes 20127, Mexico\"', '', 0, 0, 0, 0, 0, ' 524494412327', '', '', '', '', '', 'lunes-domingo=8-15\r', 0, 0, 0, 0, 0, 0),
(195, 'Costeñito', 'null', '\" Boulevard Luis Donaldo Colosio 645, Aguascalientes 20120, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 271 0070', '', '', '', '', '', 'lunes-domingo=12-2\r', 0, 0, 0, 0, 0, 0),
(196, 'Yellow Berry', 'null', '\"Avenida Independencia 1880 | Local 1, Aguascalientes 20115, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 449 300 9107', '', '', '', '', '', 'lunes-viernes=8-23:30  sabado-domingo=8-15\r', 0, 0, 0, 0, 0, 0),
(197, 'Boom Burger', 'null', '\"Aguacate 122, Circunvalacion poniente, Aguascalientes 20210, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(198, 'La Oaxaqueña', 'null', '\"Av Las Americas 1738, Aguascalientes 20236, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 913 2917', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(199, 'La Cocina De Angeles Huer', 'null', '\"Montenegro 2021 | Locales A y B, Aguascalientes 20115, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', 'lacocinadeangeleshuerta@gmail.', 'lunes-sabado=9-17 domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(200, 'Restaurant Los Delfines', 'null', '\" Luis Adolfo 207, Los Cedros, Aguascalientes 20270, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 978 3856', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(201, 'DUTCH Lunch Room', 'null', '\"Prolongacion General Ignacio Zaragoza 328 | San Telmo Town Center, Fracc Valle de Las Trojes, Aguascalientes 20115, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 251 7668', '', '', '', '', 'dutchlunchroom@hotmail.com', 'martes-miercoles=14-22 jueves-sabado=14-2  domingo=14-19  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(202, 'Los caprichos de la Doña', 'null', '\" Av. de la Convencion de 1914 Pte. 408 | Colonia San Marcos, Aguascalientes 20070, Mexico\"', '', 0, 0, 0, 0, 0, '4499153030', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(203, 'Casa Organica', 'null', '\"Av Eugenio Garza Sada 120 | local 13, Plaza BBliniet, Enfrente del Colegio Entorno, Aguascalientes 20328, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 238 0801', '', '', '', '', 'ventas@casaorganica.mx', 'lunes-viernes=10-20 sabado=10-19  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(204, 'La Blanquita', 'null', '\"Avenida a Zacatecas 849 | Plaza Altaria, Local F05, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', 'contacto@tortaslablanquita.com', 'lunes-domingo=10-21\r', 0, 0, 0, 0, 0, 0),
(205, 'Caye Chenu Mezcaleria', 'null', '\" Calle Zaragoza 105 | Colonial Centro, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 55 2401 9355', '', '', '', '', 'cayechenu@outlook.com', 'martes-viernes=18-0 sabado=19-2  domingo y lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(206, 'Mariscos Culichitlan', 'null', '\"Av. Aguascalientes Sur 1220. Local 7 Fracc. Casa Blanca | Plaza Casa Blanca, Aguascalientes 20297, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 329 2520', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(207, 'Carnitas Guadalajara', 'null', '\"Avenida Lopez Mateos 902 | Circunvalacion Poniente, Aguascalientes 20210, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 916 0062', '', '', '', '', 'carnitasgdl@hotmail.com', 'lunes-domingo=8-18:30\r', 0, 0, 0, 0, 0, 0),
(208, 'Kapital Sushi', 'null', '\"Av. Montes Himalayos 728, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '162 7435', '', '', '', '', 'contacto@kapitalsushi.com.mx', 'lunes-miercoles=13-0  jueves-domingo=13-23\r', 0, 0, 0, 0, 0, 0),
(209, 'Le Pib', 'null', '\"Boulevard Luis Donaldo Colosio Murrieta 414, Aguascalientes 20115, Mexico\"', '', 0, 0, 0, 0, 0, '3614473', '', '', '', '', '', 'miercoles-lunes=9-23 martes=cerrado\r', 0, 0, 0, 0, 0, 0),
(210, 'Barbacoa Karichi', 'null', '\"Av. Aguascalientes # 2115, Lomas de Santa Anita, Aguascalientes, Ags., C.P. 20180 | Atras del Parque \"\" La Pona \"\", Aguascalientes 20180, Mexico\"', '', 0, 0, 0, 0, 0, '4499755467', '', '', '', '', 'barbacoakarichi@gmail.com', 'viernes-domingo=8-16:30  lunes-jueves=cerrado\r', 0, 0, 0, 0, 0, 0),
(211, 'Jugos y Chocos Tony', 'null', 'av.independencia no.1820', '', 0, 0, 0, 0, 0, '01 449 153 1844', '', '', '', '', 'jugosychocos.tony@hotmail.com', '\r', 0, 0, 0, 0, 0, 0),
(212, 'Las Gordibuenas', 'null', '\" Prol Zaragoza 214, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '9134613', '', '', '', '', 'micorreoesluis@hotmail.com', 'lunes-domingo=8-14:30\r', 0, 0, 0, 0, 0, 0),
(213, 'Tamales el Atrio', 'null', '\"Av de la Convencion de 1914, Aguascalientes 20270, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 146 9988', '', '', '', '', '', 'lunes-viernes=9-22  sabado=9-14  domingo=18-22\r', 0, 0, 0, 0, 0, 0),
(214, 'Cenaduria El Sopecito', 'null', '\"Cosio Norte 105 | Corner With Juan de Montoro, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 915 1512', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(215, 'Deloceans', 'null', '\"Lic Miguel de la Madrid Hurtado 1905 | Jardines Del Campestre, 20129, Aguascalientes 20129, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 251 4008', '', '', '', '', 'contacto@deloceans.com', 'domingo-jueves=9-20  viernes-sabado=9-22\r', 0, 0, 0, 0, 0, 0),
(216, 'La Vita E Verde', 'null', '\"Boulevard Luis Donaldo Colosio 117, Aguascalientes 20120, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 251 5039', '', '', '', '', 'contacto@lavitaeverde.com', 'lunes-domingo=7:30-19\r', 0, 0, 0, 0, 0, 0);
INSERT INTO `sucursal` (`idsucursal`, `nom_sucursal`, `nom_encargado`, `direccion`, `calle`, `noext`, `noitn`, `fracc`, `cp`, `mun`, `telefono`, `img1`, `img2`, `img3`, `descripcion`, `correo_contacto`, `horario`, `idprod`, `idtiopneg`, `id_tipous`, `id_servicio`, `id_etiquetas`, `idmun`) VALUES
(217, 'La Croqueria', 'null', '\"Paseo Juan de Tolosa 612 | Jardines de Aguascalientes, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '4499135476', '', '', '', '', '', 'martes-domingo=10-16:30 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(218, 'La casa del pozole', 'null', '\" Indepedencia #1832, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 121 7779', '', '', '', '', '', 'lunes-viiernes=19-11  sabado-domingo=15-11\r', 0, 0, 0, 0, 0, 0),
(219, 'Villa Toscana', 'null', '\"Avenida Luis Donaldo Colosio No. 513, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-domingo=14-0\r', 0, 0, 0, 0, 0, 0),
(220, 'Super Salads', 'null', '\"Luis Donaldo Colosio # 645 | Corner Avenida Independencia, Aguascalientes 20311, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 251 6551', '', '', '', '', '', 'lunes-domingo=12-23\r', 0, 0, 0, 0, 0, 0),
(221, 'El Rincon Nayarita', 'null', '\"Blvd Miguel de la Madrid Km3 y antiguo | camino a Jesus Maria s/n Mission de San Jose, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-domingo=11-5\r', 0, 0, 0, 0, 0, 0),
(222, 'The Burger Joint. MX', 'null', '\"Av. Universidad #2229 L 4-A | Col. San Jose del Arenal, Aguascalientes 20130, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 912 0741', '', '', '', '', 'theburgerjoint.mx@gmail.com', 'lunes-miercoles=8-23 jueves-sabado=8-2  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(223, 'Sin Tantita Pena', 'null', '\" Avenida Aguascalientes Norte 705 | Centro Commercial. Galerias Aguascalientes, Aguascalientes 20116, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 106 6005', '', '', '', '', 'sintantitapena@live.com.mx', 'lunes y martes=8-18  miercoles-sabado=8-21 domingo=8-20\r', 0, 0, 0, 0, 0, 0),
(224, 'Argentilia', 'null', '\"Frontera 144 | Fracc. Campestre, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '9 14 81 55', '', '', '', '', 'marlax29@hotmail.com', 'lunes-domingo=14-23\r', 0, 0, 0, 0, 0, 0),
(225, 'Tepe Taco', 'null', '\"Aguascalientes-Encarnacion de Diaz 16 | Plaza Tepeyac, Centro de Abastos, Aguascalientes 20280, Mexico\"', '', 0, 0, 0, 0, 0, '\"01 449 145 0571', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(226, 'comida mexicana', '', 'https://www.facebook.com/pages/Tepe-Taco/374669465915452?fref=ts', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(227, 'Sushi zone', 'null', '\"Av. Universidad 1201-A, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '522008033', '', '', '', '', '', 'martes-sabado=13:30 -22  domingo=14-20  lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(228, '\"Restaurant Puente Nacion', 'null', '\"Calle Vicente Guerrero 7 | Real de Asientos, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 461 3979', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(229, 'El Amigazo Nacho', 'null', '\"Prolongacion San Miguel 302 | Barrio de la Salud, Aguascalientes 20249, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-domingo=18-12\r', 0, 0, 0, 0, 0, 0),
(230, 'La Casa Del Naranjo', 'null', '\"Callejon De Codo 214 | Zona Centro, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=14:30-23  domingo=cerrado\r', 0, 0, 0, 0, 0, 0),
(231, 'Las Fabulosas Papas ', 'null', '\"Av. Luis Donaldo Colosio #515 C.P., Aguascalientes 20120, Mexico\"', '', 0, 0, 0, 0, 0, '+(52) (449) 973 72 7', '', '', '', '', 'contacto@laspapas.com.mx', '\r', 0, 0, 0, 0, 0, 0),
(232, 'La Fonda de Aguascaliente', 'null', '\"Direccion: Luis Donaldo Colosio 328, Aguascalientes 20115, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 122 2651', '', '', '', '', 'lafonda_ags@hotmail.com', 'lunes-domingo=8-19\r', 0, 0, 0, 0, 0, 0),
(233, 'Las Gambas', 'null', '\"Sierra del Laurel #202, Bosques del Prado, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 912 2529', '', '', '', '', 'info@lasgambas.com.mx', 'lunes-domingo=12-7:30\r', 0, 0, 0, 0, 0, 0),
(234, 'Terrazza Italiana', 'null', '\"Jose Maria Chavez 901-A | Fraccionamiento Lindavista, Aguascalientes 20230, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 916 6050', '', '', '', '', 'laterrazaitaliana@gmail.com', 'sabado-domingo=9:30-23   lunes-viernes=8:30-23\r', 0, 0, 0, 0, 0, 0),
(235, 'El Crudito', 'null', '\"Avenida Aguascalientes Poniente # 1517, Aguascalientes 20016, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 117 8858', '', '', '', '', 'cesar@drunkideas.com.mx', 'sabado-domingo=10-2   martes-jueves=11-23:30 viernes=11-2   lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(236, 'Cazona Corzo', 'null', '\"Calle Galeana Nte 112 | Zona Centro, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-domingo=8-2\r', 0, 0, 0, 0, 0, 0),
(237, 'Gold Taco', 'null', '\"Avenida Aguascalientes Norte 692 | Bosques Del Prado Norte, Aguascalientes 20127, Mexico\"', '', 0, 0, 0, 0, 0, '2514006', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(238, 'El Asadero Griego', 'null', '\"Avenida Siglo XXI No. 107, Aguascalientes 20280, Mexico', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(239, '01 449 241 2684', 'Carnes y cortes', '', '', 0, 0, 0, 0, 0, 'https://www.facebook', '', '', '', '', '\r', '', 0, 0, 0, 0, 0, 0),
(240, 'Carnes la Laguna', 'null', '\"Blsd. Luis Donaldo Colosio 501 | Plaza Norte Local 2, Col Jardines de la Concepcion II, Aguascalientes 20120, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 251 4215', '', '', '', '', 'tienda9@carneslalaguna.com.mx', 'lunees-viernes=9-20  sabado-domingo=9-19\r', 0, 0, 0, 0, 0, 0),
(241, 'Francachela ', 'null', '\"Avenida Universidad 2229 | Plaza Palmas Aguascalientes, Aguascalientes 20130, Mexico\"', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', 'lunes-sabado=13-23:30   domingo=13-21:30\r', 0, 0, 0, 0, 0, 0),
(242, 'Pizzaiola', 'null', '\"Centro Comercial, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 612 66 64', '', '', '', '', 'pizzaiola.ags@gmail.com', 'lunes-domingo=1-23\r', 0, 0, 0, 0, 0, 0),
(243, 'ComicX', 'null', '\"Plaza Altaria, Aguascalientes 20116, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 251 4255', '', '', '', '', 'grupocomicx@gmail.com', 'lunes-domingo=12-2\r', 0, 0, 0, 0, 0, 0),
(244, 'Restaurante California', 'null', '\"Aguascalientes 1305, Col. Jardines del Sol\"', '', 0, 0, 0, 0, 0, '9-70-94-66', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(245, 'SANBORNS AGUASCALIENTES A', 'null', '\"Zacatecas Norte 849, Centro Comercial Altaria,\"', '', 0, 0, 0, 0, 0, '\"153-0430, 153-0440 ', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(246, 'ANDREA RESTAURANT', 'null', '\"Luis Donaldo Colosio 105, Jardines De La Concepcion \"', '', 0, 0, 0, 0, 0, '914-8382 y (55)2810-', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(247, 'LA RUEDA', 'null', '\"Nieto 104, Centro\"', '', 0, 0, 0, 0, 0, '\"994-6670, 994-6675 ', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(248, 'D´JORDIS', 'null', '\"Luis Donaldo Colosio 625, Jardines De La Concepcion 1a Seccion, \"', '', 0, 0, 0, 0, 0, '996-2569', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(249, ' La Colosal', 'null', 'Avenida Luis Donaldo Colosio 509 Jardines De La Concepcion', '', 0, 0, 0, 0, 0, '9961757', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(250, 'SUSHI INC', 'null', '\"Luis Donaldo Colosio 203, Jardines De La Concepcion 2a Seccion \"', '', 0, 0, 0, 0, 0, '251-3966', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(251, 'LONCHERIA LAS TIAS', 'null', '\"Jose Ma Chavez 412, Zona Centro\"', '', 0, 0, 0, 0, 0, '145-9092', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(252, 'La Cava Del Borrego', 'null', 'De Los Cisnes 107 Jardines Del Parque', '', 0, 0, 0, 0, 0, '9137011', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(253, 'Tacos Joven', 'null', '\"Union 122 | Mercado Teran, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 449 188 8587', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(254, 'Francachela Aguascaliente', 'null', '\"Boulevard Jose Maria Chavez # 1601 Int. A, Aguascalientes 20126, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 913 0356', '', '', '', '', '', 'lunes-sabado=13-23:30 domingo=13-21-30\r', 0, 0, 0, 0, 0, 0),
(255, 'La Emiliana', 'null', '\"Calle Fray Antonio de Segovia 1413 | Esq. Nacozari Sur, Aguascalientes 20268, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 415 0266', '', '', '', '', 'LAEMILIANA.MX@GMAIL.COM', 'lunes-sabado=11-22  doming=14-18\r', 0, 0, 0, 0, 0, 0),
(256, 'Vips', 'null', '\"Direccion: Av Independencia 2351 | CC Galerias Aguascalientes, Aguascalientes 20311, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 918 4261', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(257, 'La Portica', 'null', '\"Direccion: Avenida Convencion 1914 sur 1112 | Local 4, Aguascalientes 20240, Mexico', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(258, '01 449 239 4333', 'comida mexicana', '', '', 0, 0, 0, 0, 0, 'https://www.facebook', '', '', '', '', '\r', '', 0, 0, 0, 0, 0, 0),
(259, 'Pizzette Di Napoli', 'null', '\"Direccion: Benjamin de La Mora 407, Aguascalientes, Mexico', '', 0, 0, 0, 0, 0, NULL, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0),
(260, ' 01 449 994 1444', 'comida italiana ', '', '', 0, 0, 0, 0, 0, 'https://www.facebook', '', '', '', '', 'martes-sabado=14-22  domingo=1', '', 0, 0, 0, 0, 0, 0),
(261, 'Restaurant Kaos', 'null', '\"Direccion: Sierra del Laurel, 202 | esquina San Julian, Aguascalientes 20127, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 688 2748', '', '', '', '', 'kaos.ags.admon@gmail.com', 'lunes-domingo=12-23:45\r', 0, 0, 0, 0, 0, 0),
(262, 'Las delicias de la parril', 'null', '\"Direccion: Av. Aguascalientes sur 2713, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, ' +52 449 971 4626', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(263, 'Restaurante Costa Brava', 'null', '\"Direccion: Boulevard Juan Pablo II KM 3.5 | Col San Nicolas de la Cantera, Aguascalientes 20208, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 976 0456', '', '', '', '', 'jpomar33@hotmail.com', 'lunes-domingo=8-18\r', 0, 0, 0, 0, 0, 0),
(264, 'Mizaki', 'null', '\"Direccion: Boulevard A Zacatecas Norte 849 | Food Court Local F3, Aguascalientes 20116, Mexico\"', '', 0, 0, 0, 0, 0, '449 993 25 18', '', '', '', '', '', 'domingo-viernes=0-20  sabado=0-21\r', 0, 0, 0, 0, 0, 0),
(265, 'Sepia', 'null', '\"Direccion: Abasolo 203 Barrio del Encino, Aguascalientes 20240, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 915 0206', '', '', '', '', 'restaurantesepia@gmail.com', 'lunes y martes=cerrado  miercoles-jueves=14-22:30  viernes-sabado=14-0  domingo=14-20\r', 0, 0, 0, 0, 0, 0),
(266, 'Cocodrilo\'s Burger', 'null', '\"Direccion: Av convencion norte | Suite 125, Aguascalientes 20020, Mexico\"', '', 0, 0, 0, 0, 0, '044 449 155 8637', '', '', '', '', 'kassberna@gmail.com', 'lunes-domingo=12-21\r', 0, 0, 0, 0, 0, 0),
(267, 'Don Taquito', 'null', '\"Direccion: Flor De Noche Buena, Aguascalientes 20296, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 894 3186', '', '', '', '', '', '\r', 0, 0, 0, 0, 0, 0),
(268, 'I Love Sushi', 'null', '\"Direccion: 28 de Agosto #306, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 367 8446', '', '', '', '', 'somos@ilovesushi.mx', 'lunes-sabado=13-21  domingo cerrado\r', 0, 0, 0, 0, 0, 0),
(269, 'Bravo Taco Aguascalientes', 'null', '\"Direccion: Avenue Independencia 2530 | Localita 4, Aguascalientes 20116, Mexico\"', '', 0, 0, 0, 0, 0, '+52 449 994 9148', '', '', '', '', 'bravotaco@yahoo.com', 'martes-viernes=12.30-21:30sabado=12:30-22:30  domingo=12:30-18:30 lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(270, 'La Buona Pizza', 'null', '\"Direccion: Tanque de los Jimenez, Aguascalientes, Mexico\"', '', 0, 0, 0, 0, 0, '4152027', '', '', '', '', 'pizzalabuona@gmail.com', '\r', 0, 0, 0, 0, 0, 0),
(271, 'Circo Social', 'null', '\"Direccion: Calle General Vicente Guerrero sur 106, Aguascalientes 20000, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 153 0904', '', '', '', '', '', 'lunes-domingo=13-0\r', 0, 0, 0, 0, 0, 0),
(272, 'Arracheras Las Regias', 'null', '\"Direccion: Av. aguascalientes Nte 418, Aguascalientes 20127, Mexico\"', '', 0, 0, 0, 0, 0, '01 449 200 9900', '', '', '', '', '', 'martes-domingo=13-19   lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(273, 'La Pizza Italiana', 'null', '\"Direccion: Avenida Convencion Pte. 1124 | Local 5, Aguascalientes 20210, Mexico\"', '', 0, 0, 0, 0, 0, '2500588', '', '', '', '', 'lapizzaitalianaags@gmail.com', '\"miercoles,jueves y lunes=14-22   viernes-sabado=14-23   domingo=13-20    martes=cerrado\"\r', 0, 0, 0, 0, 0, 0),
(274, 'Las Brasas Parrilla de Ba', 'null', '\"Direccion: Avenida Ajedrecistas 632 | Lomas de Vista Bella, Aguascalientes 20298, Mexico\"', '', 0, 0, 0, 0, 0, ' 01 449 281 2197', '', '', '', '', 'rubioricardo@hotmail.es', 'martes-viernes=16-0  sabado=14-0  domingo=14-23   lunes=cerrado\r', 0, 0, 0, 0, 0, 0),
(275, 'Tortas y Tacos Wicho', 'null', '\"Direccion: Avenida Convencion Poniente | Esquino Antonio Norzagaray #305, Aguascalientes 20040, Mexico\"', '', 0, 0, 0, 0, 0, '2695247', '', '', '', '', '', 'viernes-domingo=9:30-16     lunes-jueves=cerrado \r', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_neg`
--

CREATE TABLE `tipo_neg` (
  `idtiponeg` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_neg`
--

INSERT INTO `tipo_neg` (`idtiponeg`, `tipo`) VALUES
(1, 'Restaurante'),
(2, 'Ir a un bar'),
(3, 'Salir a platicar'),
(4, 'Musica en vivo'),
(5, 'Ir de antro'),
(6, 'Conciertos'),
(7, 'Cultura'),
(8, 'Aventura'),
(9, 'Botanas'),
(10, 'El cine'),
(11, 'Desayuno'),
(12, 'Conocer & paser');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `telefono` int(11) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `id_gusto` int(11) NOT NULL,
  `id_tipous` int(11) NOT NULL,
  `idmun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `telefono`, `pass`, `id_gusto`, `id_tipous`, `idmun`) VALUES
(1, 'Rafa', 'rafa@mail.com', 2147483647, 'a123456', 1, 2, 1),
(2, 'Luis', 'luis@mail.com', 2147483647, 'A123456', 1, 2, 1),
(3, 'Ejemplo', 'ejemplo@mail.com', 2147483647, 'a123456', 1, 2, 1),
(4, 'Dexter', 'dexte@gmail.com', 2147483647, 'dexter13', 1, 2, 1),
(5, 'Adolfo Gomez', 'adolfo.gomez999@mail.com', 2147483647, 'a12345', 1, 2, 1),
(6, 'Norma', 'norma@hotmail.com', 2147483647, 'a12345', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `idzona` int(11) NOT NULL,
  `zona` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`idzona`, `zona`) VALUES
(1, 'Norte'),
(2, 'Sur'),
(3, 'Oriente'),
(4, 'Poniente'),
(5, 'Nor-Oriente'),
(6, 'Nor-Poniente'),
(7, 'Sur-Este');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcateg`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idestado`),
  ADD UNIQUE KEY `idestado` (`idestado`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idmun`),
  ADD KEY `idestado` (`idestado`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id_preference`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idprod`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD PRIMARY KEY (`idreser`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `suctipca`
--
ALTER TABLE `suctipca`
  ADD PRIMARY KEY (`issucursal`,`idpitoneg`,`idcateg`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idsucursal`),
  ADD KEY `idmun` (`idmun`);

--
-- Indices de la tabla `tipo_neg`
--
ALTER TABLE `tipo_neg`
  ADD PRIMARY KEY (`idtiponeg`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tipous` (`id_tipous`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`idzona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcateg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idestado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idmun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id_preference` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  MODIFY `idreser` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idsucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;
--
-- AUTO_INCREMENT de la tabla `tipo_neg`
--
ALTER TABLE `tipo_neg`
  MODIFY `idtiponeg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `idzona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idestado`) REFERENCES `estado` (`idestado`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
