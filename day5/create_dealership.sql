CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150)
);

CREATE TABLE sales_person(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150)
);

CREATE TABLE car(
	car_serial SERIAL PRIMARY KEY,
	make VARCHAR(20),
	model VARCHAR(20),
	color VARCHAR(20),
	year INTEGER,
	car_amount NUMERIC(8,2)
);

CREATE TABLE parts(
	mechanic_id INTEGER,
	work_done VARCHAR(250) PRIMARY KEY,
	car_serial INTEGER,
	parts_amount NUMERIC(8,2),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(car_serial) REFERENCES car(car_serial)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_type VARCHAR(20),
	staff_id INTEGER,
	customer_id INTEGER,
	car_serial INTEGER,
	payment_id INTEGER,
	payment_type VARCHAR(20),
	payment_amount NUMERIC(8,2),
	payment_date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY(staff_id) REFERENCES sales_person(staff_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(car_serial) REFERENCES car(car_serial)
);

-- DROP TABLE car;
 DROP TABLE invoice;
-- DROP TABLE parts;
-- DROP TABLE mechanic;