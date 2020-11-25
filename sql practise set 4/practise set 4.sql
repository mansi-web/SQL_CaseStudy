create database practise_set4;
/*1*/
select fullname, Mtest , dense_rank() over (order by MTest desc) as d_rank
from student
order by Mtest desc
limit 10;
/*2*/
select fullname, Mtest
from (select fullname, Mtest
from student
order by MTest desc
limit 2) as temp
order by MTest asc
limit 1;
/*1*/
select fullname, left(FullName, 1)
from student
where DCode = "YMT";
/*2*/
select fullname, left(FullName, length(fullname)-1) as output
from student;
/*3*/
select fullname, right(fullname, 2) as output
from student;
/*4*/
select fullname, mid(fullname, 1, length(fullname)-1) as output
from student;
/*5*/
select fullname, mid(fullname, length(fullname), 2) as output
from student;
/*6*/
select ucase(fullname)
from student;
/*7*/
select fullname
from student
where fullname like "%e%";
/*Union / Intersection / Difference Questions*/
/*1*/
select * from chess cross join bridge;
/*or*/
select bridge.FullName
from chess full join bridge on bridge.id = chess.id ;
/*2*/
select chess.id
from chess inner join bridge on chess.id = bridge.id;
/*3*/
select chess.id
from chess left join bridge on chess.id = bridge.id
where chess.id not in (select chess.id
from chess inner join bridge on chess.id= bridge.id);
/*4*/
select chess.id
from chess full join bridge on chess.id = bridge.id
where chess.id not in (select chess.id 
from chess inner join bridge on bridge.id= chess.id);
/*Exists _ Exists*/
/*1*/
select fullname
from student
where  DCode="HMM" and Sex="M" and
exists (select fullname
from student
where DCode="HMM"
and sex="F");
/*2*/
select id, fullname
from student
where class= "1A" and
exists (select id, fullname from student where class="1A" and id in (select id from music));
/*2*/
select id,fullname, class 
from student 
where class='1a' 
 and exists 
    (select fullname,student.id 
    from student, Music 
    where student.ID = Music.ID and class ='1a');
/*3*/
SELECT Id, FullName, MTest, DCode
FROM Student 
WHERE DCode = "HHM" and Not Exists (SELECT * 
FROM Student WHERE DCode = "HHM" and Mtest <80);

/*join queries*/
/*1*/
SELECT s.Id, FullName, Type
FROM Student as s LEFT JOIN Music as M ON s.ID = m.ID
UNION 
SELECT s.Id, FullName, Type
FROM Student as s RIGHT JOIN Music as M ON s.ID = m.ID;
