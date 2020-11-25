create database office_stationary;
create table items
(item_id int,
name char(100),
unit char(100),
amount int,
constraint item_pk primary key (item_id)
);
create table vendors
(v_id int,
name char(100),
state char(100),
city char(100),
email char(100),
constraint vendors_pk primary key (v_id)
);