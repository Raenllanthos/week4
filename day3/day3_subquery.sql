SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id;
WHERE country = 'Angola'

-- SubQuery Examples
-- Two Queries split apart (we'll show one become a subquery later)
-- Find a customer_id that has an amount greater than 175 in total payments

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- Find ALL customer info
SELECT * FROM customer;

-- Subquery to find the 6 customers that have a total greater than 175
SELECT store_id, first_name, last_name, customer.customer_id FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id, first_name, last_name, customer.customer_id;

-- More Basic Sub Queries
-- Find all FILMS with the language 'English'
SELECT * FROM film WHERE language_id IN (
	SELECT language_id FROM language
	WHERE name = 'English'
);

SELECT * FROM film