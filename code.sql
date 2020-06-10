
############################################################### TASK 2 ###############################################################
drop table if exists target_user;
CREATE table target_user
(
	id bigint
);
insert into target_user values (6); -- задаем пользователя


select companion_id, count(companion_id) as num
from(
select to_user_id as companion_id from messages where from_user_id = (select * from target_user) and to_user_id in 
( -- получаем список друзей
select target_user_id as friend_id from friend_requests where status = 'approved' and initiator_user_id = (select * from target_user)
UNION 
select initiator_user_id as friend_id from friend_requests where status = 'approved' and target_user_id = (select * from target_user)
)
union all
select from_user_id as companion_id from messages where to_user_id = (select * from target_user) and from_user_id in 
( -- получаем список друзей
select target_user_id as friend_id from friend_requests where status = 'approved' and initiator_user_id = (select * from target_user)
UNION 
select initiator_user_id as friend_id from friend_requests where status = 'approved' and target_user_id = (select * from target_user)
))as a group by companion_id order by num desc -- limit 1 -- ставим лимит, если необходимо
;

############################################################### TASK 3 ###############################################################

select count(*) as common_number from likes_to_user where like_receiver in (
select user_id from (
select user_id , YEAR(CURDATE()) - YEAR(birthday) AS age from profiles order by age asc limit 10
) as a);

############################################################### TASK 4 ###############################################################

SELECT profiles.gender as gender, count(*) as num from likes_to_media, profiles, likes_to_post, likes_to_user
where 
profiles.user_id = likes_to_media.like_sender
or
profiles.user_id = likes_to_post.like_sender
or
profiles.user_id = likes_to_user.like_sender
group by gender order by num DESC -- limit 1
;
-- красивый но очень долгий

SELECT gender, count(gender) as num from (
SELECT profiles.gender as gender from likes_to_media, profiles
where 
profiles.user_id = likes_to_media.like_sender
union all
SELECT profiles.gender as gender from likes_to_post, profiles
where 
profiles.user_id = likes_to_post.like_sender
union all
SELECT profiles.gender as gender from likes_to_user, profiles
where 
profiles.user_id = likes_to_user.like_sender) as a group by gender order by num desc -- limit 1
;
-- некрасивый но очень быстрый

