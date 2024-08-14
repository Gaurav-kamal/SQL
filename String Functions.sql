create database assignment_3;
use assignment_3;

create table worker(
	worker_id int not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    salary int not null,
    joining_date datetime not null,
    department varchar(50),
    primary key(worker_id)
    );
select * from worker;

insert into worker(first_name, last_name, salary, joining_date, department)
values('Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
('Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
('Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Adim');

create table bonus(
	worker_ref_id int not null,
    bonus_date datetime not null,
    bonus_amount int not null,
    foreign key(worker_ref_id) references worker(worker_id)
    );
select * from bonus;

insert into bonus(worker_ref_id, bonus_date, bonus_amount)
values(1, '2023-02-20 00:00:00', 5000),
(2,'2023-06-11 00:00:00', 3000),
(3, '2023-02-20 00:00:00', 4000),
(1, '2023-02-20 00:00:00', 4500),
(2, '2023-06-11 00:00:00', 3500);

create table title(
	worker_ref_id int not null,
    worker_title varchar(50) not null,
    affected_from datetime,
    foreign key(worker_ref_id) references worker(worker_id)
    );
select * from title;

insert into title(worker_ref_id, worker_title, affected_from)
values(1, 'Manager', '2023-02-20 00:00:00'),
(2, 'Executive', '2023-06-11 00:00:00'),
(8, 'Executive', '2023-06-11 00:00:00'),
(5, 'Manager', '2023-06-11 00:00:00');

/* QUESTIONS */

/* Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>. */
select first_name as WORKER_NAME from worker;

/* Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case. */
select ucase(first_name) as WORKER_NAME from worker;

/* Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table. */
select distinct department from worker;

/* Q-4. Write an SQL query to print the first three characters of FIRST_NAME from the Worker table. */
select substr(first_name,1,3) as FIRST_NAME from worker;

/* Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table. */
select instr(first_name, 'a') as 'POSITION' from worker where first_name = 'Amitabh';

/* Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side. */
select rtrim(first_name) as Cleaned_First_Name from worker;

/* Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side. */
select ltrim(department) as Cleaned_Department from worker;

/* Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length. */
select count(distinct department) as Department_Count from worker;

/* Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’. */
select replace(first_name, 'a', 'A') as Modified_First_Name from worker;

/* Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them. */
select concat(first_name, ' ', last_name) as Complete_Name from worker;

/* Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending. */
select * from worker order by first_name asc;

/* Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. */
select * from worker order by first_name asc, department desc;

/* Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. */
select * from worker where first_name in ('Vipul', 'Satish');

/* Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table. */
select * from worker where first_name not in ('Vipul', 'Satish');

/* Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. */
select * from worker where department = 'Admin';

/* Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. */
select * from worker where first_name like '%a%';

/* Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’. */
select * from worker where first_name like '%a';

/* Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. */
select * from worker where length(first_name) = 6 and first_name like '%h';

/* Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000. */
select * from worker where salary between 100000 and 500000;

/* Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021. */
select first_name from worker where joining_date between '2021-02-01' and '2021-02-28';

/* Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’. */
select count(*) as 'Total Employees' from worker where department = 'Admin';
