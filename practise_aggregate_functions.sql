--Write a query to find the earliest shipment date of a shipment. You need to output along with the min_shipment_date alias.
SELECT MIN(shipment_date) 
AS min_shipment_date
FROM amazon_shipment;

--Write a query that finds the lowest weight among all parcels in the amazon_shipment table. You need to output this lowest weight along with the min_weight alias.
SELECT MIN(weight) 
AS min_weight
FROM amazon_shipment;

--Find the number of employees working in the administrative department,  who joined after April 2014.
SELECT COUNT(first_name) AS count
FROM worker
WHERE department = 'Admin'
AND joining_date >= '2014-04-01'

--Find the number of flights departed from the city "Moscow":
SELECT COUNT(*)
FROM Trip
WHERE town_from = 'Moscow';

--Write a query to count the total number of unique accounts that logged in in 2016 using the "product_logins" table.
SELECT COUNT(DISTINCT(account_id))
AS total_logins
FROM product_logins
WHERE login_date LIKE '2016%';

--Find the total number of accepted friends on a given date. Suppose the date is January 2, 2019
SELECT COUNT(*) 
AS total_accepted_friends
FROM facebook_friendship_requests
WHERE date_approved = '2019-01-02';

--Find the number of relationships that the user with id == 1 is not a part of.
SELECT COUNT(*)
AS relationship_count
FROM facebook_friends
WHERE user1 != 1 AND user2 != 1;

--Output the maximum value among sales (inc). You need to output this maximum value along with the alias max_income.
SELECT MAX(inc)
AS max_income
FROM Income;

--Write a SQL query that finds the maximum salary among all employees in the ms_employee_salary table. Print this maximum salary along with the max_salary column name
SELECT MAX(salary)
AS max_salary
FROM ms_employee_salary;

--Output the average price of all laptops.
SELECT AVG(price)
FROM Laptop;

--Output the sum of all income for a specific day 2023-04-13.
SELECT SUM(inc)
FROM Income
WHERE dates = '2023-04-13 00:00:00';

--Find the total amount of money spent on Uber advertising in 2019. Output this amount.
SELECT SUM(money_spent)
FROM uber_advertising
WHERE year = 2019;

--