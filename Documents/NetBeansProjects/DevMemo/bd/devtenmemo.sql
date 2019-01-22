
DROP SCHEMA IF EXISTS devtenmemo;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `devtenmemo`
--
CREATE DATABASE IF NOT EXISTS `devtenmemo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `devtenmemo`;

-- --------------------------------------------------------

--
-- Structure de la table `memo`
--

CREATE TABLE IF NOT EXISTS `memo` (
  `idmemo` int(11) NOT NULL AUTO_INCREMENT,
  `contenue` text NOT NULL,
  `datecreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`idmemo`),
  KEY `fk_memo_user_idx` (`iduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `memo`
--

INSERT INTO `memo` (`idmemo`, `contenue`, `datecreation`, `iduser`) VALUES
(1, 'dejeuner boulot', '2019-01-21 10:26:38', 4),
(2, 'recuperation de la pierre philosophale', '2019-01-21 10:27:20', 9),
(3, 'rendez-vous nicolas flanel', '2019-01-21 10:27:36', 10),
(4, 'attentat du 11 septembre ', '2001-09-11 15:12:16', 5),
(5, 'pot de vin', '2019-01-21 10:28:59', 2),
(6, 'assasinat par le senat et brutus', '0150-05-12 11:13:14', 3),
(7, 'guerre de secession', '1861-04-12 17:20:05', 6),
(8, 'defiler de mode', '2019-01-21 10:31:08', 7),
(9, 'coupe de feu', '2005-11-08 12:53:55', 9),
(10, 'prisonnier d''azkaban', '2004-11-22 06:04:01', 9),
(11, 'chambre des secrets', '2002-12-04 18:40:12', 9),
(12, 'troisieme guerre mondiale', '2019-01-21 10:34:22', 8),
(13, 'le prince de sang-melée', '2009-12-08 09:12:30', 9),
(14, 'Fargo', '1996-07-11 08:23:20', 11),
(15, 'The Big Lebowski', '1998-02-23 15:13:44', 12),
(16, 'A Serious Man', '2009-11-10 18:24:32', 11),
(17, 'No country for old men', '2007-12-14 14:15:16', 12),
(18, 'The Barber', '2001-10-15 16:17:18', 11),
(19, 'True Grit', '2010-05-06 18:02:00', 12),
(20, 'Inside Llewyn Davis', '2013-04-08 19:01:28', 11),
(21, 'Arizona Junior', '1987-03-22 11:12:40', 12),
(22, 'Ave, Cesar!', '2016-02-22 15:10:09', 11),
(23, 'O''Brother', '2000-08-28 16:33:21', 12),
(24, 'Burn After Reading', '2008-09-15 17:21:13', 12),
(25, 'Barton Fink', '1991-09-12 16:20:12', 11),
(26, 'Le Grand Saut', '1994-12-15 19:23:15', 12),
(27, 'j''espere etre à l''heure pour mon epilation', '2019-01-22 10:20:19', 4),
(28, 'olala j''ai rendez-vous', '2019-01-22 10:26:30', 2),
(29, 'coucou anais, quand est ce qu''on mange sushis', '2019-01-22 10:27:07', 2),
(30, 'mes mémos marchent', '2019-01-22 10:29:37', 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `mail_UNIQUE` (`mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`iduser`, `nom`, `prenom`, `mail`, `mdp`) VALUES

(2, 'Sarkozy', 'Nicolas', 'nico92@hotmail.fr', 'nicoco'),
(3, 'Cesar', 'Jules', 'julou.sexy@outlook.fr', 'brutus'),
(4, 'Faure', 'Felix', 'felix113@gmail.com', 'lourmel'),
(5, 'Bush', 'George', 'g.bush@free.oil', '11septembre'),
(6, 'Lincolm', 'Abraham', 'abra.link@yahoo.com', 'popolo'),
(7, 'Lagerfield', 'Carl', 'carlo@gmail.com', 'etouiVU'),
(8, 'Beck', 'Jeff', 'jeff.beck@hotmail.com', 'halleluijah'),
(9, 'Potter', 'Harry', 'harryp@outlook.fr', 'ginnie'),
(10, 'Dumbledore', 'Albus', 'albidu33@gmail.mag', 'phoenix'),
(11, 'Coen', 'Joel', 'joel.coen@olala.fr', 'ethan'),
(12, 'Coen', 'Ethan', 'ethan.coen@olulu.fr', 'joel');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `memo`
--
ALTER TABLE `memo`
  ADD CONSTRAINT `fk_memo_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
