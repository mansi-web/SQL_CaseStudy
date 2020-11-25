create database office_stationary;
create table customers
(custID int,
custname varchar(50),
custcity varchar(20),
custstate varchar (20),
custphone char(11),
constraint cust_pk primary key (custID)
);
create table ordertable
(orderID int,
order_date date,
deliverytype varchar(10),
paymentmode varchar(10),
custID int,
constraint order_pk primary key (orderID),
constraint order_fk foreign key (custID) references customers (custID)
);
create table products
(PID int,
product_name varchar(20),
producttype varchar(20),
constraint p_pk primary key (PID)
);
create table suppliers
(SID int,
Supp_name varchar (20),
email varchar(50),
address_state varchar(15),
address_city varchar(20),
constraint s_pk primary key (SID)
);
create table suppliers_products_junction
(SID int,
PID int,
constraint SP_pk primary key (SID, PID),
constraint SP_fk foreign key (SID) references suppliers (SID),
constraint SP_fk2 foreign key (PID) references products (PID)
);
create table order_product_junction
(OID int,
PID int,
constraint OP_pk primary key (OID, PID),
constraint OP_fk foreign key (OID) references ordertable (orderID),
constraint OP_fk2 foreign key (PID) references products (PID)
);
