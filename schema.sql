
--
-- Database: flight_management
--

-- --------------------------------------------------------

--
-- Table structure for table aeroplanecapacity
--

CREATE TABLE aeroplanecapacity (
  aeroplanecapacityid int NOT NULL,
  totalcapacity int NOT NULL,
  economyclasscapacity int NOT NULL,
  premiumeconomyclasscapacity int NOT NULL,
  businessclasscapacity int NOT NULL,
  firstclasscapacity int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table aeroplanes
--

CREATE TABLE aeroplanes (
  aeroplanesid int NOT NULL,
  aeroplanetype varchar(10) check(aeroplanetype in ('Goods','Passenger')),
  aeroplanecapacityid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlinecrew
--

CREATE TABLE airlinecrew (
  crewid int NOT NULL,
  crewfirstname varchar(50) NOT NULL,
  crewlastname varchar(50) NOT NULL,
  crewgender char(1) NOT NULL,
  crewcountry varchar(20) NOT NULL,
  airlineid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlinecrewphonenumber
--

CREATE TABLE airlinecrewphonenumber (
  airlinecrewphonenumberid int NOT NULL,
  airlinecrewid int NOT NULL,
  phonenumber varchar(20) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlines
--

CREATE TABLE airlines (
  airlineid int NOT NULL,
  airlinename varchar(50) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airlinesaeroplanes
--

CREATE TABLE airlinesaeroplanes (
  airlinesaeroplanesid int NOT NULL,
  airlineid int NOT NULL,
  aeroplaneid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table airports
--

CREATE TABLE airports (
  airportid int NOT NULL,
  airportname varchar(60) NOT NULL,
  airportcity varchar(50) NOT NULL,
  airportcountry varchar(50) NOT NULL,
  totalterminals int NOT NULL,
  totalrunways int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table flightcrew
--

CREATE TABLE flightcrew (
  flightcrewid int NOT NULL,
  flightid int NOT NULL,
  pilotid int NOT NULL,
  copilotid int NOT NULL,
  numberofairhostesses int NOT NULL,
  headairhostessid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table flightcrewhostess
--

CREATE TABLE flightcrewhostess (
  flightcrewhostessid int NOT NULL,
  flightcrewid int NOT NULL,
  airelinecrewid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table flightsgoing
--

CREATE TABLE flightsgoing (
  flightsgoingid int NOT NULL,
  airlinesaeroplanesid int NOT NULL,
  departureairportid int NOT NULL,
  arrivalairportid int NOT NULL,
  flighttype varchar(20) check(flighttype in ('Domestic','International')) NOT NULL,
  arrivaldatetime timestamp NOT NULL,
  departuredatetime timestamp NOT NULL,
  destinationdistance int NOT NULL,
  arrivalterminalid int NOT NULL,
  departureterminalid int NOT NULL,
  arrivalrunwayid int NOT NULL,
  departurerunwayid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table passengers
--

CREATE TABLE passengers (
  passengersid int NOT NULL,
  passengerfirstname varchar(50) NOT NULL,
  passengerlastname varchar(50) NOT NULL,
  passengergender char(1) NOT NULL,
  passengerage int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table passengersgoing
--

CREATE TABLE passengersgoing (
  passengersgoingid int NOT NULL,
  passengerid int NOT NULL,
  flightid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table passengersphonenumber
--

CREATE TABLE passengersphonenumber (
  passengersphonenumberid int NOT NULL,
  passengerid int NOT NULL,
  phonenumber varchar(20) NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table runways
--

CREATE TABLE runways (
  runwaysid int NOT NULL,
  runwayno int NOT NULL,
  runwayname varchar(20) NOT NULL,
  airportid int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table terminals
--

CREATE TABLE terminals (
  terminalsid int NOT NULL,
  terminalno int NOT NULL,
  terminalname varchar(20) NOT NULL,
  airportid int NOT NULL
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table aeroplanecapacity
--
ALTER TABLE aeroplanecapacity
  ADD PRIMARY KEY (aeroplanecapacityid);

--
-- Indexes for table aeroplanes
--
ALTER TABLE aeroplanes
  ADD PRIMARY KEY (aeroplanesid);
CREATE INDEX aeroplanes_ibfk_2
ON aeroplanes(aeroplanecapacityid);


--
-- Indexes for table airlinecrew
--
ALTER TABLE airlinecrew
  ADD PRIMARY KEY (crewid);
CREATE INDEX airlinecrew_airlineid_idx
  ON airlinecrew(airlineid);


--
-- Indexes for table airlinecrewphonenumber
--
ALTER TABLE airlinecrewphonenumber
  ADD PRIMARY KEY (airlinecrewphonenumberid);
CREATE INDEX airlinecrewphonenumber_airlinecrewid_idx
  ON airlinecrewphonenumber(airlinecrewid);


--
-- Indexes for table airlines
--
ALTER TABLE airlines
  ADD PRIMARY KEY (airlineid);

--
-- Indexes for table airlinesaeroplanes
--
ALTER TABLE airlinesaeroplanes
  ADD PRIMARY KEY (airlinesaeroplanesid);
CREATE INDEX airlinesaeroplanes_airlineid_idx
  ON airlinesaeroplanes(airlineid);
CREATE INDEX airlinesaeroplanes_aeroplaneid_idx
  ON airlinesaeroplanes(aeroplaneid);


--
-- Indexes for table airports
--
ALTER TABLE airports
  ADD PRIMARY KEY (airportid);

--
-- Indexes for table flightcrew
--
ALTER TABLE flightcrew
  ADD PRIMARY KEY (flightcrewid);
CREATE INDEX flightcrew_pilotid_idx
  ON flightcrew(pilotid);
CREATE INDEX flightcrew_copilotid_idx
  ON flightcrew(copilotid);
CREATE INDEX flightcrew_headairhostessid_idx
  ON flightcrew(headairhostessid);
CREATE INDEX flightcrew_flightid_idx
  ON flightcrew(flightid);


--
-- Indexes for table flightcrewhostess
--
ALTER TABLE flightcrewhostess
  ADD PRIMARY KEY (flightcrewhostessid);
CREATE INDEX flightcrewhostess_flightcrewid_idx
  ON flightcrewhostess(flightcrewid);
CREATE INDEX flightcrewhostess_airelinecrewid_idx
  ON flightcrewhostess(airelinecrewid);


--
-- Indexes for table flightsgoing
--
ALTER TABLE flightsgoing
  ADD PRIMARY KEY (flightsgoingid);
CREATE INDEX flightsgoing_arrivalairportid_idx 
  ON flightsgoing(arrivalairportid);
CREATE INDEX flightsgoing_departureairportid_idx 
  ON flightsgoing(departureairportid);
CREATE INDEX flightsgoing_arrivalterminalid_idx 
  ON flightsgoing(arrivalterminalid);
CREATE INDEX flightsgoing_departureterminalid_idx 
  ON flightsgoing(departureterminalid);
CREATE INDEX flightsgoing_arrivalrunwayid_idx 
  ON flightsgoing(arrivalrunwayid);
CREATE INDEX flightsgoing_departurerunwayid_idx 
  ON flightsgoing(departurerunwayid);
CREATE INDEX flightsgoing_airlinesaeroplanesid_idx 
  ON flightsgoing(airlinesaeroplanesid);


--
-- Indexes for table passengers
--
ALTER TABLE passengers
  ADD PRIMARY KEY (passengersid);

--
-- Indexes for table passengersgoing
--
ALTER TABLE passengersgoing
  ADD PRIMARY KEY (passengersgoingid);
CREATE INDEX passengersgoing_passengerid_idx 
  ON passengersgoing(passengerid);
CREATE INDEX passengersgoing_flightid_idx 
  ON passengersgoing(flightid);


--
-- Indexes for table passengersphonenumber
--
ALTER TABLE passengersphonenumber
  ADD PRIMARY KEY (passengersphonenumberid);
CREATE INDEX passengersphonenumber_passengerid_idx 
  ON passengersphonenumber(passengerid);


--
-- Indexes for table runways
--
ALTER TABLE runways
  ADD PRIMARY KEY (runwaysid);
CREATE INDEX runways_airportid_idx 
  ON runways(airportid);


--
-- Indexes for table terminals
--
ALTER TABLE terminals
  ADD PRIMARY KEY (terminalsid);
CREATE INDEX terminals_airportid_idx 
  ON terminals(airportid);


--
-- for dumped tables
--

--
-- for table aeroplanecapacity
--
ALTER TABLE aeroplanecapacity
  MODIFY aeroplanecapacityid int NOT NULL;

--
-- for table aeroplanes
--
ALTER TABLE aeroplanes
  MODIFY aeroplanesid int NOT NULL;

--
-- for table airlinecrew
--
ALTER TABLE airlinecrew
  MODIFY crewid int NOT NULL;

--
-- for table airlinecrewphonenumber
--
ALTER TABLE airlinecrewphonenumber
  MODIFY airlinecrewphonenumberid int NOT NULL;

--
-- for table airlines
--
ALTER TABLE airlines
  MODIFY airlineid int NOT NULL;

--
-- for table airlinesaeroplanes
--
ALTER TABLE airlinesaeroplanes
  MODIFY airlinesaeroplanesid int NOT NULL;

--
-- for table flightcrew
--
ALTER TABLE flightcrew
  MODIFY flightcrewid int NOT NULL;

--
-- for table flightcrewhostess
--
ALTER TABLE flightcrewhostess
  MODIFY flightcrewhostessid int NOT NULL;

--
-- for table flightsgoing
--
ALTER TABLE flightsgoing
  MODIFY flightsgoingid int NOT NULL;

--
-- for table passengers
--
ALTER TABLE passengers
  MODIFY passengersid int NOT NULL;

--
-- for table passengersgoing
--
ALTER TABLE passengersgoing
  MODIFY passengersgoingid int NOT NULL;

--
-- for table passengersphonenumber
--
ALTER TABLE passengersphonenumber
  MODIFY passengersphonenumberid int NOT NULL;

--
-- for table runways
--
ALTER TABLE runways
  MODIFY runwaysid int NOT NULL;

--
-- for table terminals
--
ALTER TABLE terminals
  MODIFY terminalsid int NOT NULL;

--
-- Constraints for dumped tables
--

--
-- Constraints for table aeroplanes
--
ALTER TABLE aeroplanes
  ADD CONSTRAINT aeroplanes_ibfk_2 FOREIGN KEY (aeroplanecapacityid) REFERENCES aeroplanecapacity (aeroplanecapacityid);

--
-- Constraints for table airlinecrew
--
ALTER TABLE airlinecrew
  ADD CONSTRAINT airlinecrew_ibfk_1 FOREIGN KEY (airlineid) REFERENCES airlines (airlineid);

--
-- Constraints for table airlinecrewphonenumber
--
ALTER TABLE airlinecrewphonenumber
  ADD CONSTRAINT airlinecrewphonenumber_ibfk_1 FOREIGN KEY (airlinecrewid) REFERENCES airlinecrew (crewid);

--
-- Constraints for table airlinesaeroplanes
--
ALTER TABLE airlinesaeroplanes
  ADD CONSTRAINT airlinesaeroplanes_ibfk_1 FOREIGN KEY (airlineid) REFERENCES airlines (airlineid);
ALTER TABLE airlinesaeroplanes
  ADD CONSTRAINT airlinesaeroplanes_ibfk_2 FOREIGN KEY (aeroplaneid) REFERENCES aeroplanes (aeroplanesid);

--
-- Constraints for table flightcrew
--
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_1 FOREIGN KEY (pilotid) REFERENCES airlinecrew (crewid);
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_2 FOREIGN KEY (copilotid) REFERENCES airlinecrew (crewid);
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_3 FOREIGN KEY (headairhostessid) REFERENCES airlinecrew (crewid);
ALTER TABLE flightcrew
  ADD CONSTRAINT flightcrew_ibfk_4 FOREIGN KEY (flightid) REFERENCES flightsgoing (flightsgoingid);


--
-- Constraints for table flightcrewhostess
--
ALTER TABLE flightcrewhostess
  ADD CONSTRAINT flightcrewhostess_ibfk_1 FOREIGN KEY (flightcrewid) REFERENCES flightcrew (flightcrewid);

ALTER TABLE flightcrewhostess
  ADD CONSTRAINT flightcrewhostess_ibfk_2 FOREIGN KEY (airelinecrewid) REFERENCES airlinecrew (crewid);

--
-- Constraints for table flightsgoing
--
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_2 FOREIGN KEY (arrivalairportid) REFERENCES airports (airportid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_3 FOREIGN KEY (departureairportid) REFERENCES airports (airportid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_4 FOREIGN KEY (arrivalterminalid) REFERENCES terminals (terminalsid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_5 FOREIGN KEY (departureterminalid) REFERENCES terminals (terminalsid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_6 FOREIGN KEY (arrivalrunwayid) REFERENCES runways (runwaysid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_7 FOREIGN KEY (departurerunwayid) REFERENCES runways (runwaysid);
ALTER TABLE flightsgoing
  ADD CONSTRAINT flightsgoing_ibfk_8 FOREIGN KEY (airlinesaeroplanesid) REFERENCES airlinesaeroplanes (airlinesaeroplanesid);

--
-- Constraints for table passengersgoing
--
ALTER TABLE passengersgoing
  ADD CONSTRAINT passengersgoing_ibfk_1 FOREIGN KEY (passengerid) REFERENCES passengers (passengersid);
ALTER TABLE passengersgoing
  ADD CONSTRAINT passengersgoing_ibfk_2 FOREIGN KEY (flightid) REFERENCES flightsgoing (flightsgoingid);
--
-- Constraints for table passengersphonenumber
--
ALTER TABLE passengersphonenumber
  ADD CONSTRAINT passengersphonenumber_ibfk_1 FOREIGN KEY (passengerid) REFERENCES passengers (passengersid);

--
-- Constraints for table runways
--
ALTER TABLE runways
  ADD CONSTRAINT runways_ibfk_1 FOREIGN KEY (airportid) REFERENCES airports (airportid);

--
-- Constraints for table terminals
--
ALTER TABLE terminals
  ADD CONSTRAINT terminals_ibfk_1 FOREIGN KEY (airportid) REFERENCES airports (airportid);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
