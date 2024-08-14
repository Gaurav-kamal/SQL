create database assignment_4;
use assignment_4;

create table customer(
	customer_id int not null,
    cust_name varchar(50) not null,
    city varchar(50) not null,
    grade int,
    salesman_id int not null,
    primary key(customer_id)
    );

insert into customer(customer_id, cust_name, city, grade, salesman_id)
values(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Greem', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', null, 5005);
select * from customer;

create table salesman(
	salesman_id int not null,
    name varchar(50) not null,
    city varchar(50) not null,
    commission float not null,
    primary key(salesman_id)
    );

insert into salesman(salesman_id, name, city, commission)
values(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);
select * from salesman;

create table orders(
	ord_no int not null,
    purch_amt float not null,
    ord_date date not null,
    customer_id int not null,
    salesman_id int not null,
    primary key(ord_no)
    );

insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);
select * from orders;

/* QUESTIONS */

/* Q1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city. */
select s.name as 'Salesman', c.cust_name as 'Customer name', c.city as 'city' from salesman s inner join customer c on s.salesman_id = c.salesman_id where s.city = c.city;

/* Q2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city. */
select o.ord_no as 'Order no.', o.purch_amt as 'Purchase Amount', c.cust_name as 'Customer name', c.city as 'City' from orders o inner join customer c on o.customer_id = c.customer_id where o.purch_amt between 500 and 2000;

/* Q3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission. */
select c.cust_name as 'Customer Name', c.city as 'City', s.name as 'Salesman', s.commission from salesman s inner join customer c on s.salesman_id = c.salesman_id;

/* Q4. From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. */
select c.cust_name as 'Customer Name', c.city as 'Customer city', s.name, s.commission from salesman s inner join customer c on s.salesman_id = c.salesman_id where s.commission > 0.12;

/* Q5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the 
company. Return Customer Name, customer city, Salesman, salesman city, commission. */
select s.name as 'Salesman Name' from salesman s inner join customer c on s.salesman_id = c.salesman_id where s.city <> c.city and s.commission > 0.12;

/* Q6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. */
select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name as "Salesman", s.commission from orders o inner join customer c on o.salesman_id = c.salesman_id inner join salesman s on o.salesman_id = s.salesman_id;

/* Q7. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id. */
select c.customer_id, c.cust_name as "Customer Name", c.city, c.grade, s.name as "Salesman Name",s.city from customer c inner join salesman s on c.salesman_id = s.salesman_id order by c.customer_id asc;

/* Q8. From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity.
The result should be ordered by ascending customer_id. */
select c.cust_name as 'Customer', c.city as 'Customer City', c.grade as 'Grade', s.name as 'Salesman', s.city as 'Salesman city' from salesman s left join customer c on c.salesman_id = s.salesman_id where c.grade<300 order by c.grade;

/* Q9. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the 
existing customers have placed an order or not. */
select c.cust_name as 'Customer' from customer c left join orders o on c.salesman_id = o.salesman_id order by o.ord_date;

/* Q10. Write a SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers 
have not placed orders or if they have placed orders through their salesman or by themselves. */
select c.cust_name as 'Customer Name', c.city as 'City', o.ord_no as 'Order Number', o.ord_date as'Order Date', o.purch_amt as 'Order Amount', s.name as 'Salesman',s.commission as 'Commission' from customer c left join orders o on c.salesman_id = o.salesman_id left join salesman s on c.salesman_id = s.salesman_id;

/* ---Q11. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers. */
select s.name as 'Salesman Name', c.cust_name as 'Customer Name' from salesman s right join customer c on s.salesman_id = c.customer_id order by s.name;

/* ---Q12. From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. Condition for selecting list of salesmen :
1. Salesmen who works for one or more customer or,
2. Salesmen who not yet join under any customer, Condition for selecting list of customer : 
3. placed one or more orders, or 
4. no order placed to their salesman. */
select s.name as "Salesman_name", c.cust_name as "Customer Name", c.city as 'City', c.grade as 'Grade', o.ord_no as 'Order No.', o.ord_date as 'Order Date', o.purch_amt as "Amount" from customer c right join salesman s on c.salesman_id = s.salesman_id right join orders o on c.salesman_id = o.salesman_id;

/* Q13. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer, may have placed, either one or more orders on 
or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. */
select s.name as 'Salesman Name', c.cust_name as 'Customer Name', o.purch_amt from customer c right join salesman s on c.salesman_id = s.salesman_id left join orders o on c.salesman_id = o.salesman_id where o.purch_amt > 2000 and c.grade is not null;

/* ---Q14. For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, 
city, order number, order date, and purchase amount */
select c.cust_name as "Customer Name", c.city as 'City', o.ord_no as 'Order No.', o.ord_date as 'Order Date', o.purch_amt as 'Amount' from customer c left join orders o on c.salesman_id = o.salesman_id where o.ord_no is not null;

/* ---Q15. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or 
more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade. */
select c.cust_name as "Customer Name", c.city as 'City', o.ord_no as 'Order No.', o.ord_date as 'Order Date', o.purch_amt as 'Amount' from customer c left join orders o on c.salesman_id = o.salesman_id where c.grade is not null;

/* Q16. Write a SQL query to combine each row of the salesman table with each row of the customer table. */
select * from salesman cross join customer;

/* Q17. Write a SQL statement to create a Cartesian product between salesperson and customer,
i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city. */
select * from salesman cross join customer;

/* Q18. Write a SQL statement to create a Cartesian product between salesperson and customer,
i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade. */
select * from salesman s cross join customer c where s.city is not null and c.grade is not null;

/* Q19. Write an SQL statement to make a Cartesian product between salesman and customer i.e each salesman will appear for all customers and vice versa for those salesman who must belong to a 
city which is not the same as his customer and the customer should have their own grade. */
select * from salesman s cross join customer c where s.city <> c.city and c.grade is not null;