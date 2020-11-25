create database case4;
/*2*/
select count(booking_id) as no_of_bookings, booking_type, booking_mode
from data
where booking_type="p2p"
group by booking_mode;
/*4*/
select drop area, avg(fare) 
from dataa
group by drop area
order by fare
limit 5;
/*5*/
alter table dataa
rename column pickup area to pickup_area;
select unique driver_number, pickup_area
from dataa
group by pickup_area 
/*7*/
alter table dataa
add column confirm_date date;
alter table dataa
add column confirm_time time;
select count()
from dataa
where confirm_date between '2013-11-01' and '2013-11-07';
