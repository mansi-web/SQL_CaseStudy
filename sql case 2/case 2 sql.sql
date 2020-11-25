create database case2;
/*all items purchased for customer id 10449*/
select customerid, item, price from items_ordered
where customerid = "10449";
/*whosoever purchased a tent*/
select customerid from items_ordered
where item= "tent";
/*itme starting with  letter S*/
select customerid, order_date, item from items_ordered
where item like "S%";
/*unique items*/
/*max price of any item ordered*/
select max(price) from items_ordered;
/*average price of items ordered in december*/
alter table items_ordered add column dateoforder date;
update items_ordered set dateoforder = str_to_date(left (order_date, 10), '%d-%m-%Y');
select avg(price) from items_ordered
where month(dateoforder) = 12;
/*total number of orwn in items table*/
select count(customerid) from items_ordered;
/*lowest price of all tents ordered*/
select price from items_ordered
where price in (select min(price) from items_ordered
where item = "tent");
/*6.1*/
select customerid, order_date, item from items_ordered
where item not in (select item from items_ordered
where item = "snow shoes" and item = "ear muffs");
/*6.2*/
select item, price from items_ordered
where item like "s%" or item like "p%" or item like "f%";
/*7.1*/
select order_date, item , price from items_ordered
where price <80 and price>10;
/*7.2*/
select firstname, city, state from customers
where state="Arizona"or state ="Washington" or state= "oklahoma" or state= "coloroado" or state= "hawaii";
/*8*/
/*9*/ 