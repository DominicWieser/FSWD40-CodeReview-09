-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Jun 2018 um 16:54
-- Server-Version: 10.1.32-MariaDB
-- PHP-Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_dominic_wieser_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `agency`
--

CREATE TABLE `agency` (
  `agency_ID` int(11) NOT NULL,
  `fk_employee_ID` int(11) DEFAULT NULL,
  `agencyName` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `agency`
--

INSERT INTO `agency` (`agency_ID`, `fk_employee_ID`, `agencyName`, `address`, `zipCode`, `town`, `email`, `telephone`) VALUES
(1, 1, 'DW-carrental', 'Leinweg 22', 1220, 'Wien', 'service@DW-carrental.at', 1555666);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `available`
--

CREATE TABLE `available` (
  `available_ID` int(11) NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `availableDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `available`
--

INSERT INTO `available` (`available_ID`, `available`, `availableDate`) VALUES
(1, 1, '2018-06-01'),
(2, 0, '2018-07-01'),
(3, 0, '2018-08-01'),
(4, 0, '2018-09-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_ID` int(11) NOT NULL,
  `fk_register_ID` int(11) DEFAULT NULL,
  `fk_bookingStatus_ID` int(11) DEFAULT NULL,
  `fk_agency_ID` int(11) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL,
  `fk_invoice_ID` int(11) DEFAULT NULL,
  `bookingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`booking_ID`, `fk_register_ID`, `fk_bookingStatus_ID`, `fk_agency_ID`, `fk_customer_ID`, `fk_invoice_ID`, `bookingDate`) VALUES
(1, 2, 1, 1, 1, 1, '2018-06-01'),
(2, 1, 1, 1, 2, 2, '2018-05-03'),
(3, 3, 2, 1, 2, 2, '2018-05-03');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bookingstatus`
--

CREATE TABLE `bookingstatus` (
  `bookingStatus_ID` int(11) NOT NULL,
  `booked` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `bookingstatus`
--

INSERT INTO `bookingstatus` (`bookingStatus_ID`, `booked`) VALUES
(1, 1),
(2, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `fk_gender_ID` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_ID`, `fk_gender_ID`, `firstName`, `lastName`, `address`, `zipCode`, `town`, `email`, `telephone`, `license`) VALUES
(1, 1, 'Bernhard', 'Hahn', 'Fickeystraße 32', 1110, 'Wien', 'b.Hahn@gmail.com', 125262, 'A17587189BDAF'),
(2, 2, 'Amber', 'Rain', 'Hausfeldstraße 144', 1220, 'Wien', 'amberangel@gmail.com', 12536478, 'A25627BAJ3535G'),
(3, 2, 'Susanne', 'Lindner', 'Billrothstraße 88', 1190, 'Wien', 'susithemusi@gmail.com', 164397937, 'A8758BAJG25KGG');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL,
  `fk_salary_ID` int(11) DEFAULT NULL,
  `employeeName` varchar(100) DEFAULT NULL,
  `hireDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_ID`, `fk_salary_ID`, `employeeName`, `hireDate`) VALUES
(1, 1, 'Marie Aniston', '2017-01-03'),
(2, 2, 'Dominic Wieser', '2016-01-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gender`
--

CREATE TABLE `gender` (
  `gender_ID` int(11) NOT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `gender`
--

INSERT INTO `gender` (`gender_ID`, `gender`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_ID` int(11) NOT NULL,
  `invoiceStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_ID`, `invoiceStatus`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturer_ID` int(11) NOT NULL,
  `manufacturerName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_ID`, `manufacturerName`) VALUES
(1, 'BMW'),
(2, 'Audi'),
(3, 'Seat'),
(4, 'Mercedes'),
(5, 'Honda');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `model`
--

CREATE TABLE `model` (
  `model_ID` int(11) NOT NULL,
  `fk_manufacturer_ID` int(11) DEFAULT NULL,
  `modelName` varchar(100) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `model`
--

INSERT INTO `model` (`model_ID`, `fk_manufacturer_ID`, `modelName`, `type`) VALUES
(1, 5, 'Civic', 'Compact Car'),
(2, 2, 'R8', 'Sports Car'),
(3, 1, 'i8', 'Sports Car'),
(4, 4, 'GLE', 'SUV'),
(5, 3, 'Ibiza', 'Mini');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_ID` int(11) NOT NULL,
  `fk_invoice_ID` int(11) DEFAULT NULL,
  `fk_paymentType_ID` int(11) DEFAULT NULL,
  `paymentAmount` int(11) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_ID`, `fk_invoice_ID`, `fk_paymentType_ID`, `paymentAmount`, `paymentDate`) VALUES
(1, 1, 1, 17000, '2018-08-01'),
(2, 2, 2, 8000, '2018-07-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `paymenttype`
--

CREATE TABLE `paymenttype` (
  `paymentType_ID` int(11) NOT NULL,
  `paymentTypeName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `paymenttype`
--

INSERT INTO `paymenttype` (`paymentType_ID`, `paymentTypeName`) VALUES
(1, 'Cash'),
(2, 'Card');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `salary`
--

CREATE TABLE `salary` (
  `salary_ID` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `salary`
--

INSERT INTO `salary` (`salary_ID`, `amount`) VALUES
(1, 1900),
(2, 2500);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicles`
--

CREATE TABLE `vehicles` (
  `register_ID` int(11) NOT NULL,
  `fk_warehouse_ID` int(11) DEFAULT NULL,
  `fk_available_ID` int(11) DEFAULT NULL,
  `fk_agency_ID` int(11) DEFAULT NULL,
  `fk_model_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `vehicles`
--

INSERT INTO `vehicles` (`register_ID`, `fk_warehouse_ID`, `fk_available_ID`, `fk_agency_ID`, `fk_model_ID`) VALUES
(1, 4, 1, 1, 3),
(2, 4, 2, 1, 2),
(3, 3, 2, 1, 1),
(4, 2, 2, 1, 4),
(5, 1, 4, 1, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_ID` int(11) NOT NULL,
  `warehouseName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `warehouse`
--

INSERT INTO `warehouse` (`warehouse_ID`, `warehouseName`) VALUES
(1, 'Storage A'),
(2, 'Storage B'),
(3, 'Storage C'),
(4, 'Storage D');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_ID`),
  ADD KEY `fk_employee_ID` (`fk_employee_ID`);

--
-- Indizes für die Tabelle `available`
--
ALTER TABLE `available`
  ADD PRIMARY KEY (`available_ID`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_ID`),
  ADD KEY `fk_register_ID` (`fk_register_ID`),
  ADD KEY `fk_bookingStatus_ID` (`fk_bookingStatus_ID`),
  ADD KEY `fk_agency_ID` (`fk_agency_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_invoice_ID` (`fk_invoice_ID`);

--
-- Indizes für die Tabelle `bookingstatus`
--
ALTER TABLE `bookingstatus`
  ADD PRIMARY KEY (`bookingStatus_ID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`),
  ADD KEY `fk_gender_ID` (`fk_gender_ID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`),
  ADD KEY `fk_salary_ID` (`fk_salary_ID`);

--
-- Indizes für die Tabelle `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_ID`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_ID`);

--
-- Indizes für die Tabelle `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_ID`);

--
-- Indizes für die Tabelle `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_ID`),
  ADD KEY `fk_manufacturer_ID` (`fk_manufacturer_ID`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_ID`),
  ADD KEY `fk_invoice_ID` (`fk_invoice_ID`),
  ADD KEY `fk_paymentType_ID` (`fk_paymentType_ID`);

--
-- Indizes für die Tabelle `paymenttype`
--
ALTER TABLE `paymenttype`
  ADD PRIMARY KEY (`paymentType_ID`);

--
-- Indizes für die Tabelle `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_ID`);

--
-- Indizes für die Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`register_ID`),
  ADD KEY `fk_warehouse_ID` (`fk_warehouse_ID`),
  ADD KEY `fk_available_ID` (`fk_available_ID`),
  ADD KEY `fk_agency_ID` (`fk_agency_ID`),
  ADD KEY `fk_model_ID` (`fk_model_ID`);

--
-- Indizes für die Tabelle `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_employee_ID`) REFERENCES `employee` (`employee_ID`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_register_ID`) REFERENCES `vehicles` (`register_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_bookingStatus_ID`) REFERENCES `bookingstatus` (`bookingStatus_ID`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`fk_agency_ID`) REFERENCES `agency` (`agency_ID`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`fk_invoice_ID`) REFERENCES `invoice` (`invoice_ID`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_gender_ID`) REFERENCES `gender` (`gender_ID`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_salary_ID`) REFERENCES `salary` (`salary_ID`);

--
-- Constraints der Tabelle `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`fk_manufacturer_ID`) REFERENCES `manufacturer` (`manufacturer_ID`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_invoice_ID`) REFERENCES `invoice` (`invoice_ID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_paymentType_ID`) REFERENCES `paymenttype` (`paymentType_ID`);

--
-- Constraints der Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`fk_warehouse_ID`) REFERENCES `warehouse` (`warehouse_ID`),
  ADD CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`fk_available_ID`) REFERENCES `available` (`available_ID`),
  ADD CONSTRAINT `vehicles_ibfk_3` FOREIGN KEY (`fk_agency_ID`) REFERENCES `agency` (`agency_ID`),
  ADD CONSTRAINT `vehicles_ibfk_4` FOREIGN KEY (`fk_model_ID`) REFERENCES `model` (`model_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
