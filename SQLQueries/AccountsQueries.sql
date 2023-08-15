CREATE DATABASE IF NOT EXISTS Accounts;
USE Accounts;

CREATE TABLE IF NOT EXISTS endUsers
(
	uid int,
	username varchar(32),
    password varchar(32),
    email varchar(64),
    phone varchar(32),
    lastAccessed datetime,
    isActive bool,
    PRIMARY KEY(uid)
);

INSERT INTO endUsers
VALUES (1, 'Admin', 'root', 'Admin@gmail.com', '6090001111', '2001-01-01 00:00:00', true);

SELECT * FROM endUsers;

select count(*) from endUsers;

CREATE TABLE IF NOT EXISTS custReps
(
	uid int,
	username varchar(32),
    password varchar(32),
    email varchar(64),
    phone varchar(32),
    lastAccessed datetime,
    isActive bool,
    PRIMARY KEY(uid)
);

Select * from endUsers;

CREATE TABLE IF NOT EXISTS Administrator
(
	uid int,
	username varchar(32),
    password varchar(32),
    email varchar(64),
    phone varchar(32),
    lastAccessed datetime,
    isActive bool,
    PRIMARY KEY(uid)
);

select * from custReps;

INSERT INTO endUsers
VALUES (3, 'cr', 'crpass', 'cr@gmail.com', '6092221111', '2001-01-01 00:00:00', true);

INSERT INTO customerReps
VALUES (3, 'cr', 'crpass', 'cr@gmail.com', '6092221111', '2001-01-01 00:00:00', true);

INSERT INTO Administrator
VALUES (1, 'Admin', 'root', 'Admin@gmail.com', '6090001111', '2001-01-01 00:00:00', true);

create table posts
(
	id int not null AUTO_INCREMENT, 
    item_id int unique not null, 
    user_id varchar(256) not null, 
    created datetime not null, 
    expires datetime not null, 
    price decimal(15,2) not null, 
    increment decimal(10,2), 
    open boolean not null, 
    primary key(id)
);