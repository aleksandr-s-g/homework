drop database if exists sample;
CREATE database sample;
DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';
start transaction;

insert into sample.users (id, name, birthday_at , created_at ,updated_at ) 
select  id, name, birthday_at , created_at ,updated_at from shop.users where id = 1;

DELETE from shop.users where id = 1;

commit;