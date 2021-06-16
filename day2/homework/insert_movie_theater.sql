INSERT INTO movie(
	movie_title,
	movie_rating
)VALUES(
	'The Boy and His Dog',
	'NR'
);

INSERT INTO ticket(
	ticket_number,
	seat_number,
	theater,
	movie_title,
	movie_rating
)VALUES(
	1,
	'A5',
	1,
	'The Boy and His Dog',
	'NR'
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	ticket_number
)VALUES(
	1,
	'Brandon',
	'Apol',
	'555-555-LUNA',
	1
);

INSERT INTO concession(
	order_number,
	customer_id
)VALUES(
	1,
	1
);