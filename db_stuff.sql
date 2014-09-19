CREATE TABLE users (
	ID INTEGER PRIMARY KEY,
	email varchar(40),
	password varchar(40)
);



-- insert fake data
INSERT INTO users (email, password) VALUES('edrhuang@gmail.com', 'password');
INSERT INTO users (email, password) VALUES('bob@gmail.com', 'Bob');
INSERT INTO users (email, password) VALUES('alex@gmail.com', 'Alex');
INSERT INTO users (email, password) VALUES('tom@gmail.com', 'Tom');
INSERT INTO users (email, password) VALUES('jane@gmail.com', 'Jane');
