drop view if exists vk_id_for_query;
CREATE view vk_id_for_query as
select vk_id from host_friends_profiles where vk_id not in (select vk_id from excepted_friends_profiles)
union
select vk_id from additional_friends_profiles where vk_id not in (select vk_id from excepted_friends_profiles);

drop view if exists host_history;
CREATE view host_history as
select status_list.created_at, status_names.name
from status_list
join status_names on status_list.status_id = status_names.id
where status_list.vk_id = (select vk_id from host limit 1) order by created_at;