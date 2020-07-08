delimiter //
CREATE TRIGGER fill_status_list_short
 AFTER INSERT
 ON status_list FOR EACH ROW
BEGIN

DECLARE last_status_id bigint unsigned;
	select status_list.status_id from status_list where status_list.vk_id = new.vk_id order by created_at desc limit 1 into last_status_id;
	IF (last_status_id != new.status_id) THEN
            insert into status_list_short (id, created_at, vk_id, status_id) values (new.id, new.created_at, new.vk_id, new.status_id);
      END IF;
END;
delimiter ;