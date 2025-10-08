-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2025 a las 22:03:39
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `catalogo_peliculas_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'acción'),
(3, 'comedia'),
(4, 'drama'),
(5, 'terror'),
(6, 'romance'),
(7, 'animación'),
(8, 'documental'),
(9, 'musical'),
(10, 'ciencia ficción'),
(11, 'western');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `año` year(4) NOT NULL,
  `director` varchar(20) NOT NULL,
  `descripción` varchar(1000) NOT NULL,
  `duración` time NOT NULL,
  `genero_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `año`, `director`, `descripción`, `duración`, `genero_id`) VALUES
(1, 'Sonic2', 2022, ' Jeff Fowler', 'Sonic y su compañero Tails emprenden un viaje alrededor del mundo en busca de una esmeralda que tiene el poder de destruir civilizaciones.', '02:02:00', 7),
(2, 'Superman', 2025, 'James Gunn', 'El multimillonario tecnológico Lex Luthor aprovecha la oportunidad para quitarse de en medio definitivamente al Hombre de Acero. ¿Podrán la reportera Lois Lane y el compañero de cuatro patas de Superman, Krypto, ayudarle antes de que sea tarde?', '02:09:00', 1),
(3, 'El Bueno, El Malo y El Feo', 1966, 'Sergio Leone', 'Tres hombres violentos pelean por una caja que alberga 200 000 dólares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde está el botín sin la ayuda de los otros dos, deben colaborar, pese a odiarse.', '02:41:00', 11),
(4, 'La Masacre de Texas', 1974, 'Tobe Hooper', 'Un grupo de jóvenes se pierde en Texas y termina encontrándose con asesinos dementes que los persiguen con motosierras.\r\n', '01:23:00', 5),
(7, 'Supercool', 2007, 'Greg Mottola', 'La ansiedad por la separación representa un problema para dos jóvenes estudiantes de último año de preparatoria, que esperan divertirse y conseguir chicas hermosas en su fiesta de graduación.', '01:59:00', 3),
(8, 'Secreto en la Montaña', 2005, 'Ang Lee', 'Dos vaqueros se conocen mientras esperan ser contratados por el ranchero Joe Aguirre. Cuando su jefe los envía a cuidar ganado a la montaña Brokeback, entre ambos surge un sentimiento especial que deriva en una relación íntima.', '00:00:00', 6),
(9, 'Donnie Darko', 2001, 'Richard Kelly', 'Un joven extraño a menudo es visitado por un conejo profético, que como él, aguarda el inminente fin del mundo.\r\n', '01:43:00', 10),
(10, 'el Silencio de los Inocentes', 1991, 'Jonathan Demme', 'Una agente en entrenamiento del FBI busca la ayuda y consejo de un brillante asesino para poder capturar a otro asesino, el doctor Hannibal Lecter, un psiquiatra que también es un psicópata violento y antropófago.', '01:58:00', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generos_genero_id` (`genero_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `generos_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
