create database case7;
/*1*/
select teacher_id, count(class_id) as no_of_classes_tchr_is_taking
from teacher_allocation
group by teacher_id
order by teacher_id asc;
/*2*/
select count(student_name) as no_of_stud_with_name_similarto_joh
from student
where student_name like "John";
/*3*/
select student_name, ""as rollno
from student
order by student_name asc;
/*4*/
select class_id , count(gender) as male, (count(student_id) - count(gender)) as female, (count(gender)) div (count(student_id)-count(gender)) as ratio
from student
where gender="M"
group by class_id 
order by class_id asc;
/*5*/
alter table teacher
add column DOJ date;
update teacher set DOJ= str_to_date(left(date_of_joining, 10), '%Y-%m-%d');
select avg(round((datediff(current_date, DOJ)/365.25), 2)) as avg_exp_in_yrs
from teacher;
/*6*/
/*7*/
select student.student_id, exam_paper.marks as marks_obtained, exam.total_marks as total_marks
where student.student_id in (1, 4, 9, 16, 25);
