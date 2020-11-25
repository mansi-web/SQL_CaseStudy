create database practiceassignmnet2;
select *from student;
/*1.	Find the students who have IDs in the following set – 1,5,9*/
select ID, fullname from student
where ID = 1 or ID= 5 or ID=9;
/*2.	List the names of the students who are playing a musical instrument */
select fullname, id from student
where id in (select id
from music);
/*3.	List the students who were born on Wednesday or Saturdays */
select fullname from student
where weekday(newDOB) = 4 or weekday(newDOB)= 7;
/*4.	List the students who were not born in January, March, and June */
select fullname from student
where fullname not in (select fullname from student
where month(newDOB)= 1 or month(newDOB)= 3 or month(newDOB)= 6);
/*5.	List the students who have scored between 70 and 80 and 90 and 100*/
select id, fullname
from student
where (MTest>70 and MTest<80 and PTest>90 and Mtest<100) or (Ptest>70 and Ptest<80 and Mtest >90 and MTest<100);
/*6.	List the students whose names contain E*/
select fullname
from student
where fullname like "%e%";
/*7.	List the students who come from Districts ending with T*/
select fullname, Dcode
from student
where Dcode like "%T";
/*8.	List the students whose names contain B as the second last letter*/
select fullname
from student
where fullname like "%b_";
/*9.	List the students who come from districts with M as the third character*/
select fullname, Dcode
from student
where dcode like "__M%";
/*List the students who don’t contain ‘A’ and ‘R’ in their names*/
select fullname
from student
where FullName not in (select fullname
from student
where fullname like "%A%" and fullname like "%R%");
/*11.	List the students whose names contain only these characters - “A” or “B” or “C” or “D”*/
select fullname
from student
where fullname not in (select fullname
from student
where fullname like "%a%" and fullname like "%b%" and fullname like "%c%" and fullname like "%d%" );