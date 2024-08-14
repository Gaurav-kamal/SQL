use window_function;
CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, SaleDate, CustomerID, ProductID, Amount) VALUES
(1, '2024-01-01', 101, 1001, 150.00),
(2, '2024-01-02', 102, 1002, 200.00),
(3, '2024-01-03', 101, 1001, 100.00),
(4, '2024-01-04', 103, 1003, 300.00),
(5, '2024-01-05', 102, 1002, 250.00),
(6, '2024-01-06', 101, 1001, 175.00),
(7, '2024-01-07', 104, 1004, 400.00),
(8, '2024-01-08', 105, 1005, 350.00),
(9, '2024-01-09', 102, 1002, 225.00),
(10, '2024-01-10', 101, 1001, 125.00);

select * from sales;

-- Question 1: Calculate the running total of sales amount.
select SaleID, CustomerID, Amount, sum(Amount) over(order by Amount) as total from sales;

-- Question 2: Calculate the average sales amount over the last 3 sales.
select SaleID, CustomerID, Amount, avg(Amount) over(order by CustomerID rows between 2 preceding and current row) as 'Average' from sales;

-- Question 3: Rank the sales by amount for each customer.
select SaleID, rank() over(order by Amount) as 'Rank' from sales;

-- Question 4: Calculate the cumulative distribution of sales amount.
select SaleID, CustomerID,Amount, cume_dist() over(order by Amount) as 'Cumulative Distribution' from sales;

-- Question 5: Calculate the difference in sales amount between the current sale and the previous sale.
select SaleID, SaleDate, Amount, Amount - lag(Amount) over(order by Amount) as 'Difference' from sales;
select SaleID, SaleDate, Amount, Amount - lag(Amount) over(order by SaleDate) as 'Difference' from sales;

-- Question 6: Calculate the lead sales amount for the next sale.
select SaleID, Amount, lead(Amount) over(order by Amount) as 'Lead Sales' from sales;

-- Question 7: Find the first sale amount for each customer.
select SaleID, SaleDate, CustomerID, Amount, first_value(Amount) over(partition by CustomerID order by SaleDate) as 'First Sale Amount' from sales;