-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `imdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `imdb`;

DROP TABLE IF EXISTS `cast_info`;
CREATE TABLE `cast_info` (
  `movie_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `char_name` varchar(50) NOT NULL,
  `role` enum('lead','supporting','guest') NOT NULL,
  PRIMARY KEY (`movie_id`,`person_id`,`role`,`char_name`),
  KEY `movie_id` (`movie_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `cast_info_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  CONSTRAINT `cast_info_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cast_info` (`movie_id`, `person_id`, `char_name`, `role`) VALUES
(1,	1,	'Frank Underwood',	'lead'),
(1,	2,	'Claire Underwood',	'lead'),
(1,	3,	'Doug Stamper',	'supporting'),
(2,	4,	' Tyrion Lannister',	'supporting'),
(2,	5,	'Cersei Lannister',	'supporting'),
(2,	6,	'Daenerys Targaryen',	'supporting'),
(2,	7,	'Jon Snow',	'supporting'),
(2,	8,	'Sansa Stark',	'supporting'),
(2,	9,	'Arya Stark',	'supporting'),
(2,	10,	'Jaime Lannister',	'supporting'),
(2,	11,	'Jorah Mormont',	'supporting'),
(2,	12,	'Jorah Mormont',	'supporting'),
(2,	13,	'Samwell Tarly',	'supporting'),
(2,	14,	'Petyr \'Littlefinger\' Baelish',	'supporting'),
(2,	15,	'Lord Varys',	'supporting'),
(2,	16,	'Brienne of Tarth',	'supporting'),
(2,	17,	'Davos Seaworth',	'supporting'),
(2,	18,	'Bran Stark',	'supporting'),
(2,	19,	'Bronn',	'supporting'),
(2,	20,	'Missandei',	'supporting'),
(2,	21,	'Sandor \'The Hound\' Clegane',	'supporting'),
(2,	22,	'Grand Maester Pycelle',	'supporting'),
(2,	23,	'Eddison Tollett',	'supporting'),
(2,	24,	'Podrick Payne',	'supporting'),
(2,	25,	'Melisandre',	'supporting'),
(2,	26,	'Tormund Giantsbane',	'supporting'),
(2,	27,	'Grey Worm',	'supporting'),
(2,	28,	'Tywin Lannister',	'supporting'),
(2,	29,	'Margaery Tyrell',	'supporting'),
(2,	30,	'Joffrey Baratheon',	'supporting'),
(2,	31,	'Catelyn Stark',	'supporting'),
(2,	32,	'Barristan Selmy',	'supporting'),
(13,	33,	'Sonia Mehra',	'supporting'),
(13,	34,	'Rohit Mehra',	'lead'),
(13,	35,	'Nisha',	'lead'),
(13,	36,	'Sanjay Mehra',	'guest'),
(13,	37,	'Chelaram Sukhwani',	'supporting'),
(14,	33,	'Sonia Mehra',	'supporting'),
(14,	34,	'Krishna Mehra',	'lead'),
(14,	34,	'Krrish',	'lead'),
(14,	34,	'Rohit Mehra',	'supporting'),
(14,	38,	'Priya',	'lead'),
(14,	39,	'Dr. Siddhant Arya',	'supporting'),
(15,	34,	'Krishna Mehra',	'lead'),
(15,	34,	'Krrish',	'lead'),
(15,	34,	'Krishna Mehra',	'supporting'),
(15,	39,	'Dr. Siddhant Arya',	'supporting'),
(15,	40,	'Narrator (voice)',	'guest'),
(15,	41,	'Kaya',	'supporting'),
(15,	42,	'Kaal',	'supporting'),
(15,	43,	'Kripal Sharma',	'supporting'),
(15,	44,	'Minister',	'supporting');

DROP TABLE IF EXISTS `company_name`;
CREATE TABLE `company_name` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `company_name` (`company_id`, `company_name`) VALUES
(1,	'Media Rights Capital (MRC)'),
(2,	'Panic Pictures (II)'),
(3,	'Trigger Street Productions'),
(4,	'Home Box Office (HBO)'),
(5,	'Television 360'),
(6,	'Grok! Studio'),
(7,	'Generator Entertainment'),
(8,	'Bighead Littlehead'),
(9,	'Film Kraft'),
(10,	'Films & Casting Temple Pvt. Ltd. Sydney'),
(11,	'Redchillies.VFX');

DROP TABLE IF EXISTS `episode_of`;
CREATE TABLE `episode_of` (
  `ep_id` int(11) NOT NULL,
  `series_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ep_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `episode_of_ibfk_1` FOREIGN KEY (`ep_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  CONSTRAINT `episode_of_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `episode_of` (`ep_id`, `series_id`) VALUES
(3,	2),
(4,	2),
(5,	2),
(6,	2),
(7,	2),
(8,	2),
(9,	2),
(10,	2),
(11,	2),
(12,	2);

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_type` varchar(20) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `genre` (`genre_id`, `genre_type`) VALUES
(1,	'Drama'),
(2,	'Adventure'),
(3,	'Fantasy'),
(4,	'Romance'),
(5,	'Action'),
(6,	'Comedy');

DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `movie_id` int(11) NOT NULL,
  `keyword` varchar(10) NOT NULL,
  PRIMARY KEY (`movie_id`,`keyword`),
  CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `keyword` (`movie_id`, `keyword`) VALUES
(1,	'Politcs'),
(2,	'dragon'),
(2,	'Politics'),
(2,	'queen'),
(2,	'throne'),
(2,	'violence'),
(13,	'alien'),
(13,	'computer'),
(13,	'spaceship'),
(14,	'computer'),
(14,	'mask'),
(14,	'singapore'),
(15,	'handicap'),
(15,	'mutant'),
(15,	'scientist'),
(15,	'superhero');

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `movie1_id` int(11) NOT NULL,
  `movie2_id` int(11) NOT NULL,
  `link_type` varchar(10) NOT NULL,
  PRIMARY KEY (`movie1_id`,`movie2_id`,`link_type`),
  KEY `movie2_id` (`movie2_id`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`movie1_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  CONSTRAINT `link_ibfk_2` FOREIGN KEY (`movie2_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `link` (`movie1_id`, `movie2_id`, `link_type`) VALUES
(14,	13,	'sequel'),
(15,	13,	'sequel'),
(13,	14,	'prequel'),
(15,	14,	'sequel'),
(13,	15,	'prequel'),
(14,	15,	'prequel');

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `year` varchar(4) NOT NULL,
  `season` varchar(2) DEFAULT NULL,
  `episode` varchar(2) DEFAULT NULL,
  `plot` varchar(300) NOT NULL,
  `filepath` varchar(300) DEFAULT NULL,
  `kind` enum('movie','tv','episode') NOT NULL,
  `rating` decimal(3,1) NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `movie` (`movie_id`, `title`, `year`, `season`, `episode`, `plot`, `filepath`, `kind`, `rating`) VALUES
(1,	'House Of Cards',	'2013',	NULL,	NULL,	' A Congressman works with his equally conniving wife to exact revenge on the people who betrayed him. ',	NULL,	'tv',	9.0),
(2,	'Game Of Thrones',	'2011',	NULL,	NULL,	'Nine noble families fight for control over the mythical lands of Westeros, while a forgotten race returns after being dormant for thousands of years.',	NULL,	'tv',	9.5),
(3,	'Winter Is Coming',	'2011',	'1',	'1',	'Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon\'s place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.',	NULL,	'episode',	9.0),
(4,	'The Kingsroad',	'2011',	'1',	'2',	'While Bran recovers from his fall, Ned takes only his daughters to King\'s Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.',	NULL,	'episode',	8.8),
(5,	'Lord Snow',	'2011',	'1',	'3',	'Lord Stark and his daughters arrive at King\'s Landing to discover the intrigues of the king\'s realm.',	NULL,	'episode',	8.7),
(6,	'Cripples, Bastards, and Broken Things',	'2011',	'1',	'4',	'Eddard investigates Jon Arryn\'s murder. Jon befriends Samwell Tarly, a coward who has come to join the Night\'s Watch.',	NULL,	'episode',	8.8),
(7,	'The Wolf and the Lion',	'2011',	'1',	'5',	'Catelyn has captured Tyrion and plans to bring him to her sister, Lysa Arryn, at the Vale, to be tried for his, supposed, crimes against Bran. Robert plans to have Daenerys killed, but Eddard refuses to be a part of it and quits.',	NULL,	'episode',	9.1),
(8,	'A Golden Crown',	'2011',	'1',	'6',	'While recovering from his battle with Jaime, Eddard is forced to run the kingdom while Robert goes hunting. Tyrion demands a trial by combat for his freedom. Viserys is losing his patience with Drogo.',	NULL,	'episode',	9.2),
(9,	'You Win or You Die',	'2011',	'1',	'7',	'Robert has been injured while hunting and is dying. Jon and the others finally take their vows to the Night\'s Watch. A man, sent by Robert, is captured for trying to poison Daenerys. Furious, Drogo vows to attack the Seven Kingdoms.',	NULL,	'episode',	9.3),
(10,	'The Pointy End',	'2011',	'1',	'8',	'Eddard and his men are betrayed and captured by the Lannisters. When word reaches Robb, he plans to go to war to rescue them. The White Walkers attack the Wall. Tyrion returns to his father with some new friends.',	NULL,	'episode',	9.1),
(11,	'Baelor',	'2011',	'1',	'9',	'Robb goes to war against the Lannisters. Jon finds himself struggling on deciding if his place is with Robb or the Night\'s Watch. Drogo has fallen ill from a fresh battle wound. Daenerys is desperate to save him.',	NULL,	'episode',	9.6),
(12,	'Fire and Blood',	'2011',	'1',	'10',	'With Ned dead, Robb vows to get revenge on the Lannisters. Jon must officially decide if his place is with Robb or the Night\'s Watch. Daenerys says her final goodbye to Drogo.',	NULL,	'episode',	9.5),
(13,	'Koi... Mil Gaya',	'2003',	NULL,	NULL,	'A developmentally disabled young man tries to continue the work his father did in communicating with extra-terrestrials from outer space, which leads to something miraculous and wonderful.',	NULL,	'movie',	7.1),
(14,	'Krrish',	'2006',	NULL,	NULL,	'Krrish, a young man with superpowers, falls for Priya. He goes to Singapore to meet her. Circumstances force him to become a superhero and rescue his father Rohit Mehra, who is supposedly dead.',	NULL,	'movie',	6.3),
(15,	'Krrish 3',	'2013',	NULL,	NULL,	'Krrish and his scientist father have to save the world and their own family from an evil man named Kaal and his gang of mutants, led by the ruthless Kaya.',	NULL,	'movie',	5.3);

DROP TABLE IF EXISTS `movie_company`;
CREATE TABLE `movie_company` (
  `movie_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`company_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `movie_company_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  CONSTRAINT `movie_company_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_name` (`company_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `movie_company` (`movie_id`, `company_id`) VALUES
(1,	1),
(1,	2),
(1,	3),
(2,	4),
(2,	5),
(2,	6),
(2,	7),
(2,	8),
(13,	9),
(14,	9),
(15,	9),
(13,	10),
(15,	11);

DROP TABLE IF EXISTS `movie_genre`;
CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE,
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1,	1),
(2,	1),
(13,	1),
(2,	2),
(14,	2),
(15,	2),
(2,	3),
(13,	3),
(14,	3),
(15,	3),
(13,	4),
(14,	5),
(15,	5);

DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `person` (`person_id`, `name`) VALUES
(1,	'Kevin Spacey'),
(2,	'Robin Wright'),
(3,	'Michael Kelly'),
(4,	'Peter Dinklage'),
(5,	'Lena Headey'),
(6,	'Emilia Clarke'),
(7,	'Kit Harington'),
(8,	'Sophie Turner'),
(9,	'Maisie Williams'),
(10,	'Nikolaj Coster-Waldau'),
(11,	'Iain Glen'),
(12,	'Alfie Allen'),
(13,	'John Bradley'),
(14,	'Aidan Gillen'),
(15,	'Conleth Hill'),
(16,	'Gwendoline Christie'),
(17,	'Liam Cunningham'),
(18,	'Isaac Hempstead Wright'),
(19,	'Jerome Flynn'),
(20,	'Nathalie Emmanuel'),
(21,	'Rory McCann'),
(22,	'Julian Glover'),
(23,	'Ben Crompton'),
(24,	'Daniel Portman'),
(25,	'Carice van Houten'),
(26,	'Kristofer Hivju'),
(27,	'Jacob Anderson'),
(28,	'Charles Dance'),
(29,	'Natalie Dormer'),
(30,	'Jack Gleeson'),
(31,	'Michelle Fairley'),
(32,	'Ian McElhinney'),
(33,	'Rekha'),
(34,	'Hrithik Roshan'),
(35,	'Preity Zinta'),
(36,	'Rakesh Roshan'),
(37,	'Johnny Lever'),
(38,	'Priyanka Chopra'),
(39,	'Naseeruddin Shah'),
(40,	'Amitabh Bachchan'),
(41,	'Kangana Ranaut'),
(42,	'Vivek Oberoi'),
(43,	'Rajpal Yadav'),
(44,	'Sachin Khedekar');

DROP TABLE IF EXISTS `person_aka`;
CREATE TABLE `person_aka` (
  `person_id` int(11) NOT NULL,
  `aka_name` varchar(20) NOT NULL,
  PRIMARY KEY (`person_id`,`aka_name`),
  CONSTRAINT `person_aka_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `person_aka` (`person_id`, `aka_name`) VALUES
(1,	'kevi'),
(38,	'Piggy Chops'),
(40,	'Big B');

-- 2017-10-31 17:00:24
