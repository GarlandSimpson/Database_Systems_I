\i unittests.sql
\i create_lab3.sql
\i lab3_data_loading.sql


CREATE VIEW CA_NY_Passengers(CustID, AirlineID, FlightNum) AS
SELECT t.CustID, t.AirlineID, t.FlightNum
FROM FLIGHTS f, AIRPORTS a1, AIRPORTS a2, TICKETS t
WHERE f.airlineid = t.airlineid AND 
      f.flightnum = t.flightnum AND
      f.origin = a1.airportid AND
      f.destination = a2.airportid AND
      a1.state = 'CA' AND a2.state='NY';


SELECT cn.custid, cu.custname, COUNT(cn.flightnum) AS CA_NY_Total
FROM CA_NY_Passengers cn, CUSTOMERS cu
WHERE cn.custid = cu.custid
GROUP BY(cn.custid, cu.custname);

/*
 custid |    custname    | ca_ny_total 
--------+----------------+-------------
    114 | Jim Halpert    |           1
    131 | Harvey Spectre |           1
    137 | Drew Powell    |           2
    139 | Sadik Hadzovic |           2
*/

DELETE FROM TICKETS WHERE ticketid = 202 OR ticketid = 204;


SELECT cn.custid, cu.custname, COUNT(cn.flightnum) AS CA_NY_Total
FROM CA_NY_Passengers cn, CUSTOMERS cu
WHERE cn.custid = cu.custid
GROUP BY(cn.custid, cu.custname);

/*
 custid |    custname    | ca_ny_total 
--------+----------------+-------------
    114 | Jim Halpert    |           1
    137 | Drew Powell    |           1
    139 | Sadik Hadzovic |           2
*/

DROP VIEW CA_NY_Passengers;
