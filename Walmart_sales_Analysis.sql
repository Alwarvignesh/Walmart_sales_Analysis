create database walmart;
use walmart;
create table walmart_sales(
invoice_id varchar(30) not null primary key,
branch varchar(30) not null,
city varchar(30) not null,
customertype varchar(30) not null,
gender varchar(30) not null,
productline varchar(100) not null,
unitprice decimal(10,2) not null,
quantity int not null,
tax_per decimal(6,4) not null,
total decimal(12,4) not null,
da_te datetime not null,
tim_e time not null,
payment varchar(30) not null,
cogs decimal(15,10) not null,
grossmargin_per decimal(11,9) not null,
grossincome decimal(12,4) not null,
rating decimal(2,1)
);
drop table walmart_sales;
select * from walmart_sales;
select tim_e ,
(case when 'tim_e' between "00:00:00" and "12:00:00" then "Morning"
when 'tim_e' between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end) as time_of_delay from walmart_sales;
alter table walmart_sales add column time_of_delay varchar(30);
select * from walmart_sales;
update walmart_sales
set time_of_delay=(case 
when tim_e between "00:00:00" and "12:00:00" then "Morning"
when tim_e between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end);
select da_te ,dayname(da_te) from walmart_sales;
alter table walmart_sales add column day_name varchar(30);
update walmart_sales set day_name=dayname(da_te);
select * from walmart_sales;
select da_te,monthname(da_te) from walmart_sales;
alter table walmart_sales add column month_name varchar(30);
update walmart_sales set month_name=monthname(da_te);
select distinct city from walmart_sales;
select count(distinct city) as no_of_Uniquecity from walmart_sales;
select distinct branch,city from walmart_sales;
select count(distinct productline) from walmart_sales;
select payment,count(payment) as Max_use from walmart_sales group by payment order by Max_use desc;
select productline,count(productline) as Max_sales from walmart_sales group by productline order by Max_sales desc;
select month_name,sum(total) as Revenue from walmart_sales group by month_name order by Revenue desc;
select month_name,sum(cogs) as largest_cogs from walmart_sales group by month_name order by largest_cogs;
select * from walmart_sales;
select customertype,sum(total) as Revenue from walmart_sales group by customertype order by Revenue desc;
select customertype, avg(tax_per) as total_tax from walmart_sales group by customertype order by total_tax desc;
select distinct customertype from walmart_sales;
select gender,count(total) as No_customer from walmart_sales group by gender order by No_customer desc;
select branch,gender,count(*) as gen_dis from walmart_sales where branch="A" group by gender order by gen_dis;
select time_of_delay,avg(rating) as Average from walmart_sales group by time_of_delay order by Average desc;
select count(distinct payment) from walmart_sales;