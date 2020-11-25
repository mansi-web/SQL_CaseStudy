create database optional_assignment;
create table student
(ID int,
full_name varchar(20),
DOB date,
sex varchar(1),
class varchar(2),
HCode varchar(1),
constraint stud_pk primary key (ID)
);
create table music
(musicID int,
type varchar(10),
constraint music_pk primary key (musicID)
);
create table chess
(chessID int,
fullname varchar(20),
sex varchar(1),
class varchar(2),
constraint chess_pk primary key (chessID)
);
create table bridge
(bridgeID int,
fullname varchar(20),
sex varchar(1),
class varchar (2),
constraint bridge_pk primary key (bridgeID)
);
select fullname, MTest
from student
where MTest>90student;
select fullname
from student
where DCode="YMT";
select fullname
from student
where Remission=0;
/* couldnt do the DOB part*/

