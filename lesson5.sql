drop database if exists test;
create database test;
use test;

############################################## TASK 1 ##############################################

DROP TABLE IF EXISTS events;
CREATE TABLE events(
	id serial PRIMARY KEY,
	name varchar(100),
	created_at datetime,
	updated_at datetime
);

INSERT INTO `events` VALUES ('1','error',NULL,NULL),
('2','turning_on',NULL,NULL),
('3','turning_on',NULL,NULL),
('4','turning_off',NULL,NULL),
('5','waiting',NULL,NULL),
('6','turning_on',NULL,NULL),
('7','waiting',NULL,NULL),
('8','completed',NULL,NULL),
('9','turning_on',NULL,NULL),
('10','waiting',NULL,NULL); 


update events set created_at = now(), updated_at = now();






############################################## TASK 2 ##############################################

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id serial PRIMARY KEY,
	name varchar(100),
	created_at varchar(100),
	updated_at varchar(100)
);


INSERT INTO `users` VALUES ('1','Alex','20.4.2013 2:24','20.12.2017 18:15'),
('2','John','21.12.2011 8:10','1.11.2012 4:9'),
('3','Trevor','12.3.2012 9:20','2.3.2013 5:15'),
('4','Henry','10.2.2013 11:30','28.2.2014 1:12'),
('5','Allyson','1.2.2014 12:24','22.4.2015 18:34'),
('6','Noah','3.1.2015 14:46','1.2.2016 9:48'),
('7','Charly','22.4.2012 18:38','3.1.2013 14:35'),
('8','Barrie','28.4.2018 10:23','10.9.2019 16:36'),
('9','Monika','2.5.2019 1:12','3.5.2019 10:12'),
('10','Taysia','1.9.2011 4:55','21.12.2011 12:10'); 




update 
	users
set
	created_at = STR_TO_DATE(created_at, '%e.%c.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at, '%e.%c.%Y %H:%i');

ALTER TABLE users MODIFY created_at DATETIME, MODIFY updated_at DATETIME;




############################################## TASK 3 ##############################################

DROP TABLE IF EXISTS storehouses_products;
CREATE table storehouses_products(
	id serial primary key,
	name varchar(100),
	value int unsigned 
);

INSERT INTO `storehouses_products` VALUES ('1','repellat',8),
('2','sed','11'),
('3','fugit','2'),
('4','exercitationem','0'),
('5','asperiores','25'),
('6','ut','18'),
('7','atque','41'),
('8','eos','48'),
('9','nulla','5'),
('10','commodi','21'),
('11','ipsum','15'),
('12','ut','34'),
('13','facere','20'),
('14','voluptatem','36'),
('15','eos','5'),
('16','fugiat','0'),
('17','qui','4'),
('18','rerum','33'),
('19','eligendi','4'),
('20','ut','5'),
('21','iure','31'),
('22','modi','5'),
('23','minima','3'),
('24','odit','14'),
('25','deleniti','0'),
('26','consequuntur','14'),
('27','suscipit','41'),
('28','amet','5'),
('29','quas','11'),
('30','dolores','21'),
('31','enim','20'),
('32','et','39'),
('33','impedit','13'),
('34','beatae','48'),
('35','vitae','37'),
('36','excepturi','12'),
('37','dolorem','48'),
('38','repellat','28'),
('39','vero','35'),
('40','sit','47'),
('41','quaerat','0'),
('42','fugit','25'),
('43','molestiae','44'),
('44','et','44'),
('45','mollitia','8'),
('46','natus','41'),
('47','provident','32'),
('48','in','33'),
('49','voluptatem','38'),
('50','omnis','31');

-- красивое
SELECT name, value from storehouses_products order by field(value,0), value;

-- универсальное
select * from (
(SELECT name, value from storehouses_products where value > 0)
union
(SELECT name, value from storehouses_products where value = 0)
) as a order by field(value,0), value;


-- без field
select name, value from (SELECT name, if(value = 0, 2, 1) as resorder, value from storehouses_products) as a order by resorder, value;

############################################## TASK 4 ##############################################
select * from users where MONTHNAME(created_at) in('may', 'august');

############################################## TASK 5 ##############################################
SELECT * FROM users WHERE id IN (5, 1, 2) order by field(id, 5, 1, 2);






############################################## AGREGATION ##############################################
############################################## TASK 1 ##############################################
select avg(floor(datediff(now(),created_at) / 365)) from users;

############################################## TASK 2 ##############################################

select DAYNAME(DATE_FORMAT(created_at,CONCAT(YEAR(NOW()),'-%m-%d %T'))) as week_day, count (*) as num from users group by week_day;

############################################## TASK 3 ##############################################
SELECT exp(SUM(log(id))) product FROM users;
-- не работает, если есть отрицательный числа или 0, но работает для столбцов, в которых их нет гарантированно. можно реализовать с помощью функции, но так как мы это еще не проходили, то думаю, что так нельзя

