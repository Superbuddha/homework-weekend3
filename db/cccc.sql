DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE films
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE customers
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
);
 CREATE TABLE tickets
 (
   id SERIAL8 PRIMARY KEY,
   film_id INT8 REFERENCES films(id) ON DELETE CASCADE,
   customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
 );
