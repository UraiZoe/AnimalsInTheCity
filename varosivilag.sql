-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Máj 29. 21:39
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `varosivilag`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `behavior_observations`
--

CREATE TABLE `behavior_observations` (
  `observation_id` int(11) NOT NULL,
  `location` int(100) NOT NULL,
  `species_id` int(11) NOT NULL,
  `behavior_description` varchar(255) NOT NULL,
  `severity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `behavior_observations`
--

INSERT INTO `behavior_observations` (`observation_id`, `location`, `species_id`, `behavior_description`, `severity`) VALUES
(1, 0, 1, 'Hulladék turkálás', 40),
(2, 0, 2, 'Kukafedél kinyitása', 60),
(3, 0, 7, 'Fészekanyag lopás', 25),
(4, 0, 3, 'Madáreleség elfogyasztása', 30),
(5, 0, 5, 'Csiga és rovarvadászat', 10),
(6, 0, 4, 'Nappali élelemszerzés', 35),
(7, 0, 6, 'Bokrok közötti zajkeltés éjjel', 50),
(8, 0, 1, 'Raktárak alatti fészkelés', 80),
(9, 0, 2, 'Szeméttárolók feltörése', 70),
(10, 0, 7, 'Ablakpárkányon csőrögetés', 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `continents`
--

CREATE TABLE `continents` (
  `continent_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `continents`
--

INSERT INTO `continents` (`continent_id`, `name`) VALUES
(1, 'Európa'),
(2, 'Észak-Amerika'),
(3, 'Ázsia');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `iso_code` char(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `continent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`country_id`, `iso_code`, `name`, `continent_id`) VALUES
(1, 'HU', 'Magyarország', 1),
(2, 'DE', 'Németország', 1),
(3, 'US', 'Egyesült Államok', 2),
(4, 'CA', 'Kanada', 2),
(5, 'CN', 'Kína', 3),
(6, 'JP', 'Japán', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species`
--

CREATE TABLE `species` (
  `species_id` int(11) NOT NULL,
  `latin_name` varchar(50) NOT NULL,
  `hungarian_name` varchar(50) NOT NULL,
  `family` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `species`
--

INSERT INTO `species` (`species_id`, `latin_name`, `hungarian_name`, `family`, `state`) VALUES
(1, 'Vulpes vulpes', 'Vörösróka', 'Canidae', 'Őshonos'),
(2, 'Procyon lotor', 'Mosómedve', 'Procyonidae', 'Invazív'),
(3, 'Sciurus vulgaris', 'Erdei mókus', 'Sciuridae', 'Őshonos'),
(4, 'Sciurus carolinensis', 'Amerikai mókus', 'Sciuridae', 'Invazív'),
(5, 'Erinaceus europaeus', 'Európai sün', 'Erinaceidae', 'Őshonos'),
(6, 'Nyctereutes procyonoides', 'Mosómedveszerű kutya', 'Canidae', 'Invazív'),
(7, 'Pica pica', 'Szarka', 'Corvidae', 'Őshonos');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species_continent`
--

CREATE TABLE `species_continent` (
  `species_id` int(11) NOT NULL,
  `continent_id` int(11) NOT NULL,
  `prevalence_rank` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `species_continent`
--

INSERT INTO `species_continent` (`species_id`, `continent_id`, `prevalence_rank`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 1, 2),
(2, 2, 1),
(3, 1, 1),
(3, 3, 2),
(4, 1, 2),
(4, 2, 1),
(5, 1, 1),
(6, 1, 2),
(6, 3, 1),
(7, 1, 1),
(7, 3, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species_country`
--

CREATE TABLE `species_country` (
  `species_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `species_country`
--

INSERT INTO `species_country` (`species_id`, `country_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 5),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(6, 1),
(6, 5),
(6, 6),
(7, 1),
(7, 2),
(7, 5);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `behavior_observations`
--
ALTER TABLE `behavior_observations`
  ADD PRIMARY KEY (`observation_id`),
  ADD KEY `species_id` (`species_id`);

--
-- A tábla indexei `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`continent_id`);

--
-- A tábla indexei `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `idx_countries_continent` (`continent_id`);

--
-- A tábla indexei `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`species_id`);

--
-- A tábla indexei `species_continent`
--
ALTER TABLE `species_continent`
  ADD PRIMARY KEY (`species_id`,`continent_id`),
  ADD KEY `idx_sp_cont_continent` (`continent_id`);

--
-- A tábla indexei `species_country`
--
ALTER TABLE `species_country`
  ADD PRIMARY KEY (`species_id`,`country_id`),
  ADD KEY `idx_sp_cou_country` (`country_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `behavior_observations`
--
ALTER TABLE `behavior_observations`
  MODIFY `observation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `continents`
--
ALTER TABLE `continents`
  MODIFY `continent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `species`
--
ALTER TABLE `species`
  MODIFY `species_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `fk_countries_continent` FOREIGN KEY (`continent_id`) REFERENCES `continents` (`continent_id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `species`
--
ALTER TABLE `species`
  ADD CONSTRAINT `species_ibfk_1` FOREIGN KEY (`species_id`) REFERENCES `behavior_observations` (`species_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `species_continent`
--
ALTER TABLE `species_continent`
  ADD CONSTRAINT `fk_sp_cont_continent` FOREIGN KEY (`continent_id`) REFERENCES `continents` (`continent_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sp_cont_species` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `species_country`
--
ALTER TABLE `species_country`
  ADD CONSTRAINT `fk_sp_cou_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sp_cou_species` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
