-- CUSTOMER
SELECT * FROM customer;

CREATE OR REPLACE FUNCTION add_customer(
	add_customer_id INTEGER,
	add_first_name VARCHAR,
	add_last_name VARCHAR
) RETURNS void LANGUAGE plpgsql AS $MAIN$ BEGIN
	INSERT INTO customer(customer_id, first_name, last_name)
	VALUES(add_customer_id, add_first_name, add_last_name);
END;
$MAIN$

-- SALES_PERSON
SELECT * FROM sales_person;

CREATE OR REPLACE FUNCTION add_sales_person(
	add_sales_person_id INTEGER,
	add_first_name VARCHAR,
	add_last_name VARCHAR
) RETURNS void LANGUAGE plpgsql AS $MAIN$ BEGIN
	INSERT INTO sales_person(staff_id, first_name, last_name)
	VALUES(add_sales_person_id, add_first_name, add_last_name);
END;
$MAIN$

-- MECHANIC
SELECT * FROM mechanic;

CREATE OR REPLACE FUNCTION add_mechanic(
	add_mechanic_id INTEGER,
	add_first_name VARCHAR,
	add_last_name VARCHAR
) RETURNS void LANGUAGE plpgsql AS $MAIN$ BEGIN
	INSERT INTO mechanic(mechanic_id, first_name, last_name)
	VALUES(add_mechanic_id, add_first_name, add_last_name);
END;
$MAIN$

-- CAR
SELECT * FROM car;

CREATE OR REPLACE FUNCTION add_car(
	add_car_serial INTEGER,
	add_make VARCHAR,
	add_model VARCHAR,
	add_color VARCHAR,
	add_year INTEGER,
	add_car_amount DECIMAL
) RETURNS void LANGUAGE plpgsql AS $MAIN$ BEGIN
	INSERT INTO car(car_serial, make, model, color, year, car_amount)
	VALUES(add_car_serial, add_make, add_model, add_color, add_year, add_car_amount);
END;
$MAIN$

-- PARTS
SELECT * FROM parts;

CREATE OR REPLACE FUNCTION add_part(
	the_mechanic_id INTEGER,
	add_work_done VARCHAR,
	the_car_serial INTEGER,
	add_parts_amount DECIMAL
) RETURNS void LANGUAGE plpgsql AS $MAIN$ BEGIN
	INSERT INTO parts(mechanic_id, work_done, car_serial, parts_amount)
	VALUES(the_mechanic_id, add_work_done, the_car_serial, add_parts_amount);
END;
$MAIN$

-- INVOICE
SELECT * FROM invoice;

CREATE OR REPLACE FUNCTION add_invoice(
	add_invoice_id INTEGER,
	add_invoice_type VARCHAR,
	the_sales_person INTEGER,
	the_customer_id INTEGER,
	the_car_serial INTEGER,
	add_payment_id INTEGER,
	add_payment_type VARCHAR,
	add_payment_amount DECIMAL,
	add_payment_date TIMESTAMP WITHOUT TIME ZONE
) RETURNS void LANGUAGE plpgsql AS $MAIN$ BEGIN
	INSERT INTO invoice(invoice_id, invoice_type, staff_id, customer_id, car_serial, payment_id, payment_type, payment_amount, payment_date)
	VALUES(add_invoice_id, add_invoice_type, the_sales_person, the_customer_id, the_car_serial, add_payment_id, add_payment_type, add_payment_amount, add_payment_date);
END;
$MAIN$

-- CALLING ALL FUNCTIONS
SELECT * FROM customer; 	-- add_customer
SELECT * FROM sales_person; -- add_sales_person
SELECT * FROM mechanic; 	-- add_mechanic
SELECT * FROM car; 			-- add_car
SELECT * FROM parts; 		-- add_part
SELECT * FROM invoice; 		-- add_invoice

SELECT add_customer(1, 'Cullen', 'Wenzlick');
SELECT add_customer(2, 'Brandon', 'Apol');
SELECT add_sales_person(1, 'Devon', 'Wehrlin');
SELECT add_sales_person(2, 'Rony', 'Shabo');
SELECT add_mechanic(1, 'Michael', 'Taylor');
SELECT add_mechanic(2, 'Randy', 'Riback');
SELECT add_car(123456789, 'Honda', 'Civic', 'Gray', 2019, '0.00');
SELECT add_car(999999999, 'Porche', 'Dude Magnet', 'Dark Pink', 2025, 200000.00);
SELECT add_part(1, 'Car inspection, Fluid Change, and Tire Change', 123456789, 10000.00);
SELECT add_part(2, 'Fucked up an oil change after working for 10 years, sorry boss', 123456789, '0.00');
SELECT add_invoice(1, 'Service', 1, 1, 123456789, 1, 'Cash', 10000.00, NOW()::TIMESTAMP);
SELECT add_invoice(2, 'Purchase', 2, 2, 999999999, 2, 'Check', 200000.00, NOW()::TIMESTAMP);

--Add Work Done to a Mechanic
-- CREATE OR REPLACE PROCEDURE work_done_did(
-- 	the_mechanic_id INTEGER,
-- 	the_work_done_did VARCHAR
-- ) LANGUAGE plpgsql AS $$ BEGIN
	SELECT mechanic.mechanic_id, first_name, last_name, parts.work_done
	FROM mechanic
	INNER JOIN parts
	ON mechanic.mechanic_id = parts.mechanic_id;
-- 	SELECT first_name, last_name, parts.work_done AS 'butt'
-- 	FROM mechanic
-- 	INNER JOIN parts
-- 	ON mechanic.mechanic_id = parts.mechanic_id
-- 	GROUP BY first_name, last_name, parts.work_done;
-- 	COMMIT;
-- END;
-- $$


-- DROP PROCEDURE work_done_did;
-- CALL work_done_did(1, 'Car inspection, Fluid Change, and Tire Change');

