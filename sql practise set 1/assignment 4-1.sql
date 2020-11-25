create database booksinfo;
create table publisher
(PID int,
pubname char(100),
email varchar(100),
phone int,
address varchar(100),
constraint p_pk primary key (PID)
);
create table books
(BID int auto_increment,
Bname varchar(20) not null,
genre varchar(20),
booklanguage varchar(20),
ISBN int(10),
price int(10),
PID int,
constraint b_pk primary key (BID),
constraint b_fk foreign key (PID) references publisher (PID)
);
create table author
(AID int,
Auth_firstname varchar(20),
Auth_lastname varchar(20),
Auth_address varchar(100),
constraint a_pk primary key (AID)
);
create table book_author_junction
(BID int,
AID int,
constraint ba_pk primary key (BID, AID),
constraint ba_fk foreign key (BID) references books (BID),
constraint ba_fk2 foreign key (AID) references author (AID)
);
insert into publisher (PID, pubname, email, phone, address)
values ('1', "Ram", "ram@gmail.com", 25865, "Street 5"),
('2', "Mohan", "mohan@gmail.com", 65895, "Street 6");
