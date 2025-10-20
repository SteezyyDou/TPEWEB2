-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2025 at 01:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catalogo_peliculas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `generos`
--

CREATE TABLE `generos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
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
-- Table structure for table `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `año` year(4) NOT NULL,
  `director` varchar(20) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `duracion` time NOT NULL,
  `genero_id` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `año`, `director`, `descripcion`, `duracion`, `genero_id`, `imagen`) VALUES
(1, 'Sonic 2', '2022', ' Jeff Fowler', 'Sonic y su compañero Tails emprenden un viaje alrededor del mundo en busca de una esmeralda que tiene el poder de destruir civilizaciones.', '02:02:00', 7, 'Sonic2'),
(2, 'Superman', '2025', 'James Gunn', 'El multimillonario tecnológico Lex Luthor aprovecha la oportunidad para quitarse de en medio definitivamente al Hombre de Acero. ¿Podrán la reportera Lois Lane y el compañero de cuatro patas de Superman, Krypto, ayudarle antes de que sea tarde?', '02:09:00', 1, 'Superman'),
(3, 'El Bueno, El Malo y El Feo', '1966', 'Sergio Leone', 'Tres hombres violentos pelean por una caja que alberga 200 000 dólares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde está el botín sin la ayuda de los otros dos, deben colaborar, pese a odiarse.', '02:41:00', 11, 'elBuenoelMaloyelFeo'),
(4, 'La Masacre de Texas', '1974', 'Tobe Hooper', 'Un grupo de jóvenes se pierde en Texas y termina encontrándose con asesinos dementes que los persiguen con motosierras.\r\n', '01:23:00', 5, 'LaMasacredeTexas'),
(7, 'Supercool', '2007', 'Greg Mottola', 'La ansiedad por la separación representa un problema para dos jóvenes estudiantes de último año de preparatoria, que esperan divertirse y conseguir chicas hermosas en su fiesta de graduación.', '01:59:00', 3, 'Supercool'),
(8, 'Secreto en la Montaña', '2005', 'Ang Lee', 'Dos vaqueros se conocen mientras esperan ser contratados por el ranchero Joe Aguirre. Cuando su jefe los envía a cuidar ganado a la montaña Brokeback, entre ambos surge un sentimiento especial que deriva en una relación íntima.', '00:00:00', 6, 'SecretoenlaMontaña'),
(9, 'Donnie Darko', '2001', 'Richard Kelly', 'Un joven extraño a menudo es visitado por un conejo profético, que como él, aguarda el inminente fin del mundo.\r\n', '01:43:00', 10, 'DonnieDarko'),
(10, 'el Silencio de los Inocentes', '1991', 'Jonathan Demme', 'Una agente en entrenamiento del FBI busca la ayuda y consejo de un brillante asesino para poder capturar a otro asesino, el doctor Hannibal Lecter, un psiquiatra que también es un psicópata violento y antropófago.', '01:58:00', 5, 'elSilenciodelosInocentes');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('usuario','admin') NOT NULL DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `rol`) VALUES
(1, 'webadmin', '$2y$10$ccnV7QJhJS4Xr50m6p5vde7mGZAHCFVutMPQmMo4D6XP/Ir9WlwRe', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generos_genero_id` (`genero_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `generos_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
