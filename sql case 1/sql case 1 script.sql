create database case1;
alter table student rename column name to Studname;
/*class 2A students*/
select Studname, id from student
where class = "2A";
/*names and Mtest of 1B boys*/
select Studname, Mtest
from student
where sex="M" and class ="1B";
/*students whose names contain the letter "e" as the third letter*/
select Studname, class
from student
where Studname like "__e%";
/*names start with "T" and do not contain "y"*/
select studname , class
from student
where studname like "T%" and studname not like "%y%";
/*1A students whose Math test score is not 51, 61, 71, 81, or 91*/
select studname from student
where class = "1A" and studname not in (select studname from student
where mtest= "51" or "61" or "71" or "81" or "91" );
/*students who were born between 22 March 1986 and 21 April 1986*/
alter table student add column dobnew date;
update student set dobnew = str_to_date(left(dob,10), '%d-%m-%Y');
select studname from student
where date(dobnew)>date(1986-03-22) and date(dobnew)<date(1986-04-21);
/*number of girls living in TST*/
select count(studname) as no_of_girls from student where dcode = "TST" and sex="F"; 
/*number of pass in the Math test of each class. (passing mark = 50)*/
select count(studname) as no_of_pass from student where Mtest>50 or Mtest=50;
/*number of girls grouped by each class*/
select count(studname) as 1Agirls from student
where sex="F" and class= "1A";
select count(studname) as 1Bgirls from student
where sex="F" and class= "1B";
select count(studname) as 1cgirls from student
where sex="F" and class= "1c";
select count(studname) as 2Agirls from student
where sex="F" and class= "2A";
select count(studname) as 2Bgirls from student
where sex="F" and class= "2B";
select count(studname) as 2cgirls from student
where sex="F" and class= "2c";
select count(studname) as 3Agirls from student
where sex="F" and class= "3A";
/*number of girls grouped by the year of birth*/
/*average age of Form 1 boys*/
/*average mark of mtest for each class*/
/*maximum mark of mtest for each sex*/
/*average mark of mtest for all students*/
/*common members of the Physics Club and the Chemistry Club*/
select FullName from phy
where FullName in (select FullName from chem);
/*common members of the Chemistry Club and Biology Club but not of the Physics Club*/
select fullname from chem
where fullname in (select fullname from bio) and fullname not in (select fullname from phy);
/*parts in ascending order of quantity*/
/*parts that consist of the keyword ‘Shaft’ in the description*/
select part_no from client
where Descript like "%shaft%";
/*parts that have a quantity more than 20 and are supplied by ‘China Metals Co.’*/
select part_no from client
where qty>20 and supplier= "China Metals Co.";
/*all the suppliers without duplication*/
/*Increase the quantity by 10 for those parts with quantity less than 10*/
/*Delete records with part_no equal to 879, 654, 231 and 234*/
/*Add a field “Date_purchase” to record the date of purchase*/
alter table client add column date_of_purchase date;