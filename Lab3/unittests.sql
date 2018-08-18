\i general.sql

-- begin foreign key constraint tests

INSERT INTO TICKETS 
VALUES(230, 666, 'VRD', 220, 'L30', 999.99, TRUE);

INSERT INTO FLIGHTS
VALUES('ZZZ', 150, 'BFL', 'COS', '08:00:00', '12:00:00');

INSERT INTO TICKETS
VALUES(250, 130, 'ZZZ', 666, 'L30', 999.99, TRUE);

-- end foreign key constraint tests


-- begin general constraint tests


UPDATE TICKETS 
SET cost = 1000
WHERE TICKETS.ticketid = 204;

UPDATE TICKETS
SET cost = -100
WHERE TICKETS.ticketid = 204;


UPDATE FLIGHTS
SET arrivaltime = '08:30:00'
WHERE airlineid = 'VRD' AND departuretime = '08:00:00';

UPDATE FLIGHTS
SET arrivaltime = '07:58:00'
WHERE airlineid = 'VRD' AND departuretime = '08:00:00';


UPDATE AIRPORTS
SET city = 'Knoxville'
WHERE state = 'TN';

UPDATE AIRPORTS
SET city = 'NorthPole'
WHERE state = 'TN';


UPDATE FLIGHTS
SET destination = 'JFK'
WHERE origin = 'LAX';

UPDATE FLIGHTS
SET destination = origin
WHERE destination = 'JFK';

-- end general constraint tests
