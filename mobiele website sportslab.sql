/*
Created: 31/07/2018
Modified: 2/08/2018
Model: mobiele website sportslab
Database: MySQL 5.7
*/


-- Create tables section -------------------------------------------------

-- Table sporter

CREATE TABLE `sporter`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `email` Char(20) NOT NULL,
  `wachtwoord` Char(20) NOT NULL,
  `naam` Char(20) NOT NULL,
  `voornaam` Char(20) NOT NULL,
  `gsm` Int,
  `adres` Char(20),
  `extra info` Text,
  PRIMARY KEY (`id`),
  
  UNIQUE `id` (`id`)
)
;

ALTER TABLE `sporter` ADD UNIQUE  (`email`)
;

-- Table lesgever

CREATE TABLE `lesgever`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `email` Varchar(100) NOT NULL,
  `wachtwoord` Char(20) NOT NULL,
  `naam` Char(20) NOT NULL,
  `voornaam` Char(20) NOT NULL,
  `gsm` Int,
  `adres` Text,
  PRIMARY KEY (`id`),
 
  UNIQUE `id` (`id`)
)
;

ALTER TABLE `lesgever` ADD UNIQUE  (`email`)
;

-- Table les

CREATE TABLE `les`
(
  `naam` Char(20) NOT NULL,
  `tijdstip` Time NOT NULL,
  `duur` Double NOT NULL,
  `max_inschrijvingen` Int NOT NULL,
  `lesgever` Int,
  `id` Int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  
  UNIQUE `id` (`id`)
)
;

CREATE INDEX `IX_Relationship10` ON `les` (`lesgever`)
;

-- Table inschrijving

CREATE TABLE `inschrijving`
(
  `sporter` Int NOT NULL,
  `les` Int NOT NULL,
  `timestamp` Datetime NOT NULL
)
;

ALTER TABLE `inschrijving` ADD PRIMARY KEY (`sporter`,`les`)
;

-- Table reserve

CREATE TABLE `reserve`
(
  `sporter` Int NOT NULL,
  `les` Int NOT NULL,
  `timestamp` Datetime NOT NULL
)
;

ALTER TABLE `reserve` ADD PRIMARY KEY (`sporter`,`les`)
;

-- Table beurtenkaart

CREATE TABLE `beurtenkaart`
(
  `id` Int NOT NULL,
  `max_beurten` Int NOT NULL,
  `aantal_beurten` Int,
  `sporter` Int,
  `vervaldatum` Date NOT NULL,
  `status` Int NOT NULL,
  `prijs` Double NOT NULL,
  PRIMARY KEY (`id`),
  
  UNIQUE `id` (`id`)
)
;

CREATE INDEX `IX_Relationship12` ON `beurtenkaart` (`sporter`)
;

-- Table abonnement

CREATE TABLE `abonnement`
(
  `id` Int NOT NULL,
  `duur` Time NOT NULL,
  `vervaldatum` Date NOT NULL,
  `status` Int NOT NULL,
  `sporter` Int NOT NULL,
  `prijs_per_maand` Double NOT NULL,
  PRIMARY KEY (`id`),
  
  UNIQUE `id` (`id`)
)
;

CREATE INDEX `IX_Relationship11` ON `abonnement` (`sporter`)
;

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE `inschrijving` ADD CONSTRAINT `ingeschreven voor` FOREIGN KEY (`sporter`) REFERENCES `sporter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `inschrijving` ADD CONSTRAINT `inschrijvingen` FOREIGN KEY (`les`) REFERENCES `les` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `reserve` ADD CONSTRAINT `wil_inschrijven` FOREIGN KEY (`sporter`) REFERENCES `sporter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `reserve` ADD CONSTRAINT `reserve_lijst` FOREIGN KEY (`les`) REFERENCES `les` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `les` ADD CONSTRAINT `geeft` FOREIGN KEY (`lesgever`) REFERENCES `lesgever` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `abonnement` ADD CONSTRAINT `heeft abonnement` FOREIGN KEY (`sporter`) REFERENCES `sporter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


ALTER TABLE `beurtenkaart` ADD CONSTRAINT `heeft beurtenkaart` FOREIGN KEY (`sporter`) REFERENCES `sporter` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;


