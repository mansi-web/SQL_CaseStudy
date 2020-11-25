/**final project 2**/
/**submitted by MANSI - 3569- NEW DELHI**/
create database finalproject2;
/********Ques 1********/
create table station
(id int,
city varchar(20),
state varchar(2),
lat_n int,
long_w int,
constraint st_pk primary key(id) 
);
/********Ques 2********/
insert into station(id, city, state, lat_n, long_w)
values(13,"Phoenix","AZ",33,112),
(44,"Denver","CO",40,105),
(66,"Caribou","ME",47,68);
/********Ques 3********/
select * from station;
/********Ques 4********/
select id as northern_stations
from station
where lat_n>39.7;
/********Ques 5********/
create table stats
(id int,
month int,
temp_f int,
rain_i int,
constraint sts_fk foreign key(id) references station(id),
constraint sts_unq unique(id,month)
);
/********Ques 6********/
insert into stats(id, month, temp_f, rain_i)
values(13,1,57.4,.31),
(13,7,91.7,5.15),
(44,1,27.3,.18),
(44,7,74.8,2.11),
(66,1,6.7,2.1),
(66,7,65.8,4.52);
/*******Ques 7*****/
select stats.temp_f, station.city
from stats inner join station on stats.id=station.id
group by station.city;
/******Ques 8******/
select stats.month, stats.rain_i, station.city, stats.temp_f, stats.id
from stats inner join station on stats.id= station.id
group by stats.month, stats.rain_i
order by stats.month asc, stats.rain_i desc;
/******Ques 9*****/
select stats.temp_f, station.city, station.lat_n
from stats inner join station on stats.id=station.id
where month=7
order by temp_f asc;
/******Ques 10******/
select station.city, max(stats.temp_f) as max, min(stats.temp_f) as min, avg(stats.rain_i) as avg
from stats inner join station on stats.id=station.id
group by station.city;
/*******Ques 11*****/
select station.city, ((9* stats.temp_f)/5)+32 as temp_inC, (stats.rain_i *2.54) as rain_in_cm
from station inner join stats on station.id=stats.id
group by station.city;
/*******Ques 12********/
alter table stats
modify column rain_i float;
update stats
set rain_i=(rain_i + 0.1);
/*********Ques 13*****/
alter table stats
modify column temp_f float;
update stats
set temp_f=74.9
where month=7
and id in (select id 
from station
where city="Denver");

