create database practise_set3;
/*1*/
select ID, FullName, DCode
from student
order by DCode;
/*2*/
select ID, FullName, max(MTest) as max , min(MTest) as min , DCode
from student
where class like "1%"
group by DCode;
/*3*/
select avg(MTEst) as avgboys_maths_marks, class
from student
where sex= "M"
 group by class
 having count(*) >=2;
/*4*/
select FullName 
from student
where sex = "M"
and class = "1A"
order by FullName;
/*5*/
select FullName, DCode
from student
where class="1B"
order by DCode;
/*6*/
select count(ID) as no_of_students, DCode
from student
group by DCode
order by DCode desc;
/*7*/
select FullName, HCode, class
from student
where sex="M"
order by HCode, class asc;
/*8. top 10% scoring girls students in Maths*/
/*9*/
select FullName, MTest, dense_rank() over (order by MTest) as "rank"
from student
where ( dense_rank over (order by MTest) = 2);
/*10*/
select count(distinct (FullName))
from student;
/*11*/
select count(FullName) as scholar
from student
where fullname in (select fullname from student where MTest>95);
/*1*/
alter table student
add column newDOB date;
update student
set newDOB = str_to_date(left(DOB, 10), '%d-%m-%Y');
select round(avg((datediff(current_date(), newDOB)/365.25)),2) as avg_age
from student
where sex="M";
/*2*/