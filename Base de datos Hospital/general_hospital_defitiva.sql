-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2024 a las 01:39:58
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
-- Base de datos: `general_hospital_defitiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cama`
--

CREATE TABLE `cama` (
  `Id_Cama` int(5) NOT NULL,
  `Numero_Cama` int(10) DEFAULT NULL,
  `Numero_Planta` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cama`
--

INSERT INTO `cama` (`Id_Cama`, `Numero_Cama`, `Numero_Planta`) VALUES
(1, 1, 2),
(2, 5, 7),
(3, 2, 3),
(4, 33, 1),
(5, 12, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `Id_Diagnostico` int(5) NOT NULL,
  `Codigo` int(5) DEFAULT NULL,
  `Descripcion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`Id_Diagnostico`, `Codigo`, `Descripcion`) VALUES
(1, 16346, 'Cancer'),
(2, 34712, 'Dermatitis'),
(3, 16846, 'Ceguera'),
(4, 13346, 'Irritacion'),
(5, 18946, 'VIH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico_medico`
--

CREATE TABLE `diagnostico_medico` (
  `Id_Diagnostico2` int(5) DEFAULT NULL,
  `Id_Medico2` int(5) DEFAULT NULL,
  `id_DiagnosticoM` int(10) DEFAULT NULL,
  `Id_MedicoD` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `Id_Medico` int(5) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL,
  `Apellidos` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`Id_Medico`, `Nombre`, `Apellidos`) VALUES
(1, 'Arturo', 'Montero'),
(2, 'Hector', 'Laboe'),
(3, 'Leonardo', 'Perez'),
(4, 'Nicol', 'Hernandez'),
(5, 'Viktor', 'Montenegro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `Id_Paciente` int(5) NOT NULL,
  `Seguridad_social` varchar(10) DEFAULT NULL,
  `Cedula` int(10) DEFAULT NULL,
  `Nombre` varchar(10) DEFAULT NULL,
  `Apellido` varchar(10) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Cama_paciente` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`Id_Paciente`, `Seguridad_social`, `Cedula`, `Nombre`, `Apellido`, `Fecha_nacimiento`, `Cama_paciente`) VALUES
(1, 'Capital_Sa', 1234567890, 'Juan', 'Perez', '1999-12-12', 1),
(2, 'Capital_Sa', 1265432134, 'Juan', 'Hernandez', '2000-12-12', 2),
(3, 'Famisanar', 1287567890, 'Nicolas', 'Perez', '1999-11-12', 3),
(4, 'Famisanar', 1234097890, 'Maicol', 'Perez', '2001-10-10', 4),
(5, 'Colsanitas', 1957567890, 'Juana', 'Perez', '1989-09-08', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_cama`
--

CREATE TABLE `paciente_cama` (
  `Id_Paciente1` int(5) DEFAULT NULL,
  `Id_Cama1` int(5) DEFAULT NULL,
  `id_PacienteC` int(10) DEFAULT NULL,
  `id_CamaP` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_diagnostico`
--

CREATE TABLE `paciente_diagnostico` (
  `Id_Paciente2` int(5) DEFAULT NULL,
  `Id_Diagnostico1` int(5) DEFAULT NULL,
  `id_PacienteD` int(10) DEFAULT NULL,
  `id_DiagnosticoP` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta`
--

CREATE TABLE `planta` (
  `Id_Planta` int(5) NOT NULL,
  `Numero_Planta` int(5) DEFAULT NULL,
  `Nombre` varchar(10) DEFAULT NULL,
  `Numero_Camas` int(5) DEFAULT NULL,
  `id_PacienteP` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `planta`
--

INSERT INTO `planta` (`Id_Planta`, `Numero_Planta`, `Nombre`, `Numero_Camas`, `id_PacienteP`) VALUES
(1, 12, 'Dermatolog', 9, NULL),
(2, 13, 'Odontologi', 10, NULL),
(3, 14, 'Urgencias', 20, NULL),
(4, 15, 'Oftalmolog', 15, NULL),
(5, 16, 'RayosX', 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_visita`
--

CREATE TABLE `tarjeta_visita` (
  `Id_Tarjeta_Visita` int(5) NOT NULL,
  `Numero_Tarjeta` int(5) DEFAULT NULL,
  `Hora_Comienzo` int(5) DEFAULT NULL,
  `Hora_Final` int(5) DEFAULT NULL,
  `id_TarjetaV` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta_visita`
--

INSERT INTO `tarjeta_visita` (`Id_Tarjeta_Visita`, `Numero_Tarjeta`, `Hora_Comienzo`, `Hora_Final`, `id_TarjetaV`) VALUES
(1, 12238, 10, 11, NULL),
(2, 16238, 12, 13, NULL),
(3, 19238, 14, 16, NULL),
(4, 12138, 14, 15, NULL),
(5, 12338, 17, 19, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_medica`
--

CREATE TABLE `visita_medica` (
  `Id_Visista_Medica` int(5) NOT NULL,
  `Fecha_Hora` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita_medica`
--

INSERT INTO `visita_medica` (`Id_Visista_Medica`, `Fecha_Hora`) VALUES
(1, '2024-02-12'),
(2, '2024-04-10'),
(3, '2024-01-07'),
(4, '2024-06-04'),
(5, '2024-08-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_medica_medico`
--

CREATE TABLE `visita_medica_medico` (
  `Id_Visita_Medica1` int(5) DEFAULT NULL,
  `Id_Medico1` int(5) DEFAULT NULL,
  `id_VisitaM` int(10) DEFAULT NULL,
  `id_MedicoV` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cama`
--
ALTER TABLE `cama`
  ADD PRIMARY KEY (`Id_Cama`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`Id_Diagnostico`);

--
-- Indices de la tabla `diagnostico_medico`
--
ALTER TABLE `diagnostico_medico`
  ADD KEY `fk_id11` (`id_DiagnosticoM`),
  ADD KEY `fk_id12` (`Id_MedicoD`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`Id_Medico`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`Id_Paciente`);

--
-- Indices de la tabla `paciente_cama`
--
ALTER TABLE `paciente_cama`
  ADD KEY `fk_id5` (`id_PacienteC`),
  ADD KEY `fk_id6` (`id_CamaP`);

--
-- Indices de la tabla `paciente_diagnostico`
--
ALTER TABLE `paciente_diagnostico`
  ADD KEY `fk_id7` (`id_PacienteD`),
  ADD KEY `fk_id8` (`id_DiagnosticoP`);

--
-- Indices de la tabla `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`Id_Planta`),
  ADD KEY `fk_PacienteP` (`id_PacienteP`);

--
-- Indices de la tabla `tarjeta_visita`
--
ALTER TABLE `tarjeta_visita`
  ADD PRIMARY KEY (`Id_Tarjeta_Visita`),
  ADD KEY `fk_TarjetaV` (`id_TarjetaV`);

--
-- Indices de la tabla `visita_medica`
--
ALTER TABLE `visita_medica`
  ADD PRIMARY KEY (`Id_Visista_Medica`);

--
-- Indices de la tabla `visita_medica_medico`
--
ALTER TABLE `visita_medica_medico`
  ADD KEY `fk_id9` (`id_VisitaM`),
  ADD KEY `fk_id10` (`id_MedicoV`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cama`
--
ALTER TABLE `cama`
  MODIFY `Id_Cama` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `Id_Diagnostico` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `Id_Medico` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `Id_Paciente` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `planta`
--
ALTER TABLE `planta`
  MODIFY `Id_Planta` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tarjeta_visita`
--
ALTER TABLE `tarjeta_visita`
  MODIFY `Id_Tarjeta_Visita` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `visita_medica`
--
ALTER TABLE `visita_medica`
  MODIFY `Id_Visista_Medica` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diagnostico_medico`
--
ALTER TABLE `diagnostico_medico`
  ADD CONSTRAINT `fk_id11` FOREIGN KEY (`id_DiagnosticoM`) REFERENCES `diagnostico` (`Id_Diagnostico`),
  ADD CONSTRAINT `fk_id12` FOREIGN KEY (`Id_MedicoD`) REFERENCES `medico` (`Id_Medico`);

--
-- Filtros para la tabla `paciente_cama`
--
ALTER TABLE `paciente_cama`
  ADD CONSTRAINT `fk_id5` FOREIGN KEY (`id_PacienteC`) REFERENCES `cama` (`Id_Cama`),
  ADD CONSTRAINT `fk_id6` FOREIGN KEY (`id_CamaP`) REFERENCES `pacientes` (`Id_Paciente`);

--
-- Filtros para la tabla `paciente_diagnostico`
--
ALTER TABLE `paciente_diagnostico`
  ADD CONSTRAINT `fk_id7` FOREIGN KEY (`id_PacienteD`) REFERENCES `pacientes` (`Id_Paciente`),
  ADD CONSTRAINT `fk_id8` FOREIGN KEY (`id_DiagnosticoP`) REFERENCES `diagnostico` (`Id_Diagnostico`);

--
-- Filtros para la tabla `planta`
--
ALTER TABLE `planta`
  ADD CONSTRAINT `fk_PacienteP` FOREIGN KEY (`id_PacienteP`) REFERENCES `pacientes` (`Id_Paciente`);

--
-- Filtros para la tabla `tarjeta_visita`
--
ALTER TABLE `tarjeta_visita`
  ADD CONSTRAINT `fk_TarjetaV` FOREIGN KEY (`id_TarjetaV`) REFERENCES `pacientes` (`Id_Paciente`);

--
-- Filtros para la tabla `visita_medica_medico`
--
ALTER TABLE `visita_medica_medico`
  ADD CONSTRAINT `fk_id10` FOREIGN KEY (`id_MedicoV`) REFERENCES `medico` (`Id_Medico`),
  ADD CONSTRAINT `fk_id9` FOREIGN KEY (`id_VisitaM`) REFERENCES `visita_medica` (`Id_Visista_Medica`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
