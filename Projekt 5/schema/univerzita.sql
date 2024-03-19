-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Generation Time: Mar 19, 2024 at 06:28 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.16
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Database: `univerzita`
--
CREATE DATABASE IF NOT EXISTS `univerzita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

USE `univerzita`;

-- --------------------------------------------------------
--
-- Table structure for table `Fakulty`
--
CREATE TABLE `Fakulty` (
  `id_fakulty` int NOT NULL,
  `nazev` varchar(100) NOT NULL,
  `id_dekan` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Fakulty`
--
INSERT INTO
  `Fakulty` (`id_fakulty`, `nazev`, `id_dekan`)
VALUES
  (1, 'Přírodovědecká Fakulta ', 9),
  (2, 'Pedagogická Fakulta', 7);

-- --------------------------------------------------------
--
-- Table structure for table `Katedry`
--
CREATE TABLE `Katedry` (
  `id_katedry` int NOT NULL,
  `id_fakulty` int DEFAULT NULL,
  `nazev_katedry` varchar(50) DEFAULT NULL,
  `id_vedouci` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Katedry`
--
INSERT INTO
  `Katedry` (
    `id_katedry`,
    `id_fakulty`,
    `nazev_katedry`,
    `id_vedouci`
  )
VALUES
  (1, 1, 'Informatika', 2),
  (2, 1, 'Matematika', 6),
  (3, 2, 'Ekonomie', 4);

-- --------------------------------------------------------
--
-- Table structure for table `Pozice`
--
CREATE TABLE `Pozice` (
  `id_pozice` int NOT NULL,
  `nazev_pozice` varchar(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Pozice`
--
INSERT INTO
  `Pozice` (`id_pozice`, `nazev_pozice`)
VALUES
  (1, 'Odborný asistent'),
  (2, 'Vedoucí katedry'),
  (3, 'Profesor'),
  (4, 'Děkan');

-- --------------------------------------------------------
--
-- Table structure for table `Predmety`
--
CREATE TABLE `Predmety` (
  `id_predmetu` int NOT NULL,
  `id_katedry` int DEFAULT NULL,
  `zkratka_predmetu` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nazev_predmetu` varchar(50) DEFAULT NULL,
  `popis_predmetu` varchar(500) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Predmety`
--
INSERT INTO
  `Predmety` (
    `id_predmetu`,
    `id_katedry`,
    `zkratka_predmetu`,
    `nazev_predmetu`,
    `popis_predmetu`
  )
VALUES
  (
    1,
    1,
    'INF101',
    'Úvod do programování',
    'Základy programování v jazyce Java.'
  ),
  (
    2,
    2,
    'MAT202',
    'Lineární algebra',
    'Matematická analýza v R3.'
  ),
  (
    3,
    3,
    'EK101',
    'Základy ekonomie',
    'Úvod do ekonomie a tržních mechanismů.'
  );

-- --------------------------------------------------------
--
-- Table structure for table `Studenti`
--
CREATE TABLE `Studenti` (
  `id_studenta` int NOT NULL,
  `st_cislo` varchar(10) DEFAULT NULL,
  `F_cislo` varchar(10) DEFAULT NULL,
  `id_fakulty` int DEFAULT NULL,
  `jmeno` varchar(255) DEFAULT NULL,
  `prijmeni` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Studenti`
--
INSERT INTO
  `Studenti` (
    `id_studenta`,
    `st_cislo`,
    `F_cislo`,
    `id_fakulty`,
    `jmeno`,
    `prijmeni`
  )
VALUES
  (1, '12345', '67890', 1, 'Lukáš', 'Černý'),
  (2, '23456', '98765', 2, 'Eva', 'Nová'),
  (3, '34567', '54321', 2, 'Michal', 'Kučera');

-- --------------------------------------------------------
--
-- Table structure for table `StudentTituly`
--
CREATE TABLE `StudentTituly` (
  `id_studenta` int NOT NULL,
  `id_titulu` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `StudentTituly`
--
INSERT INTO
  `StudentTituly` (`id_studenta`, `id_titulu`)
VALUES
  (1, 2),
  (2, 3),
  (3, 3);

-- --------------------------------------------------------
--
-- Table structure for table `Tituly`
--
CREATE TABLE `Tituly` (
  `id_titulu` int NOT NULL,
  `nazev_titulu` varchar(50) DEFAULT NULL,
  `zkratka` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Tituly`
--
INSERT INTO
  `Tituly` (`id_titulu`, `nazev_titulu`, `zkratka`)
VALUES
  (1, 'Doktor filozofie', 'PhDr.'),
  (2, 'Inženýr', 'Ing.'),
  (3, 'Magistr', 'Mgr.');

-- --------------------------------------------------------
--
-- Table structure for table `Zamestnanci`
--
CREATE TABLE `Zamestnanci` (
  `id_zamestnance` int NOT NULL,
  `id_katedry` int DEFAULT NULL,
  `jmeno` varchar(50) DEFAULT NULL,
  `prijmeni` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_pozice` int DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Zamestnanci`
--
INSERT INTO
  `Zamestnanci` (
    `id_zamestnance`,
    `id_katedry`,
    `jmeno`,
    `prijmeni`,
    `telefon`,
    `email`,
    `id_pozice`
  )
VALUES
  (
    1,
    1,
    'Tomáš',
    'Pospíšil',
    '777123456',
    'tomas.pospisil@fakulta.cz',
    1
  ),
  (
    2,
    1,
    'Jana',
    'Nováková',
    '777654321',
    'jana.novakova@fakulta.cz',
    2
  ),
  (
    3,
    2,
    'Petr',
    'Svoboda',
    '777987654',
    'petr.svoboda@fakulta.cz',
    1
  ),
  (
    4,
    3,
    'Martina',
    'Kovářová',
    '777456789',
    'martina.kovarova@fakulta.cz',
    2
  ),
  (
    5,
    1,
    'Martin',
    'Svoboda',
    '+420123456789',
    'martin.svoboda@example.com',
    3
  ),
  (
    6,
    2,
    'Lucie',
    'Kovářová',
    '+420987654321',
    'lucie.kovarova@example.com',
    2
  ),
  (
    7,
    2,
    'Jakub',
    'Nový',
    '+420555555555',
    'jakub.novy@example.com',
    4
  ),
  (
    8,
    3,
    'Veronika',
    'Černá',
    '+420111222333',
    'veronika.cerna@example.com',
    4
  ),
  (
    9,
    1,
    'Pavel',
    'Procházka',
    '+420777888999',
    'pavel.prochazka@example.com',
    4
  );

-- --------------------------------------------------------
--
-- Table structure for table `ZamestnanecTituly`
--
CREATE TABLE `ZamestnanecTituly` (
  `id_zamestnance` int NOT NULL,
  `id_titulu` int NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ZamestnanecTituly`
--
INSERT INTO
  `ZamestnanecTituly` (`id_zamestnance`, `id_titulu`)
VALUES
  (1, 2),
  (2, 3),
  (3, 3),
  (1, 1),
  (2, 1),
  (5, 2),
  (9, 3),
  (3, 1),
  (6, 2),
  (7, 3),
  (4, 2),
  (8, 3);

--
-- Indexes for dumped tables
--
--
-- Indexes for table `Fakulty`
--
ALTER TABLE
  `Fakulty`
ADD
  PRIMARY KEY (`id_fakulty`);

--
-- Indexes for table `Katedry`
--
ALTER TABLE
  `Katedry`
ADD
  PRIMARY KEY (`id_katedry`),
ADD
  KEY `id_fakulty` (`id_fakulty`);

--
-- Indexes for table `Pozice`
--
ALTER TABLE
  `Pozice`
ADD
  PRIMARY KEY (`id_pozice`);

--
-- Indexes for table `Predmety`
--
ALTER TABLE
  `Predmety`
ADD
  PRIMARY KEY (`id_predmetu`),
ADD
  KEY `id_katedry` (`id_katedry`);

--
-- Indexes for table `Studenti`
--
ALTER TABLE
  `Studenti`
ADD
  PRIMARY KEY (`id_studenta`),
ADD
  KEY `id_fakulty` (`id_fakulty`);

--
-- Indexes for table `StudentTituly`
--
ALTER TABLE
  `StudentTituly`
ADD
  KEY `fk_student_titul` (`id_titulu`),
ADD
  KEY `fk_student_titul_student` (`id_studenta`);

--
-- Indexes for table `Tituly`
--
ALTER TABLE
  `Tituly`
ADD
  PRIMARY KEY (`id_titulu`);

--
-- Indexes for table `Zamestnanci`
--
ALTER TABLE
  `Zamestnanci`
ADD
  PRIMARY KEY (`id_zamestnance`),
ADD
  KEY `fk_zamestnanci_katedry` (`id_katedry`),
ADD
  KEY `fk_zamestnanci_pozice` (`id_pozice`);

--
-- Indexes for table `ZamestnanecTituly`
--
ALTER TABLE
  `ZamestnanecTituly`
ADD
  KEY `fk_zamestnanec_titul` (`id_titulu`),
ADD
  KEY `fk_zamestnanec_titul_zamestnanci` (`id_zamestnance`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `Fakulty`
--
ALTER TABLE
  `Fakulty`
MODIFY
  `id_fakulty` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `Katedry`
--
ALTER TABLE
  `Katedry`
MODIFY
  `id_katedry` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `Pozice`
--
ALTER TABLE
  `Pozice`
MODIFY
  `id_pozice` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;

--
-- AUTO_INCREMENT for table `Predmety`
--
ALTER TABLE
  `Predmety`
MODIFY
  `id_predmetu` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `Studenti`
--
ALTER TABLE
  `Studenti`
MODIFY
  `id_studenta` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `Tituly`
--
ALTER TABLE
  `Tituly`
MODIFY
  `id_titulu` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `Zamestnanci`
--
ALTER TABLE
  `Zamestnanci`
MODIFY
  `id_zamestnance` int NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `Katedry`
--
ALTER TABLE
  `Katedry`
ADD
  CONSTRAINT `fk_katedry_fakulta` FOREIGN KEY (`id_fakulty`) REFERENCES `Fakulty` (`id_fakulty`);

--
-- Constraints for table `Predmety`
--
ALTER TABLE
  `Predmety`
ADD
  CONSTRAINT `fk_predmety_katedra` FOREIGN KEY (`id_katedry`) REFERENCES `Katedry` (`id_katedry`);

--
-- Constraints for table `Studenti`
--
ALTER TABLE
  `Studenti`
ADD
  CONSTRAINT `fk_studenti_fakulta` FOREIGN KEY (`id_fakulty`) REFERENCES `Fakulty` (`id_fakulty`),
ADD
  CONSTRAINT `Studenti_ibfk_1` FOREIGN KEY (`id_fakulty`) REFERENCES `Fakulty` (`id_fakulty`);

--
-- Constraints for table `StudentTituly`
--
ALTER TABLE
  `StudentTituly`
ADD
  CONSTRAINT `fk_student_titul` FOREIGN KEY (`id_titulu`) REFERENCES `Tituly` (`id_titulu`),
ADD
  CONSTRAINT `fk_student_titul_student` FOREIGN KEY (`id_studenta`) REFERENCES `Studenti` (`id_studenta`);

--
-- Constraints for table `Zamestnanci`
--
ALTER TABLE
  `Zamestnanci`
ADD
  CONSTRAINT `fk_zamestnanci_katedry` FOREIGN KEY (`id_katedry`) REFERENCES `Katedry` (`id_katedry`),
ADD
  CONSTRAINT `fk_zamestnanci_pozice` FOREIGN KEY (`id_pozice`) REFERENCES `Pozice` (`id_pozice`);

--
-- Constraints for table `ZamestnanecTituly`
--
ALTER TABLE
  `ZamestnanecTituly`
ADD
  CONSTRAINT `fk_zamestnanec_titul` FOREIGN KEY (`id_titulu`) REFERENCES `Tituly` (`id_titulu`),
ADD
  CONSTRAINT `fk_zamestnanec_titul_zamestnanci` FOREIGN KEY (`id_zamestnance`) REFERENCES `Zamestnanci` (`id_zamestnance`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;