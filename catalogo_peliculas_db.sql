-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2025 a las 02:28:23
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
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Acción'),
(3, 'Comedia'),
(4, 'Drama'),
(5, 'Terror'),
(6, 'Romance'),
(7, 'Animación'),
(8, 'Documental'),
(9, 'Musical'),
(10, 'Ciencia ficción'),
(11, 'Western'),
(12, 'Crimen'),
(13, 'Fantasia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `año` year(4) NOT NULL,
  `director` varchar(20) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `duracion` time NOT NULL,
  `genero_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `año`, `director`, `descripcion`, `duracion`, `genero_id`) VALUES
(1, 'Sonic 2', 2022, ' Jeff Fowler', 'Sonic y su compañero Tails emprenden un viaje alrededor del mundo en busca de una esmeralda que tiene el poder de destruir civilizaciones.', '02:02:00', 7),
(2, 'Superman', 2025, 'James Gunn', 'El multimillonario tecnológico Lex Luthor aprovecha la oportunidad para quitarse de en medio definitivamente al Hombre de Acero. ¿Podrán la reportera Lois Lane y el compañero de cuatro patas de Superman, Krypto, ayudarle antes de que sea tarde?', '02:09:00', 1),
(3, 'El Bueno, El Malo y El Feo', 1966, 'Sergio Leone', 'Tres hombres violentos pelean por una caja que alberga 200 000 dólares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde está el botín sin la ayuda de los otros dos, deben colaborar, pese a odiarse.', '02:41:00', 11),
(4, 'La Masacre de Texas', 1974, 'Tobe Hooper', 'Un grupo de jóvenes se pierde en Texas y termina encontrándose con asesinos dementes que los persiguen con motosierras.\r\n', '01:23:00', 5),
(7, 'Supercool', 2007, 'Greg Mottola', 'La ansiedad por la separación representa un problema para dos jóvenes estudiantes de último año de preparatoria, que esperan divertirse y conseguir chicas hermosas en su fiesta de graduación.', '01:59:00', 3),
(8, 'Secreto en la Montaña', 2005, 'Ang Lee', 'Dos vaqueros se conocen mientras esperan ser contratados por el ranchero Joe Aguirre. Cuando su jefe los envía a cuidar ganado a la montaña Brokeback, entre ambos surge un sentimiento especial que deriva en una relación íntima.', '00:00:00', 6),
(9, 'Donnie Darko', 2001, 'Richard Kelly', 'Un joven extraño a menudo es visitado por un conejo profético, que como él, aguarda el inminente fin del mundo.\r\n', '01:43:00', 10),
(10, 'el Silencio de los Inocentes', 1991, 'Jonathan Demme', 'Una agente en entrenamiento del FBI busca la ayuda y consejo de un brillante asesino para poder capturar a otro asesino, el doctor Hannibal Lecter, un psiquiatra que también es un psicópata violento y antropófago.', '01:58:00', 5),
(16, 'Airheads', 1994, 'Michael Lehmann', 'Unos músicos hambrientos de publicidad llaman la atención de la prensa secuestrando al personal de una radiodifusora.', '01:32:00', 3),
(17, 'La naranja mecánica', 1971, 'Stanley Kubrick', 'Un criminal en la Inglaterra del futuro pasa una serie de procesos experimentales para corregir sus impulsos violentos.', '02:39:00', 12),
(18, 'Caracortada', 1984, 'Brian De Palma', 'Un inmigrante cubano de las cárceles de Fidel Castro provoca un camino de destrucción en su ascenso en el mundo de las drogas de Miami.', '02:45:00', 12),
(19, 'Viernes 13', 1980, 'Sean S. Cunningham', 'El campamento de verano del lago Cristal reabre sus puertas tras permanecer varios años cerrado a raíz de un accidente. A partir de ese momento, comienza a aparecer gente muerta en extrañas circunstancias.', '01:35:00', 5),
(21, 'El Señor de los Anillos', 2001, 'Peter Jackson', 'Desde la idílica comarca de los Hobbits hasta los humeantes abismos de Mordor, Frodo Bolsón se embarca en su épica cruzada por destruir el anillo de Sauron.', '02:58:00', 13),
(23, 'Dragon Ball Super: Broly', 2018, 'Tatsuya Nagamine', 'Goku y Vegeta se encuentran con Broly, un guerrero Saiyajin diferente a cualquier luchador al que se hayan enfrentado antes.', '01:40:00', 1),
(24, 'Exterminio', 2002, 'Danny Boyle', 'Un grupo de activistas ataca un laboratorio en el que se experimenta con primates y los libera. Lo que los activistas desconocen es que los animales han sido infectados con una poderosa variante del virus de la rabia, que se transmite a través de la sangre o la saliva y cuyos efectos son devastadores e inmediatos, dejando al individuo contaminado en un estado de permanente rabia asesina. En menos de un mes, todo el Reino Unido está infectado.', '01:53:00', 5),
(25, 'Super Mario Bros. La película ', 2023, 'Aaron Horvath', 'Dos hermanos plomeros, Mario y Luigi, caen por las alcantarillas y llegan a un mundo subterráneo mágico en el que deben enfrentarse al malvado Bowser para rescatar a la princesa Peach, quien ha sido forzada a aceptar casarse con él.', '01:32:00', 7),
(26, 'Scary Movie', 2000, 'Keenen Ivory Wayans', 'En esta parodia de las películas de terror modernas, un año después de atropellar a un hombre y deshacerse del cadáver, un grupo de adolescentes es acechado por un asesino en serie bastante inútil.', '01:28:00', 3),
(27, 'Cara de Guerra', 1987, 'Stanley Kubrick', 'Un infante de marina y sus compañeros se enfrentan al entrenamiento básico bajo la guía de un sargento sádico y pelean en la ofensiva Tet de 1968.', '01:56:00', 1),
(28, 'La La Land: ciudad de sueños', 2016, 'Damien Chazelle', 'Sebastian, un pianista de jazz, y Mia, una aspirante a actriz, se enamoran locamente; pero la ambición desmedida que tienen por triunfar en sus respectivas carreras, en una ciudad como Los Ángeles, repleta de competencia y carente de piedad, pone en peligro su amor.', '02:08:00', 6),
(29, 'El rey león', 1994, 'Rob Minkoff', 'El joven Simba, hijo del rey Mufasa, debe luchar contra su malvado tío Scar para ocupar el trono que dejó su padre asesinado.', '01:29:00', 9),
(30, 'Rambo: primera sangre', 1982, 'Ted Kotcheff', 'El veterano de Vietnam, John Rambo, envuelve a la policía en una cacería en el bosque tras escapar de un vil comisario.', '01:33:00', 1),
(31, 'Toy Story', 1995, 'John Lasseter', 'Woody, el juguete favorito de Andy, se siente amenazado por la inesperada llegada de Buzz Lightyear, el guardián del espacio.', '01:21:00', 3),
(32, 'Psicópata americano', 2000, 'Mary Harron', 'En la década de 1980, Patrick Bateman es un hombre exitoso y obsesionado por la competencia y por la perfección material, quien utiliza los más caros cosméticos masculinos, equipos de gimnasia, solárium y demás maquinaria estética para lograr un cuerpo atlético y bien acicalado, identificador material del éxito social.', '01:42:00', 3),
(33, 'El Hombre Araña 2', 2004, 'Sam Raimi', 'El atormentado Peter Parker lucha contra un científico siniestro que utiliza sus tentáculos mecánicos con fines destructivos.', '02:21:00', 1),
(34, 'La máscara', 1994, 'Chuck Russell', 'Una máscara antigua transforma a un monótono empleado bancario en un Romeo sonriente con poderes sobrehumanos.', '01:41:00', 3),
(35, 'Náufrago', 2001, 'Robert Zemeckis', 'Tras una accidente aéreo, Chuck Noland, ingeniero de Federal Express, intenta sobrevivir durante años en una isla completamente desierta.', '02:23:00', 4),
(36, 'El hombre gris', 2022, 'Anthony Russo', 'El principal activo de la CIA, cuya identidad nadie conoce, descubre secretos de la agencia. La confesión lo pone en el punto de mira de sicarios de todo el planeta, cuyo antiguo colega les ha ordenado que lo asesinen.', '02:02:00', 1),
(37, 'Tren Bala', 2022, 'David Leitch', 'En un tren de alta velocidad que se dirige de Tokio a Morioka, cinco asesinos profesionales descubren que van tras el mismo objetivo.', '02:06:00', 1),
(38, 'Iron Man: el hombre de hierro', 2008, 'Jon Favreau', 'Un empresario millonario construye un traje blindado y lo usa para combatir el crimen y el terrorismo.', '02:06:00', 1),
(39, 'Tiburon', 1975, 'Steven Spielberg', 'Un gigantesco tiburón blanco amenaza a los habitantes y turistas de un pueblo costero. El alcalde encomienda la caza del escualo al jefe de la policía, un pescador y un científico. El grupo se da cuenta de que es un animal inteligente y violento.', '02:04:00', 5),
(40, 'Hellboy', 2004, 'Guillermo del Toro', 'Los nazis recurren a la magia negra para sobrevivir tras la Segunda Guerra Mundial. En una ceremonia, crean al hijo del diablo: Hellboy.', '02:02:00', 1),
(41, 'Star Wars: Episodio IV', 1977, 'George Lucas', 'El destino de la galaxia cambia para siempre cuando Luke Skywalker descubre su poderosa conexión con una misteriosa Fuerza y ​​se lanza al espacio para rescatar a la Princesa Leia . Guiado por un sabio Maestro Jedi y con la oposición del amenazante Darth Vader, Luke da sus primeros pasos en el viaje de un héroe.', '02:01:00', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('usuario','admin') NOT NULL DEFAULT 'usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `rol`) VALUES
(1, 'webadmin', '$2y$10$ccnV7QJhJS4Xr50m6p5vde7mGZAHCFVutMPQmMo4D6XP/Ir9WlwRe', 'admin'),
(2, 'usuario', '$2y$10$.toI/7api/SKIQFvZ7E5FuMKVXhFmSwvhQcGdFPUE5gZ7.1YGGP6y', 'usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `generos_genero_id` (`genero_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `generos_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
