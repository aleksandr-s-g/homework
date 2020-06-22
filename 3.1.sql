DROP function if exists hello;
DELIMITER //

CREATE FUNCTION Hello ()
RETURNS varchar (255)

BEGIN
	DECLARE now_hour int default hour(now());
	DECLARE message varchar(255) default '';

   	if now_hour >= 6 and now_hour < 12 THEN 
   		set message = 'Доброе утро';
   	end if;
    if now_hour >= 12 and now_hour < 18 THEN 
   		set message = 'Добрый день';
   	end if;
   if now_hour >= 18 and now_hour < 24 THEN 
   		set message = 'Добрый вечер';
   	end if;
   if now_hour >= 0 and now_hour < 6 THEN 
   		set message = 'Доброй ночи';
   	end if;
   
	RETURN message; 

END; //

DELIMITER ;

select hello();
