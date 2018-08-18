--\i create_lab4.sql
--\i lab4_data_loading.sql

CREATE FUNCTION deleteUnpaid(deletecount INTEGER)
	RETURNS INTEGER AS $$
	DECLARE totalcost INTEGER;
	DECLARE i INTEGER;
	DECLARE r INTEGER;
	DECLARE costi INTEGER;
BEGIN
	totalcost = 0;
	FOR r IN SELECT DISTINCT custid FROM TICKETS WHERE paid = 'False'
	LOOP
		i = 0;
		WHILE (i < deletecount)
			loop
				i = i + 1;
				costi = (SELECT Max(cost) 
						 FROM TICKETS t2 
						 WHERE t2.custid = r AND 
						 t2.paid = 'False'
						 );
						 
				if costi IS NOT NULL THEN
					totalcost = totalcost + costi;
					DELETE FROM TICKETS t 
					WHERE t.custid = r AND t.cost = costi;
				END IF;
				
		END loop;
	END LOOP;
	RETURN totalcost;
END;
$$ LANGUAGE plpgsql;
