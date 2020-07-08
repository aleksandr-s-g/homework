select status_list.created_at, status_names.name
from status_list
join status_names on status_list.status_id = status_names.id
where status_list.vk_id = 22189008 order by status_list.created_at desc limit 10;