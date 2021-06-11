-- MySQL Script generated by MySQL Workbench
-- Sun Feb 9 13:31:35 2020 -- Model: New Model Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mathLearningDB --
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mathLearningDB
-- -----------------------------------------------------
 CREATE SCHEMA IF NOT EXISTS `mathLearningDB` DEFAULT CHARACTER SET utf8 ;
 USE `mathLearningDB` ;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`ACCOUNT`
-- -----------------------------------------------------
-- Old Account Table
/*CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`ACCOUNT` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Phonenumber` VARCHAR(45) NULL,
  `Username` VARCHAR(45) NULL,
  `PasswordHash` VARCHAR(45) NULL,
  `AccountType` VARCHAR(45) NULL,
  `CreatedTimestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ConsentBool` TINYINT(4) NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;*/

CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`ACCOUNT` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phonenumber` varchar(10) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `PasswordHash` varchar(60) DEFAULT NULL,
  `AccountType` varchar(45) DEFAULT NULL,
  `CreatedTimestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ConsentBool` tinyint(4) DEFAULT NULL,
  `Subscription` varchar(2000) DEFAULT NULL,
  `UID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UID` (`UID`),
  CONSTRAINT `ACCOUNT_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `UNIVERSITY` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`UNIVERSITY`
-- -----------------------------------------------------
CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`UNIVERSITY` (
  `UID` INT NOT NULL,
  `UniversityName` VARCHAR(45) NULL,
  `TimeZone` VARCHAR(45) NULL,
  PRIMARY KEY (`UID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`CLASS`
-- -----------------------------------------------------
-- Old Class Table
/*CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`CLASS` (
  `ClassID` INT NOT NULL,
  `ClassName` VARCHAR(45) NULL,
  `ClassCode` VARCHAR(45) NOT NULL,
  `StartTime` FLOAT NULL,
  `EndTime` FLOAT NULL,
  `UniversityID` INT NULL,
  PRIMARY KEY (`ClassID`, `ClassCode`),
  -- INDEX `UID_idx` (`UniversityID` ASC) VISIBLE,
  CONSTRAINT `CLASS_UID`
    FOREIGN KEY (`UniversityID`)
    REFERENCES `mathLearningDB`.`UNIVERSITY` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;*/

CREATE TABLE IF NOT EXISTS `mathLearningDB`.`CLASS` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(45) DEFAULT NULL,
  `ClassCode` varchar(45) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `Days` varchar(20) DEFAULT NULL,
  `UniversityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ClassID`,`ClassCode`),
  KEY `CLASS_UID` (`UniversityID`),
  CONSTRAINT `CLASS_UID` FOREIGN KEY (`UniversityID`) REFERENCES `UNIVERSITY` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`SURVEY_QUESTION`
-- -----------------------------------------------------
CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`SURVEY_QUESTION` (
  `ClassID` INT NOT NULL,
  `SurveyQID` INT NOT NULL,
  `SurveyQuestion` VARCHAR(120) NULL,
  `Range` FLOAT NULL,
  PRIMARY KEY (`ClassID`, `SurveyQID`),
  -- INDEX `SurveyQID_idx` (`SurveyQID` ASC) VISIBLE,
  CONSTRAINT `SURVEYQ_CID`
    FOREIGN KEY (`ClassID`)
    REFERENCES `mathLearningDB`.`CLASS` (`ClassID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`CLASS_QUESTION`
-- -----------------------------------------------------
CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`CLASS_QUESTION` (
  `ClassID` INT NOT NULL,
  `ClassQID` INT NOT NULL,
  `ClassQuestion` VARCHAR(120) NULL,
  `QuestionAnswer` VARCHAR(120) NULL,
  PRIMARY KEY (`ClassID`, `ClassQID`),
  CONSTRAINT `CLASSQ_CID`
    FOREIGN KEY (`ClassID`)
    REFERENCES `mathLearningDB`.`CLASS` (`ClassID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`SURVEY_RESPONSE`
-- -----------------------------------------------------
-- Old Survey_Response Table
/*CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`SURVEY_RESPONSE` (
  `RecordedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ResponseId` INT NOT NULL,
  `RecipientLastName` VARCHAR(45) NOT NULL,
  `RecipientFirstName` VARCHAR(45) NOT NULL,
  `RecipientEmail` VARCHAR(255) NOT NULL,
  `Q1_1` INT NULL,
  `Q1_2` INT NULL,
  `Q1_3` INT NULL,
  `Q1_4` INT NULL,
  `Q1_5` INT NULL,
  `ClassID` INT NOT NULL,
  `StartTime` VARCHAR(45) NULL,
  `EndTime` VARCHAR(45) NULL,
  `ObsID` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ResponseId`, `RecordedDate`, `ClassID`))
ENGINE = InnoDB;*/

CREATE TABLE `SURVEY_RESPONSE` (
  `RecordedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `ResponseId` varchar(12) DEFAULT '',
  `Q1_1` int(11) DEFAULT NULL,
  `Q1_2` int(11) DEFAULT NULL,
  `Q1_3` int(11) DEFAULT NULL,
  `Q1_4` int(11) DEFAULT NULL,
  `Q1_5` int(11) DEFAULT NULL,
  `ClassID` int(11) NOT NULL,
  `StartTime` varchar(45) DEFAULT NULL,
  `EndTime` varchar(45) DEFAULT NULL,
  `ObsID` varchar(11) NOT NULL,
  PRIMARY KEY (`RecordedDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`CLASS_RESPONSE`
-- -----------------------------------------------------
CREATE  TABLE IF
NOT EXISTS `mathLearningDB`.`CLASS_RESPONSE` (
  `UserID` INT NOT NULL,
  `Timestamp` FLOAT NOT NULL,
  `ClassID` INT NOT NULL,
  `ClassQID` INT NOT NULL,
  `ClassAnswer` VARCHAR(120) NULL,
  PRIMARY KEY (`UserID`, `Timestamp`, `ClassQID`, `ClassID`),
  -- INDEX `CID_idx` (`ClassID` ASC) VISIBLE,
  -- INDEX `CQID_idx` (`ClassQID` ASC) VISIBLE,
  CONSTRAINT `CLASSR_CID`
    FOREIGN KEY (`ClassID`)
    REFERENCES `mathLearningDB`.`CLASS` (`ClassID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
--  CONSTRAINT `CLASSR_CQID`
--   FOREIGN KEY (`ClassQID`)
--   REFERENCES `mathLearningDB`.`CLASS_QUESTION` (`ClassQID`)
--   ON DELETE NO ACTION
--   ON UPDATE NO ACTION,
  CONSTRAINT `CLASSR_UID`
    FOREIGN KEY (`UserID`)
    REFERENCES `mathLearningDB`.`ACCOUNT` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`IS_ENROLLED_IN`
-- -----------------------------------------------------
-- Old IS_ENROLLED_IN Table
/*CREATE TABLE IF
NOT EXISTS `mathLearningDB`.`IS_ENROLLED_IN` (
  `StudentID` INT NOT NULL,
  `ClassID` INT NOT NULL,
  PRIMARY KEY (`StudentID`, `ClassID`),
  -- INDEX `CID_idx` (`ClassID` ASC) VISIBLE,
  CONSTRAINT `IEI_SID`
    FOREIGN KEY (`StudentID`)
    REFERENCES `mathLearningDB`.`ACCOUNT` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IEI_CID`
    FOREIGN KEY (`ClassID`)
    REFERENCES `mathLearningDB`.`CLASS` (`ClassID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;*/

CREATE TABLE `IS_ENROLLED_IN` (
  `StudentID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `Phonenumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`ClassID`),
  KEY `IEI_CID` (`ClassID`),
  CONSTRAINT `IEI_CID` FOREIGN KEY (`ClassID`) REFERENCES `CLASS` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IEI_SID` FOREIGN KEY (`StudentID`) REFERENCES `ACCOUNT` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `mathLearningDB`.`IS_ADMINISTERED_BY`
-- -----------------------------------------------------
-- Old IS_ADMINISTERED_BY Table
/*CREATE TABLE IF
 NOT EXISTS `mathLearningDB`.`IS_ADMINISTERED_BY` (
  `ClassID` INT NOT NULL,
  `AdminID` INT NOT NULL,
  PRIMARY KEY (`ClassID`, `AdminID`),
  -- INDEX `AID_idx` (`AdminID` ASC) VISIBLE,
  CONSTRAINT `IAB_CID`
    FOREIGN KEY (`ClassID`)
    REFERENCES `mathLearningDB`.`CLASS` (`ClassID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IAB_AID`
    FOREIGN KEY (`AdminID`)
    REFERENCES `mathLearningDB`.`ACCOUNT` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;*/

CREATE TABLE IF NOT EXISTS `IS_ADMINISTERED_BY` (
  `ClassID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL,
  PRIMARY KEY (`ClassID`,`AdminID`),
  KEY `IAB_AID` (`AdminID`),
  CONSTRAINT `IAB_AID` FOREIGN KEY (`AdminID`) REFERENCES `ACCOUNT` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IAB_CID` FOREIGN KEY (`ClassID`) REFERENCES `CLASS` (`ClassID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
