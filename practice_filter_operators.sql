--Find all business types with more than 10 employees (n_employees). Output all columns.
SELECT * FROM google_adwords_earnings
WHERE n_employees > 10;

--Write a query that selects all columns from the table "Company", where the value of the column "ID_comp" is '5'. (Write operators in capital letters)
SELECT *
FROM Company
WHERE ID_comp = 5;

--Print a list of all trips (trip) with a departure date (time_out) after 2022.
SELECT *
FROM Trip
WHERE time_out > '2022-01-01 00:00:00';

--Find all flights made by the company with ID=3
SELECT *
FROM Trip
WHERE ID_comp = '3';

--Output the model and cost of all PCs with a price less than $900.
SELECT model, price
FROM PC
WHERE price < 900.00;

--Find all laptop models with at least 64 GB of RAM. The fields in the resulting table are model, ram.
SELECT model, ram
FROM Laptop
WHERE ram >= 64;

--Print a list of all computers with a CD-ROM drive speed of 40+.
SELECT *
FROM PC
WHERE CD >= '40x';

--Output all revenue records for a specific point of sale point = 3
SELECT *
FROM Income
WHERE point = 3;

--Find all posts with the keyword that contain the substring "nba".
SELECT *
FROM facebook_posts
WHERE post_keywords LIKE '%nba%';

--Find drafts that contain the word "optimism" (optimism).
SELECT * 
FROM google_file_store
WHERE contents LIKE '%optimism%';

--Display all information about passengers whose names begin with the letter "A".
SELECT *
FROM Passenger
WHERE name LIKE 'A%';

--Find all passengers who have the letter "r" in their name.
SELECT *
FROM Passenger
WHERE name LIKE '%r%';

--Write a query that outputs a list of all ships whose class starts with 'R'. The result is 2 columns name , class.
SELECT name, class
FROM Ships
WHERE class LIKE 'R%';

--Find the grievance ID for processed Type 1 grievances.
SELECT complaint_id
FROM facebook_complaints
WHERE type = 1 AND processed = 1;

--Find all posts that reference user 2 or 3.
SELECT *
FROM facebook_messages_sent
WHERE text LIKE '%2%' OR text LIKE'%3%';

--Find admins that have odd employee IDs.
SELECT *
FROM worker
WHERE department = 'Admin'
AND worker_id % 2 = 1;

--Find employees who have a salary of more than 100000 and have even employee numbers.
SELECT *
FROM worker
WHERE salary > 100000
AND worker_id % 2 = 0;

--Find all flights departing from Rostov and arriving in Moscow:
SELECT *
FROM Trip
WHERE town_from = 'Rostov'
AND town_to = 'Moscow';

--Find all laptop models with at least 8 GB of RAM and a price of less than 1000 dollars. In the answer, write 3 columns model, ram, price.
SELECT model, ram, price 
FROM Laptop
WHERE ram >= 8
AND price <= 1000.00;

--Find all PC models with a hard disk capacity of at least 10TB and a price of less than $1500. In your answer, enter 3 columns model, hd, price.
SELECT model, hd, price
FROM PC
WHERE hd >= 10.0
AND price < 1500.00;

--Find all printer models that are Laser type and have a price less than $500. In the answer, enter 3 columns model, type, price
SELECT model, type, price
FROM Printer
WHERE type = 'Laser'
AND price < 500.00;

--Find all laptop models with a screen size of at least 12 inches and a price of less than $1000. In the answer, write 3 columns model, screen, price.
SELECT model, screen, price
FROM Laptop
WHERE screen >= 12
AND price < 1000.00;

--Find all printer models that have color printing and a price less than $700. In the answer, enter 3 columns model , color, price.
SELECT model, color, price
FROM Printer
WHERE color = 'y'
AND price < 700.00;

/*Find all computer models that have a processor speed greater than 600, 
RAM strictly greater than 64 GB, and a hard disk greater than 10 TB. In your answer, write 4 columns model, speed, ram, hd*/
SELECT model, speed, ram, hd
FROM PC
WHERE speed > 600 AND ram > 64 AND hd > 10;

--Find SAT scores for students whose school names do not end in "HS".
SELECt *
FROM sat_scores
WHERE school NOT LIKE '%HS';

--Find information about employees who do not have first names 'Vipul' or 'Satish' and whose last name does not contain the letter 'c'.
SELECT *
FROM worker
WHERE first_name NOT IN ('Vipul', 'Satish')
AND last_name NOT LIKE '%c%';

--Find all flights departing from "Moscow" between January 1, 2022 and December 31, 2023.
SELECT *
FROM Trip
WHERE town_from = 'Moscow' 
AND time_out BETWEEN '2022-01-01 00:00:00' AND '2023-12-31 23:59:59'; 

--Output all income records for the year 2001.
SELECT *
FROM Income
WHERE dates LIKE '2001%';

--Find all product models that were manufactured by companies "A" and "B"
SELECT model, maker
FROM Product
WHERE maker IN ('A','B');

--Bring up users who speak German, French or Spanish?
SELECT user_id
FROM playbook_users
WHERE language IN ('german', 'french', 'spanish');

/*Write a query to select all records from the table "facebook_user_interactions" 
where either the "user1" field is 4 or the "user2" field is 4, and the value of the "day" field is between 0 and 2.*/
SELECT *
FROM facebook_user_interactions
WHERE day BETWEEN 0 AND 2
AND user1 = 4 OR user2 = 4;



