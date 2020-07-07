drop table if exists logs;
CREATE table logs(
	id serial primary key,
	created_at datetime default now(),
	table_name varchar(255),
	primary_key BIGINT UNSIGNED NOT NULL,
	name varchar(255)
) ENGINE=ARCHIVE;

DELIMITER //

CREATE TRIGGER after_users_insert
AFTER INSERT
ON users FOR EACH ROW
BEGIN
    INSERT INTO logs(table_name, primary_key, name)
    VALUES( "users",new.id,new.name);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_catalogs_insert
AFTER INSERT
ON catalogs FOR EACH ROW
BEGIN
    INSERT INTO logs(table_name, primary_key, name)
    VALUES( "catalogs",new.id,new.name);
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_products_insert
AFTER INSERT
ON products FOR EACH ROW
BEGIN
    INSERT INTO logs(table_name, primary_key, name)
    VALUES( "products",new.id,new.name);
END//

DELIMITER ;