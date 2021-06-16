CREATE TABLE movie(
	movie_title VARCHAR(50) PRIMARY KEY,
	movie_rating VARCHAR(50),
	movie_time TIME DEFAULT CURRENT_TIME,
	movie_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE ticket(
	ticket_number SERIAL PRIMARY KEY,
	ticket_time TIME DEFAULT CURRENT_TIME,
	ticket_date DATE DEFAULT CURRENT_DATE,
	seat_number VARCHAR(50),
	theater INTEGER,
	movie_title VARCHAR(50),
	movie_rating VARCHAR(50),
	FOREIGN KEY(movie_title) REFERENCES movie(movie_title)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	phone_number VARCHAR(15),
	ticket_number INTEGER,
	FOREIGN KEY(ticket_number) REFERENCES ticket(ticket_number)
);

CREATE TABLE concession(
	order_number SERIAL PRIMARY KEY,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);