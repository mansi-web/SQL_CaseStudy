create database finalproject1;
drop table pre;
drop table pre csv;
create table pre
(DT char(10),
ID int,
City int,
NAME varchar(30),
ITEM_ID int,
ITEM_NAME varchar(50),
HR_of_the_day int,
ORDERS int,
QTY int,
ITEM_GMV int,
CATEGORY varchar(50) 
);
drop table pre2;
create table post
(DT char(10),
ID int,
City int,
NAME varchar(30),
ITEM_ID int,
ITEM_NAME varchar(50),
HR_of_the_day int,
ORDERS int,
QTY int,
ITEM_GMV int,
CATEGORY varchar(50)
);
drop table pre_csv;
/*1 COUNT, GROUP BY, ORDER BY, LIMIT*/
select city, count(id) as count
from pre
group by city
order by count(id) desc
limit 5;
select city, count(id) as count
from post
group by city
order by count(id) desc
limit 5;
/*2 CATEGORY WISE ANALYSIS*/
select count(qty), CATEGORY
from pre
group by CATEGORY
order by 1 desc
limit 5;
select count(qty), CATEGORY
from post
group by CATEGORY
order by 1 desc
limit 5;
/*3 ITEM WISE ANALYSIS*/
select item_name , count(ID) as count
from pre
group by ITEM_NAME
order by count(id) desc
limit 5;
select item_name , count(id) as count
from post
group by ITEM_NAME
order by count(id) desc
limit 5;
/*4 INNER JOIN, COLUMN ALIAS*/
select avg(pre.ITEM_GMV) as pre_sales, avg(post.ITEM_GMV) as post_sales
from pre inner join post on pre.ITEM_ID=post.ITEM_ID;
/*5 BETWEEN, AND*/
select count(id) as entries_btwn_16and22
from pre
where HR_of_the_day between 16 and 22;
select count(id) as entries
from pre
where HR_of_the_day between 22 and 23
or HR_of_the_day between 0 and 4;
/*6 ALTER, ADD COLUMN, STR_TO_DATE, AVG FUNCTION */
alter table pre
add column newdate date;
update pre
set newdate = str_to_date(left(DT,10), '%d -%m-%Y');
select avg(item_gmv), newdate
from pre
group by newdate
order by 1 desc;
select avg(ITEM_GMV), DT
from post
group by 2
order by 1 desc;
/*7 COUNT FUNCTION*/
select NAME, count(id), city
from pre
group by name
order by 2 desc;
/*8 TABLE ALIAS, INNER JOIN*/
select t1.name
from pre as t1 inner join pre as t2 on t1.id = t2.id
where t1.name = t2.name
and t1.city not in (select t2.city from pre as t2);
/*9 DISTINCT FUNCTION*/
select distinct city
from post
where city not in (select city from pre);
select distinct city
from pre
where city not in (select city from post);
/*10 LIKE, WILDCARD OPERATOR*/
select distinct item_name
from pre
where item_name like "ice%";
/*11 MAX FUNCTION*/
select category, max(item_gmv)
from pre
group by category
order by 2 desc
limit 3;
/*12 HAVING FUNCTION*/
select city, NAME
from pre
where newdate < '2019-10-17'
group by city
having count(*)>5000;
/*13 MIN FUNCTION*/
select ITEM_NAME, min(ITEM_GMV) 
from pre
group by 1
order by 2 asc
limit 1;
select ITEM_NAME, min(ITEM_GMV) 
from post
group by 1
order by 2 asc
limit 1;
/*14 VARIETY IN ITEMS*/
select name, count(ITEM_NAME) as no_of_items
from pre
group by 1
order by 2 desc
limit 3;
select name, count(ITEM_NAME) as no_of_items
from pre
group by 1
order by 2 desc
limit 3;
/*15 TABLE JOIN*/
select DISTINCT pre.NAME, pre.ITEM_GMV as pre_sales, post.ITEM_GMV as post_sales
from pre inner join post on pre.id=post.id
where pre.ITEM_GMV>post.ITEM_GMV;