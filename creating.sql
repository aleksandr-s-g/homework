DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

insert into users (name) values ('Brewer');
insert into users (name) values ('Porter');
insert into users (name) values ('Jared');
insert into users (name) values ('Sibelle');
insert into users (name) values ('Augustina');
insert into users (name) values ('Sibyl');
insert into users (name) values ('Staci');
insert into users (name) values ('Mart');
insert into users (name) values ('Agustin');
insert into users (name) values ('Nickola');
insert into users (name) values ('Neall');

SELECT * FROM users;

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
