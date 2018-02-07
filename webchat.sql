-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema webchat
--

CREATE DATABASE IF NOT EXISTS webchat;
USE webchat;

--
-- Definition of table `chatrooms`
--

DROP TABLE IF EXISTS `chatrooms`;
CREATE TABLE `chatrooms` (
  `RoomName` varchar(20) NOT NULL,
  `RoomDesc` varchar(100) NOT NULL,
  PRIMARY KEY  (`RoomName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatrooms`
--

/*!40000 ALTER TABLE `chatrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatrooms` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `loginid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY  (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`loginid`,`password`,`type`,`name`,`email`) VALUES 
 ('akshat','a','User','Akshat Sharma','akshat@gmail.com'),
 ('anand','a','User','P A Anand','anand@hotmail.com'),
 ('nagendra','n','Admin','Nagendra Dhagarra','admin@webchat.com');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
