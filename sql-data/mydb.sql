-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 10 fév. 2019 à 20:34
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

CREATE USER ''@'%' IDENTIFIED BY '';

GRANT ALL ON data.* TO ''@'%'

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


DROP TABLE IF EXISTS `mydata`;
CREATE TABLE IF NOT EXISTS `mydata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data1` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `mydata` (`id`, `data1`) VALUES
(1, 76),
(2, 100);
COMMIT;
