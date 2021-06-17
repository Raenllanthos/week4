-- QUESTION ONE
SELECT first_name, last_name, customer.address_id, district
FROM customer 
INNER JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas';
-- 5 people live in texas

-- QUESTION TWO
SELECT customer.customer_id, first_name, last_name, amount
FROM customer 
INNER JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;
-- 1406 rows

-- QUESTION THREE
SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)
)
GROUP BY customer_id,first_name,last_name;
-- 6 rows

--QUESTION FOUR
SELECT customer_id, first_name, last_name, customer.address_id, 
		address, district, address.city_id, city, city.country_id, country
FROM customer 
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- 1 person named Kevin

-- QUESTION FIVE
SELECT staff.staff_id, first_name, last_name, COUNT(payment_id)
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id;
-- jon with the 7304

-- QUESTION SIX
SELECT rating, COUNT(rating) FROM film GROUP BY rating;
-- "R"		195
-- "NC-17"	210
-- "G"		178
-- "PG"		194
-- "PG-13"	223

-- QUESTION SEVEN
SELECT DISTINCT ON(first_name) first_name, last_name, amount FROM(
	SELECT customer.customer_id, first_name, last_name, amount
	FROM customer
	INNER JOIN payment ON customer.customer_id = payment.customer_id
	GROUP BY customer.customer_id, amount
	HAVING amount > 6.99
) sub GROUP BY first_name, last_name, amount
ORDER BY first_name DESC;
-- Distinct says there's like 500+ people

-- QUESTION EIGHT
SELECT rental_id, amount FROM payment
GROUP BY rental_id, amount HAVING amount = 0;
-- 24 rentals

SELECT * FROM customer;
SELECT * FROM city;
SELECT * FROM film;
SELECT * FROM country;
SELECT * FROM staff;
SELECT * FROM store;
SELECT * FROM payment;
SELECT * FROM rental;