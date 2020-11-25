create database cakesandfudge;
create table chef
(chefid int,
chefname varchar(20),
date_of_joining date,
experience_in_years varchar(2),
salary int,
constraint chef_pk primary key (chefid)
);
create table products
(productid int,
productname varchar(20),
category varchar(20),
constraint product_pk primary key (productid)
);
create table customers
(custID int auto_increment,
custname varchar(20),
custaddress varchar(100),
constraint cust_pk primary key (custID)
);
create table orders
(orderid int auto_increment,
deliverytype varchar(10),
productid int,
paymentmode varchar (10),
custid int,
constraint ord_pk primary key (orderid),
constraint ord_fk foreign key (custid) references customers (custid)
);
create table ingredients
(ingid int,
ing_name varchar(20),
ing_unit varchar (10),
shelf_location varchar(10),
constraint ing_pk primary key(ingid)
);
create table product_ingredient_junction
(ingid int,
productid int,
constraint PI_pk primary key (ingid, productid),
constraint PI_fk foreign key (ingid) references ingredients (ingid),
constraint PI_fk2 foreign key (productid) references products (productid)
);
create table order_products_junction
(orderid int,
productid int,
constraint OP_pk primary key (orderid, productid),
constraint OP_fk foreign key (orderid) references orders (orderid),
constraint OP_fk2 foreign key (productid) references products (productid)
);
