-- ELIMINAR TABLAS SI YA EXISTEN

DROP TABLE IF EXISTS `pago`;
DROP TABLE IF EXISTS `metodo_pago`;
DROP TABLE IF EXISTS `plan_gira`;
DROP TABLE IF EXISTS `apoderado`;
DROP TABLE IF EXISTS `alumno`;
DROP TABLE IF EXISTS `curso`;
DROP TABLE IF EXISTS `colegio`;

--CREAR TABLAS

CREATE TABLE `alumno` (
  `RUN_ALUMNO` int(8) NOT NULL,
  `RUN_DV_ALUMNO` varchar(1) NOT NULL,
  `NOMBRE_ALUMNO` varchar(60) NOT NULL,
  `APELLIDO_ALUMNO` varchar(60) NOT NULL,
  `ID_CURSO` int(11) NOT NULL,
  `ID_PLAN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `apoderado` (
  `RUN_APODERADO` int(8) NOT NULL,
  `RUN_DV_APODERADO` varchar(1) NOT NULL,
  `NOMBRE_COMPLETO_APODERADO` varchar(150) NOT NULL,
  `MAIL_APODERADO` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `colegio` (
  `ID_COLEGIO` int(11) NOT NULL,
  `NOMBRE_COLEGIO` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `curso` (
  `ID_CURSO` int(11) NOT NULL,
  `NOMBRE_CURSO` varchar(60) NOT NULL,
  `AÑO_CURSO` int(4) NOT NULL,
  `ID_COLEGIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `metodo_pago` (
  `ID_METODO` int(11) NOT NULL,
  `NOMBRE_METODO` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `pago` (
  `ID_PAGO` int(11) NOT NULL,
  `MONTO_PAGADO` int(8) NOT NULL,
  `MONTO_RESTANTE` int(8) NOT NULL,
  `FECHA_PAGO` date NOT NULL,
  `RUN_ALUMNO` int(8) NOT NULL,
  `RUN_APODERADO` int(8) NOT NULL,
  `ID_METODO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `plan_gira` (
  `ID_PLAN` int(11) NOT NULL,
  `NOMBRE_PLAN` varchar(80) NOT NULL,
  `MONTO_ALUMNO` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--MODIFICAR TABLAS, PK, FK, AUTOINCREMENTAL

ALTER TABLE `alumno`
  ADD PRIMARY KEY (`RUN_ALUMNO`),
  ADD KEY `FN_ALUMNO_CURSO` (`ID_CURSO`),
  ADD KEY `FN_ALUMNO_PLANGIRA` (`ID_PLAN`);

ALTER TABLE `apoderado`
  ADD PRIMARY KEY (`RUN_APODERADO`);

ALTER TABLE `colegio`
  ADD PRIMARY KEY (`ID_COLEGIO`);

ALTER TABLE `curso`
  ADD PRIMARY KEY (`ID_CURSO`),
  ADD KEY `FN_CURSO_COLEGIO` (`ID_COLEGIO`);

ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`ID_METODO`);

ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_PAGO`),
  ADD KEY `FN_PAGO_ALUMNO` (`RUN_ALUMNO`),
  ADD KEY `FN_PAGO_APODERADO` (`RUN_APODERADO`),
  ADD KEY `FN_PAGO_METODOPAGO` (`ID_METODO`);

ALTER TABLE `plan_gira`
  ADD PRIMARY KEY (`ID_PLAN`);

ALTER TABLE `colegio`
  MODIFY `ID_COLEGIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `curso`
  MODIFY `ID_CURSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `metodo_pago`
  MODIFY `ID_METODO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `pago`
  MODIFY `ID_PAGO` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `plan_gira`
  MODIFY `ID_PLAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `alumno`
  ADD CONSTRAINT `FN_ALUMNO_CURSO` FOREIGN KEY (`ID_CURSO`) REFERENCES `curso` (`ID_CURSO`),
  ADD CONSTRAINT `FN_ALUMNO_PLANGIRA` FOREIGN KEY (`ID_PLAN`) REFERENCES `plan_gira` (`ID_PLAN`);

ALTER TABLE `curso`
  ADD CONSTRAINT `FN_CURSO_COLEGIO` FOREIGN KEY (`ID_COLEGIO`) REFERENCES `colegio` (`ID_COLEGIO`);

ALTER TABLE `pago`
  ADD CONSTRAINT `FN_PAGO_ALUMNO` FOREIGN KEY (`RUN_ALUMNO`) REFERENCES `alumno` (`RUN_ALUMNO`),
  ADD CONSTRAINT `FN_PAGO_APODERADO` FOREIGN KEY (`RUN_APODERADO`) REFERENCES `apoderado` (`RUN_APODERADO`),
  ADD CONSTRAINT `FN_PAGO_METODOPAGO` FOREIGN KEY (`ID_METODO`) REFERENCES `metodo_pago` (`ID_METODO`);

--INSERTAR DATOS

INSERT INTO `alumno` (`RUN_ALUMNO`, `RUN_DV_ALUMNO`, `NOMBRE_ALUMNO`, `APELLIDO_ALUMNO`, `ID_CURSO`, `ID_PLAN`) VALUES
(5028848, 'k', 'Samuel', ' Artigas Alba', 22, 3),
(5032792, '2', 'Maristela', 'Manso Galván', 23, 3),
(5349257, '6', 'José', 'Galvez Gallego', 14, 2),
(5403929, '8', 'Marisa', 'Romeu Feijoo', 8, 1),
(5665551, '4', 'Paca', 'Granados Gámez', 7, 1),
(5764688, '8', 'Epifanio', 'Tolosa', 15, 2),
(5842080, '8', 'Amador', 'Peláez Perera', 12, 2),
(5963623, '5', 'Nazario', 'Cárdenas Pina', 8, 1),
(6366341, '7', 'Luisa', 'Mariño-Parejo', 9, 2),
(6372503, 'k', 'Vilma', 'Rosselló Llopis', 20, 3),
(6470093, '6', 'Adalberto', 'Ropero Vidal', 8, 1),
(6610635, '7', 'Miguel', 'Acosta Berenguer', 17, 3),
(6651067, '0', 'Carmelita', 'Sevillano Segura', 6, 1),
(6743127, '8', 'Ruy', 'Sebastián-Morata', 9, 2),
(6768415, 'k', 'Luís', 'Campillo Cerezo', 17, 3),
(7005305, '5', 'Bernabé', 'Sedano Casals', 18, 3),
(7050390, '5', 'Clímaco', 'Chico Barrio', 2, 1),
(7397753, '3', 'Juanita', 'Torre Calatayud', 17, 3),
(7451714, '5', 'Nidia', 'Gascón Villanueva', 11, 2),
(7476414, '2', 'Ángela', 'Mendez', 9, 2),
(7595552, '9', 'Eulalia', 'Ferrer', 4, 1),
(8038942, '6', 'Elba', 'Valderrama Asensio', 14, 2),
(8324374, '0', 'Ágata', 'Espinosa Azcona', 24, 3),
(9561666, '6', 'Mirta', 'Nogués Lerma', 20, 3),
(9864493, '8', 'Leonel', 'Campo Aznar', 24, 3),
(9885052, 'k', 'Adelardo', 'Soria Pineda', 14, 2),
(9955113, '5', 'Tatiana', 'Frutos Navarro', 22, 3),
(10036281, '3', 'Diana', 'Bartolomé Mateo', 13, 2),
(10482603, '2', 'Albano', 'Carbonell Leal', 1, 1),
(10890881, '5', 'Olivia', 'Aranda Beltrán', 10, 2),
(11095888, '9', 'Genoveva', 'Rius Pintor', 19, 3),
(11161362, '1', 'Amancio', 'Martin Andres', 20, 3),
(11491953, '5', 'Anabel', 'Riera Taboada', 23, 3),
(11689699, '0', 'Hernán', 'Silva-Rebollo', 24, 3),
(11941795, '3', 'Noa', 'Arnaiz Pellicer', 11, 2),
(12115935, 'k', 'Guadalupe', 'Vazquez Infante', 10, 2),
(12321946, '5', 'Clemente', 'Bautista Mariño', 3, 1),
(12327018, '5', 'Albina', 'Canales Barón', 6, 1),
(12863387, '1', 'Severino', 'Rico Vila', 19, 3),
(13133115, '0', 'Adela', 'Amaya Boada', 9, 2),
(13267324, '1', 'Atilio', 'Guzmán', 18, 3),
(13278109, '5', 'Adelardo', 'Blázquez Castell', 1, 1),
(13339220, '3', 'Martirio', 'Cantón Escolano', 19, 3),
(13644931, '1', 'Clementina', 'de Casares', 3, 1),
(13711412, '7', 'Yaiza', 'Carreño', 13, 2),
(13881212, 'k', 'Loreto', 'Cobos Frutos', 18, 3),
(13893985, '5', 'David', 'Tejero Fabra', 4, 1),
(13897031, '0', 'Haroldo', 'Méndez Vila', 15, 2),
(14460897, '6', 'Constanza', 'Armengol Gabaldón', 2, 1),
(14477849, '9', 'Albino', 'Hurtado Galván', 7, 1),
(14516282, '3', 'Laura', 'Aragonés Manso', 16, 2),
(14683288, '1', 'Seve', 'del Peral', 19, 3),
(14735432, '0', 'Quique', 'Amat Lopez', 11, 2),
(14737022, '9', 'Evangelina', 'Gual Quesada', 12, 2),
(15433575, '7', 'Kike', 'Valls Arribas', 15, 2),
(15473342, '6', 'Anselma', 'Gimenez Borrego', 21, 3),
(15485564, '5', 'Obdulia', 'del Hervia', 13, 2),
(15634901, '1', 'Silvio', 'Piñol Gámez', 1, 1),
(15641508, '1', 'Fabián', 'Cleto Sáez Hidalgo', 6, 1),
(15819808, '8', 'Buenaventura', 'Acosta Sacristán', 23, 3),
(16146914, '9', 'Charo', 'Gonzalez Barceló', 10, 2),
(16319005, '2', 'Amaro', 'Castrillo Ramírez', 4, 1),
(16599845, '6', 'Damián', 'Peiró-Pinto', 14, 2),
(16671618, '7', 'Javier', 'Escribano Pedraza', 2, 1),
(16756291, '4', 'Silvestre', 'Ugarte-Guillén', 21, 3),
(16876544, '4', 'Paulina', 'Mesa Calvo', 21, 3),
(16973075, 'k', 'Concha', 'Iniesta-Macías', 18, 3),
(17340880, '3', 'Gustavo', 'del Rosa', 3, 1),
(17540815, '0', 'Nicanor', 'Fuertes', 1, 1),
(17544210, '3', 'Lucía', 'Ayllón', 10, 2),
(17578324, '5', 'Ainara', 'Macías', 10, 2),
(17604573, '6', 'Albert', 'Quesada', 23, 3),
(17604725, '9', 'Juanita', 'Aguiló Marqués', 4, 1),
(17765991, '6', 'Herminia', 'Salamanca Artigas', 17, 3),
(17863878, '5', 'Clarisa', 'Gaya Alfaro', 12, 2),
(18545562, '9', 'Nidia', 'Puga Caparrós', 17, 3),
(19107842, 'k', 'Jovita', 'Aguado Martí', 22, 3),
(19594636, '1', 'Dora', 'Maura Bravo Baró', 22, 3),
(19708738, '2', 'Heliodoro', 'Garay Pascual', 14, 2),
(19770348, '2', 'José', 'Barriga Villalobos', 7, 1),
(19981347, '1', 'Maura', 'Campillo Alberola', 6, 1),
(20028390, '2', 'Luís', 'Luna Torrens', 13, 2),
(20093363, 'k', 'Amanda', 'Vera', 5, 1),
(20093828, '3', 'Francisco', 'Pacheco Girona', 7, 1),
(20470605, '0', 'Silvestre', 'Gilabert Cabezas', 11, 2),
(20534051, '3', 'Luciana', 'Arellano Robledo', 15, 2),
(20579953, '2', 'Jose', 'Quevedo', 20, 3),
(20876135, '8', 'Jordana', 'Coloma Botella', 6, 1),
(20908427, '9', 'Fausto', 'Carbonell Roma', 9, 2),
(20961728, '5', 'Patricio', 'Ferrera', 5, 1),
(21396274, '4', 'Judith', 'Marti Escrivá', 21, 3),
(21399580, '4', 'Josefa', 'Villar', 23, 3),
(21691117, '2', 'Édgar', 'Menendez Roura', 11, 2),
(21767535, '9', 'Cecilio', 'Manjón', 2, 1),
(21864187, '3', 'Albano', 'Roca Ríos', 18, 3),
(21962283, 'k', 'Renata', 'Esteban Otero', 12, 2),
(22089044, '9', 'Ariel', 'de Rivera', 20, 3),
(22372023, '4', 'Modesto', 'Uriarte Caballero', 2, 1),
(22377203, 'k', 'Marta', 'Martínez Perea', 16, 2),
(22541277, '4', 'Julio', 'Sabater Cazorla', 5, 1),
(22761355, '6', 'Adalberto', 'Coloma Barragán', 4, 1),
(22995380, 'k', 'Ámbar', 'Bosch Esteve', 16, 2),
(23147006, '9', 'Anselma', 'del Villalonga', 19, 3),
(23211945, '4', 'Adrián', 'Rivero Colom', 16, 2),
(23629238, 'k', 'Celso', 'Marcos Infante', 8, 1),
(23729765, '2', 'Rosalva', 'Roman Colomer', 13, 2),
(23875082, '2', 'Roberto', 'Rico-Valera', 8, 1),
(24009494, '0', 'Rosendo', 'Coll', 3, 1),
(24375773, '8', 'Nieves', 'del Quirós', 15, 2),
(24938306, '6', 'José', 'Lago Roldan', 22, 3);

INSERT INTO `apoderado` (`RUN_APODERADO`, `RUN_DV_APODERADO`, `NOMBRE_COMPLETO_APODERADO`, `MAIL_APODERADO`) VALUES
(5330194, '0', 'Alejandra Cámara Amorós', 'Alejandra5330@gmail.com'),
(5624951, '6', 'Seve Navarro Trillo', 'Seve5624@gmail.com'),
(6070306, 'k', 'Ciro Garcia-Arce', 'Ciro6070@gmail.com'),
(9501064, '4', 'Rosario María Del Carmen', 'Rosario9501@gmail.com'),
(11674206, '3', 'Teodora Atienza Saldaña', 'Teodora1167@gmail.com'),
(15704297, '1', 'Jose Manuel Valentín Casas Pineda', 'Jose1570@gmail.com'),
(15985033, '1', 'Luís Jordán Marí', 'Luís1598@gmail.com'),
(18436635, '5', 'Tere Bello-Belmonte', 'Tere1843@gmail.com'),
(23832207, '3', 'Mariana Navarro Pallarès', 'Mariana2383@gmail.com'),
(24786800, '3', 'Rosaura Mónica Leon Diez', 'Rosaura2478@gmail.com');

INSERT INTO `colegio` (`ID_COLEGIO`, `NOMBRE_COLEGIO`) VALUES
(1, 'Preparatoria Shohoku'),
(2, 'Preparatoria Ryonan'),
(3, 'Instituto Kainan'),
(4, 'Preparatoria Shoyo'),
(5, 'INBA'),
(6, 'Liceo de Aplicación'),
(7, 'Escuela primaria de Springfield'),
(8, 'Escuela Primaria de South Park');

INSERT INTO `curso` (`ID_CURSO`, `NOMBRE_CURSO`, `AÑO_CURSO`, `ID_COLEGIO`) VALUES
(1, '3°A', 2023, 1),
(2, '3°A', 2023, 2),
(3, '3°A', 2023, 3),
(4, '3°A', 2023, 4),
(5, '3°A', 2023, 5),
(6, '3°A', 2023, 6),
(7, '3°A', 2023, 7),
(8, '3°A', 2023, 8),
(9, '3°B', 2023, 1),
(10, '3°B', 2023, 2),
(11, '3°B', 2023, 3),
(12, '3°B', 2023, 4),
(13, '3°B', 2023, 5),
(14, '3°B', 2023, 6),
(15, '3°B', 2023, 7),
(16, '3°B', 2023, 8),
(17, '3°C', 2023, 1),
(18, '3°C', 2023, 2),
(19, '3°C', 2023, 3),
(20, '3°C', 2023, 4),
(21, '3°C', 2023, 5),
(22, '3°C', 2023, 6),
(23, '3°C', 2023, 7),
(24, '3°C', 2023, 8);

INSERT INTO `metodo_pago` (`ID_METODO`, `NOMBRE_METODO`) VALUES
(1, 'Tarjeta de Débito'),
(2, 'Tarjeta de Crédito'),
(3, 'Transferencia Bancaria'),
(4, 'Webpay'),
(5, 'Sodexo Junaeb');

INSERT INTO `plan_gira` (`ID_PLAN`, `NOMBRE_PLAN`, `MONTO_ALUMNO`) VALUES
(1, 'Gira de Estudio: Bariloche', 600000),
(2, 'Gira de Estudio: Rio de Janeiro', 800000),
(3, 'Gira de Estudio: Auschwitz Birkenau', 1000000);

COMMIT;


