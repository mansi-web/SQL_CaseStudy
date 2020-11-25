create database practise_set5;
/******** set 5*********/
/*ques 1 */
select student.fullname, music.type
from student, music
where student.id=music.id;
/*ques 2 */
select count(student.id), student.Class
from student
where student.id in (select music.id
from music
where type ="piano")
group by student.Class;
/**2**/
select class, count(s.ID)
from student as s, music as m
where s.id=m.id and type="piano"
group by class;
/*ques 3*/
SELECT s.Id, s.FullName
FROM Student s
where s.id not in (select m.id from music m);
/*ques 4*/
select distinct s.id, s.fullname, if(s.id=m.id, m.type, "no instrument") as type
from student s, music m;
/* ques 4*/
select s.id, s.fullname, m.type
from student as s, music as m
where s.id=m.id
union s.id, s.fullname," "
from student as s
where s.id not in(select id from music);
/*ques 5*/
select s1.id, s2.id
from student as s1, student as s2
where s1.id<s2.id
and s1.class=s2.class
order by 1,2;