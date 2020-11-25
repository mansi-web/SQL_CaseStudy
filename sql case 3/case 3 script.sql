create database case_3;
create table transactionmaster
(keyy int,
Branch_Number int,
Customer_Number int,
Product_Number int,
Invoice_Number int,
Service_Date char(10),
Invoice_Date char(10),
Sales_Amount int,
Contracted_Hours int,
Sales_Period varchar(3),
Sales_Rep int
);
/*2.1*/
select avg(Sales_Amount) as average
from transactionmaster
where (Product_Number= 30300
and Sales_Period= "P03");
/*2.2*/
select keyy, Sales_Amount as max_sale_amt
from transactionmaster
order by Sales_Amount desc
limit 1;
/*2.3*/
select Product_Number, count(keyy) as no_of_transactions
from transactionmaster
group by product_number 
order by Product_Number desc;
/*2.4*/
select count(keyy) from transactionmaster
where Sales_Period in ("P01", "P02");
/*2.5*/
select count(keyy) as no_of_rows
from transactionmaster;
/*2.6*/
select Price as cheapest
from pricemaster
order by Price asc
limit 1;
/*3.1*/
select Employee_Number , Employee_Status
from employee_master
where Employee_Status like "A";
/*3.2*/
select Employee_Number , Job_Title
from employee_master
where Job_Title like "teamlead 1";
/*3.3*/
select Last_Name, Employee_Status, Job_Title
from employee_master
where First_Name like "_o%";
/*3.4*/
select Last_Name, Employee_Status, Job_Title
from employee_master
where (First_Name like "a%" and First_Name not like "%i%");
/*3.5*/
select first_name ,Last_Name
from employee_master
where Employee_Status like ("I")
and Job_Code not in ("SR2", "SR3");
/*3.6*/
select * from employee_master
where( Last_Name like "%n"
and First_Name not in (select First_Name from employee_master
where First_Name regexp "^[a,d]") );
/*3.7*/
select Product_Number, Product_Description
from productmaster
where Product_Description like "%maintenance%";
/*4.1*/
alter table employee_master
add column newhire_date date;
update employee_master set newhire_date= str_to_date(left(Hire_date,10),'%Y-%m-%d');
select employee_number, newhire_date
from employee_master
where newhire_date< "2000-01-01";
/*4.2*/
alter table employee_master
add column lastw_date date;
update employee_master set lastw_date= str_to_date(left(last_date_worked,10),'%Y-%m-%d');
select Employee_Number, Round((datediff(lastw_date,newhire_date))/365.25,2) as years
from employee_master
where lastw_date not like "0000-00-00";
/*4.3*/
alter table transactionmaster
add column newinvoice_date date;
update transactionmaster set newinvoice_date= str_to_date(left(invoice_date, 10), '%Y-%m-%d');
select keyy, dayname(newinvoice_date) as day_of_transaction
from transactionmaster
where dayname(newinvoice_date) in ( "Wednesday" or "Sarurday") ;
/*4.4*/
select Employee_Number
from employee_master
where lastw_date= "0000-00-00";
/*5.1*/
select FirstOfCity, count(customer_number) as no_of_cust_from_each_city, FirstOfState, count(Customer_Number) as state
from customermaster
group by FirstOfCity, FirstOfState;
/*5.2*/
select sales_period, avg(Sales_Amount)
from transactionmaster
group by Sales_Period;
/*5.3*/
select count(keyy), branch_number
from transactionmaster
where Branch_Number in (select branch_number, market
 from locationmaster
 group by market);
 /*5.4*/
 select count(keyy) as no_of_cust, avg(sales_amount) as avrg
 from transactionmaster
 where keyy in (select keyy, );
 /*5.5*/
 SELECT product_number, max(Sales_Amount) as MaxAmt,
min(Sales_Amount) as MinAmt
FROM transactionmaster
group by Product_number;
/*6.1*/
select FirstOfCustomer_Name, FirstOfCity, FirstOfState
from customermaster
group by Customer_Number
order by FirstOfCustomer_Name asc;
/*6.2*/
select FirstOfCustomer_Name, FirstOfCity, FirstOfState
from customermaster
group by Customer_Number
order by FirstOfCustomer_Name desc;
/*6.3*/
select product_number, sales_amount
from transactionmaster
where sales_amount >100.00
order by Sales_Amount desc;
/*7.1*/
select count(branch_number) as no_of_branches, region
from locationmaster
group by region;
/*7.2*/
select keyy, max(sales_amount), min(sales_amount)
from transactionmaster
group by Product_Number
having max(Sales_Amount)>390;
/*7.3*/
select Customer_Number, count(keyy) as no_of_orders
from transactionmaster
group by Customer_Number;
/*8.1*/
select first_name , newhire_date
from employee_master
where newhire_date between '2004-03-22' and '2004-04-21';
/*8.2*/
select first_name
from employee_master
where job_code in ("SR1", "SR2", "SR3") ;
/*8.3*/
select Invoice_date, Product_number, Branch_number
from transactionmaster
where Sales_Amount between "150" and "200";
/*8.4*/
select branch_number, market, region
from locationmaster
where market in ("Dallas", "denver", "tulsa", "canada");
/*10.1*/
select customer_number, FirstOfCity, FirstOfCustomer_Name, "", "" from customermaster
union
select customer_number, Product_Number, Invoice_Number, Invoice_Date, Sales_Amount from transactionmaster;
/*10.2*/
select customer_number, FirstOfCity, FirstOfCustomer_Name, "", "" from customermaster
union
select customer_number, Product_Number, Invoice_Number, Invoice_Date, Sales_Amount from transactionmaster
order by FirstOfCity desc;