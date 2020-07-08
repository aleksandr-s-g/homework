drop database if exists friends;
create database friends;
use friends;


drop table if exists host;
create table host
( 	
	first_name varchar(255),
	last_name varchar (255),
	vk_id bigint unsigned,
	access_token varchar(255)
);

drop table if exists host_friends_profiles;
create table host_friends_profiles
(
	vk_id bigint unsigned primary key,
	first_name varchar(255),
	last_name varchar (255),
	INDEX vk_id_idx(vk_id)
);

drop table if exists additional_friends_profiles;
create table additional_friends_profiles
(
	vk_id bigint unsigned primary key,
	first_name varchar(255),
	last_name varchar (255),
	INDEX vk_id_idx(vk_id)
);

drop table if exists excepted_friends_profiles;
create table excepted_friends_profiles
(
	vk_id bigint unsigned primary key,
	first_name varchar(255),
	last_name varchar (255),
	INDEX vk_id_idx(vk_id)
);

drop table if exists status_list;
drop table if exists status_names;
create table status_names
(
	id int unsigned primary key,
	name varchar(255)
);

create table status_list
(
	id bigint unsigned primary key AUTO_INCREMENT,
	created_at datetime,
	vk_id bigint unsigned,
	status_id int unsigned,
	FOREIGN KEY (status_id) REFERENCES status_names(id),
	INDEX vk_id_idx(vk_id),
	INDEX vk_id_cr_at_idx(vk_id, created_at)
);

create table status_list_short
(
	id bigint unsigned primary key,
	created_at datetime,
	vk_id bigint unsigned,
	status_id int unsigned,
	FOREIGN KEY (status_id) REFERENCES status_names(id),
	INDEX vk_id_idx(vk_id),
	INDEX vk_id_cr_at_idx(vk_id, created_at)
);