\i create_lab3.sql
\i lab3_data_loading.sql

UPDATE TICKETS
SET paid = FALSE,
    seatnum = NEWTICKETS.seatnum
FROM NEWTICKETS 
WHERE TICKETS.ticketid = NEWTICKETS.ticketid AND 
      TICKETS.seatnum = NEWTICKETS.seatnum AND 
      TICKETS.airlineid = NEWTICKETS.airlineid AND 
      TICKETS.flightnum = NEWTICKETS.flightnum;

INSERT INTO TICKETS
SELECT n.ticketid, n.custid, n.airlineid, n.flightnum, n.seatnum, NULL, FALSE
FROM NEWTICKETS n
WHERE n.ticketid NOT IN (SELECT t.ticketid FROM TICKETS t);

--SELECT * FROM TICKETS ORDER BY ticketid ASC;
