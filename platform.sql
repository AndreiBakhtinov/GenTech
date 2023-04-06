-- Active: 1679298671152@@127.0.0.1@3306@platform
create database if not exists platform;
use platform;

create table if not exists users(
    user_id integer primary key auto_increment,
	fullname varchar(256) not null,
	email varchar(64) not null,
	is_blocked BOOL default false,
	created_at datetime default current_timestamp
    
);

create table if not exists streams(
    stream_id integer primary key auto_increment,
	user_id integer,
	title varchar(256) not null,
    created_at datetime default current_timestamp,
	is_completed bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

create table if not exists reactions(
    reaction_id integer primary key auto_increment,
	user_id integer,
    value integer not null check(value between 1 and 5),
    stream_id integer,
    created_at datetime default current_timestamp,
	is_blocked bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);