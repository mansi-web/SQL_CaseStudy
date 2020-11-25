create database Books_information;
create table publishers
(PID INT,
name char(100),
year INT,
constraint pub_pk primary key (PID)
);
create table authors
(AID INT,
Authorname char (100),
constraint author_pk primary key (AID)
);
create table books
(BID int,
bookname char(100),
location char(100),
issuedate date,
constraint book_pk primary key (BID)
);