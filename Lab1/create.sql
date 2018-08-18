DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

ALTER ROLE gfsimpso SET SEARCH_PATH to Lab1;

CREATE TABLE Airlines(
AirlineID CHAR(3) PRIMARY KEY,
AirlineName VARCHAR(30)
);

CREATE TABLE Airports(
AirportID CHAR(3) PRIMARY KEY,
City VARCHAR(30),
State VARCHAR(30)
);

CREATE TABLE Flights(
AirlineID CHAR(3),
FlightNum INT,
Origin CHAR(3),
Destination CHAR(3),
DepartureTime TIME,
ArrivalTime TIME,
PRIMARY KEY(AirlineID, FlightNum)
);

CREATE TABLE Customers(
CustID INT PRIMARY KEY,
CustName VARCHAR(30),
Status CHAR(1)
);

CREATE TABLE Tickets(
TicketID INT PRIMARY KEY,
CustID INT,
AirlineID CHAR(3),
FlightNum INT,
FlightDate DATE,
SeatNum CHAR(3),
Cost DECIMAL(7,2),
Paid BOOLEAN
);
