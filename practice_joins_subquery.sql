--How many paid users called in April 2020?
SELECT COUNT(DISTINCT(user_id))
AS PaidUsersCalls
FROM rc_calls
WHERE date LIKE '2020-04%' AND 
user_id IN (SELECT DISTINCT(user_id) 
            FROM rc_users
            WHERE status = 'paid');

/*Find the details of the order placed by Jill and Eva.
Read Jill and Eva as the first names of the customers.
Print the order date, details and cost of the orders.
Record orders based on customer ID in ascending order.*/
SELECT order_date, order_details, total_order_cost
FROM orders
WHERE cust_id IN (SELECT id 
                 FROM customers 
                 WHERE first_name IN ('Jill', 'Eva'))
ORDER BY cust_id ASC;

--Find the date when Apple's initial stock price peaked
SELECT date
FROM aapl_historical_stock_price
WHERE open = (SELECT MAX(open) 
              FROM aapl_historical_stock_price);

--You need to get the total list of all students (StudentName), regardless of the department.
SELECT StudentName FROM students_math 
UNION
SELECT StudentName FROM students_physics;

/*you have three tables with information about sales in an online store. The first table (sales_online) contains information about online sales, the second table (sales_in_store) 
- is about sales in physical stores, and the third table (sales_affiliate) is about sales through partners.
Each table contains information about the products sold, including their product codes (ProductID) and sales amounts
(SaleAmount). You need to get the total sales amounts for each product (ProductID) from all three sales sources.
sales, as well as the total sales amount (GrandTotal) for each product across all sources.*/
 SELECT
    ProductID,
    SUM(SaleAmount) AS TotalSales
FROM (
    SELECT ProductID, SaleAmount FROM sales_online
    UNION ALL
    SELECT ProductID, SaleAmount FROM sales_in_store
    UNION ALL
    SELECT ProductID, SaleAmount FROM sales_affiliate
) AS combined_sales
GROUP BY ProductID;


--Find all posts that were responded to with a heart. For such posts print all columns from the facebook_posts table. Post_id key.
SELECT fb.post_id, fb.poster, fb.post_text, fb.post_keywords, fb.post_date
FROM facebook_posts fb
JOIN facebook_reactions fc
ON fb.post_id = fc.post_id
WHERE fc.reaction = 'heart';

--Find all employees whose job title includes manager. Print the name along with the corresponding title
SELECT w.worker_id, w.first_name, w.last_name, t.worker_title
FROM worker w
JOIN title t
ON w.worker_id = t.worker_ref_id
WHERE t.worker_title LIKE '%Manager%';

--List all trips with the names of the companies that organized them. Flights only 1100 and 1101.
SELECT t.trip_no, t.ID_comp, t.plane, t.town_from, 
t.town_to, t.time_out, t.time_in, c.name AS company_name
FROM Trip t
JOIN Company c
ON t.ID_comp = c.ID_comp
WHERE t.trip_no IN (1100, 1101);

--Print a list of all passengers (passenger) who flew on planes (plane) of IL company with the name "Aeroflot".
SELECT * 
FROM Passenger p
JOIN Pass_in_trip pt
ON p.ID_psg = pt.ID_psg
JOIN Trip t
ON pt.trip_no = t.trip_no 
JOIN Company c
ON t.ID_comp = c.ID_comp
WHERE t.plane LIKE '%IL%' AND c.name = 'Aeroflot';

--Print a list of all passengers and the number of trips they have taken.
SELECT p.ID_psg, p.name, COUNT(pt.ID_psg) AS trip_count
FROM Passenger p
JOIN Pass_in_trip pt
ON p.ID_psg = pt.ID_psg
GROUP BY p.ID_psg

--Print a list of all companies (company) and the number of trips (trip) they have organized.
SELECT c.ID_comp, c.name, 
COUNT(t.trip_no) AS trip_count
FROM Company c
JOIN Trip t
ON c.ID_comp = t.ID_comp
GROUP BY c.ID_comp;

--Print a list of all passengers (passenger) who rode on an airplane (plane) named "Boeing".
SELECT p.ID_psg, p.name
FROM Passenger p
JOIN Pass_in_trip pt
ON p.ID_psg = pt.ID_psg
JOIN Trip t
ON pt.trip_no = t.trip_no
WHERE t.plane = 'Boeing';

--Find details of each customer regardless of whether the customer has placed an order. Print the customer's first name, last name and city along with the order details.
SELECT c.first_name, c.last_name, c.city, o.order_details
FROM customers c
LEFT JOIN orders o
ON c.id = o.cust_id
ORDER BY c.first_name ASC, o.order_details ASC;

--Print a list of all passengers with the number of trips they have taken, including trips with no passengers.
SELECT p.ID_psg, p.name, 
COUNT(pt.trip_no) AS trip_count
FROM Passenger p
LEFT JOIN Pass_in_trip pt
ON p.ID_psg = pt.ID_psg
GROUP BY p.ID_psg;

--Write a SQL query using the RIGHT JOIN operation to retrieve information about guests who have not left reviews on the Airbnb platform.
SELECT * 
FROM airbnb_guests ag
RIGHT JOIN airbnb_reviews ar
ON ag.guest_id = ar.from_user
WHERE ag.guest_id IS NULL

--Write a SQL query using the RIGHT JOIN statement, to retrieve information about orders in Shopify, that do not have a corresponding entry in the carriers table (shopify_carriers).
SELECT *
FROM shopify_orders sr
RIGHT JOIN shopify_carriers sc
ON sr.carrier_id = sc.id
WHERE sr.order_id IS NULL;

--You need to write a SQL query that joins the "Books" and "Orders" tables using the CROSS JOIN operation.
SELECT *
FROM Books
CROSS JOIN Orders;

--You are given two tables: customers and orders, which contain information about customers and their orders.
SELECT *
FROM customers
CROSS JOIN orders;

--Write an SQL query that will perform the Cartesian product (direct product) of two tables: db_dept and db_employee.
SELECT *
FROM db_dept
CROSS JOIN db_employee;

--How many total orders have been shipped by Speedy Express?
SELECT count(*)
FROM shopify_orders sr
JOIN shopify_carriers sc
ON sr.carrier_id = sc.id
WHERE sc.name = 'Speedy Express'
GROUP BY sc.name;


