SELECT * FROM payment;

-- Stored Procedure Example
-- Simulate Late Fee Charge

CREATE OR REPLACE PROCEDURE lateFee(
	customer INTEGER,
	lateFeeAmount DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
	-- Add late fee to customer payment
	UPDATE payment
	SET total_amount = amount + lateFeeAmount, lateFee = lateFeeAmount
	WHERE customer_id = customer;
	-- Commit the above statement inside of a transaction
	COMMIT;
END;
$$

-- CALL A STORED PROCEDURE
CALL lateFee(341, 2.00);

-- Validate the late fee has been added
SELECT * FROM payment WHERE customer_id = 341;

-- ALTER TABLE payment ADD lateFee NUMERIC(5,2);
-- ALTER TABLE payment ADD total_amount NUMERIC(5,2);

-- DELETE/DROP newly created stored procedure
DROP PROCEDURE lateFee;

-- Stored Function Example
-- Stored Function to insert data into the Actor Table
-- PARTS OF SQL FUNCTION
--- Header
--- Declaration
--- Body

SELECT * FROM actor;

--Header
CREATE OR REPLACE FUNCTION add_actor(
	add_actor_id INTEGER,
	add_first_name VARCHAR,
	add_last_name VARCHAR,
	add_last_update TIMESTAMP WITHOUT TIME ZONE
) RETURNS void
-- Declaration
LANGUAGE plpgsql
AS $MAIN$
	BEGIN
		-- BODY
		INSERT INTO actor(actor_id, first_name, last_name, last_update)
		VALUES(add_actor_id, add_first_name, add_last_name, add_last_update);
	END;
$MAIN$

-- Be sure to SELECT <function name> not CALL
SELECT add_actor(501, 'Tim', 'Robins', NOW()::TIMESTAMP);

-- Verify Tommy from Power Rangers is here
SELECT * FROM actor WHERE actor_id = 500;
SELECT * FROM actor WHERE actor_id = 501;

-- Delete/Drop Stored Function
DROP FUNCTION add_actor;

-- Select to view Film table
SELECT * FROM film;

-- Create a function to view the count of films BETWEEN a length of x and y
CREATE OR REPLACE FUNCTION get_film_count(
	length_start INTEGER,
	length_end INTEGER
) RETURNS INTEGER
LANGUAGE plpgsql
AS $MAIN$
DECLARE
	film_count INTEGER;
	BEGIN
		SELECT COUNT(*)
		INTO film_count
		FROM film
		WHERE length BETWEEN length_start AND length_end;
		RETURN film_count;
	end;
$MAIN$

SELECT get_film_count(50,90);