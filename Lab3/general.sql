\i foreign.sql

ALTER TABLE TICKETS 
ADD CONSTRAINT cost_is_positive 
CHECK (cost >= 0);

ALTER TABLE FLIGHTS
ADD CONSTRAINT arrivaltime_check
CHECK (arrivaltime > departuretime);

ALTER TABLE AIRPORTS 
ADD CONSTRAINT TN_CON
CHECK ((city = 'Knoxville' AND state = 'TN') OR state <> 'TN');

ALTER TABLE FLIGHTS 
ADD CONSTRAINT dest_diff 
CHECK (destination <> origin);
