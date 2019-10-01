CREATE TABLE `assignment` (
 `ProjectID` int(11) NOT NULL,
 `EmployeeNumber` int(11) NOT NULL,
 `HoursWorked` decimal(6,2) DEFAULT NULL,
 PRIMARY KEY (`ProjectID`,`EmployeeNumber`),
 KEY `ASSIGN_EMP_FK` (`EmployeeNumber`),
 CONSTRAINT `ASSIGN_EMP_FK` FOREIGN KEY (`EmployeeNumber`) REFERENCES `employee` (`EmployeeNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
 CONSTRAINT `ASSIGN_PROJ_FK` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1
department
CREATE TABLE `department` (
 `DepartmentName` char(35) NOT NULL,
 `BudgetCode` char(30) NOT NULL,
 `OfficeNumber` char(15) NOT NULL,
 `DepartmentPhone` char(12) NOT NULL,
 PRIMARY KEY (`DepartmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
employee
CREATE TABLE `employee` (
 `EmployeeNumber` int(11) NOT NULL AUTO_INCREMENT,
 `FirstName` char(25) NOT NULL,
 `LastName` char(25) NOT NULL,
 `Department` char(35) NOT NULL DEFAULT ' HUMAN RESOURCES',
 `Position` char(35) DEFAULT NULL,
 `Supervisor` int(11) DEFAULT NULL,
 `OfficePhone` char(12) DEFAULT NULL,
 `EmailAddress` varchar(100) NOT NULL,
 PRIMARY KEY (`EmployeeNumber`),
 UNIQUE KEY `EmailAddress` (`EmailAddress`),
 KEY `EMP_DEPART_FK` (`Department`),
 KEY `EMP_SUPER_FK` (`Supervisor`),
 CONSTRAINT `EMP_DEPART_FK` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentName`) ON UPDATE CASCADE,
 CONSTRAINT `EMP_SUPER_FK` FOREIGN KEY (`Supervisor`) REFERENCES `employee` (`EmployeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
project
CREATE TABLE `project` (
 `ProjectID` int(11) NOT NULL AUTO_INCREMENT,
 `ProjectName` char(50) NOT NULL,
 `Department` char(35) NOT NULL,
 `MaxHours` decimal(8,2) NOT NULL DEFAULT 100.00,
 `StartDate` date DEFAULT NULL,
 `EndDate` date DEFAULT NULL,
 PRIMARY KEY (`ProjectID`),
 KEY `PROJ_DEPART_FK` (`Department`),
 CONSTRAINT `PROJ_DEPART_FK` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentName`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1
