--Print a list of all companies (company) that have trips to the city "London" and the number of such trips.
SELECT c.ID_comp, c.name,
COUNT(t.trip_no) AS trip_count
FROM Company c
JOIN Trip t
ON c.ID_comp = t.ID_comp
WHERE t.town_to = 'London'
GROUP BY c.ID_comp;

--Print a list of all trips in descending order of the number of passengers.
SELECT t.trip_no, t.ID_comp, t.plane, t.town_from,
t.town_to, t.time_out, t.time_in, COUNT(p.ID_psg) AS passenger_count
FROM Trip t
JOIN Pass_in_trip p
ON t.trip_no = p.trip_no
GROUP BY t.trip_no
ORDER BY COUNT(p.ID_psg) DESC;

--Find all flights that had passengers with the name "Kurt" on them.
SELECT *
FROM Passenger p
JOIN Pass_in_trip pt
ON p.ID_psg = pt.ID_psg
JOIN Trip t
ON pt.trip_no = t.trip_no
WHERE name LIKE 'Kurt%';

--Find the number of flights departed from the city "Moscow"
SELECT COUNT(*)
FROM Trip
WHERE town_from = 'Moscow';

--Output all revenue and expense records for the period '2001-04-01' to '2001-04-15' for point of sale #2.
SELECT codes , point , dates FROM Income
WHERE point = 2 AND dates BETWEEN '2001-04-01' AND '2001-04-15'
UNION 
SELECT codes , point , dates FROM Outcome
WHERE point = 2 AND dates BETWEEN '2001-04-01' AND '2001-04-15';

--Output all rows with odd id_man from employees table
SELECT *
FROM employees
WHERE id_man % 2 != 0;

--Print the rows from the analysis table that have a retail price between 200 and 300 (left and right inclusive).
SELECT *
FROM analysis
WHERE selling_price BETWEEN 200 AND 300;

--Output all income records for each day c 01-01-2001 through 01-05-2001 (not including the 1st day.).
SELECT dates, SUM(inc)
AS income 
FROM Income
WHERE dates BETWEEN '2001-01-01' AND '2001-05-1'
GROUP BY dates;

--Output the average revenue for each point of sale for the period from '2001-01-01' to '2001-04-30' .
SELECT point, AVG(inc) AS avg_income
FROM Income
WHERE dates BETWEEN '2001-01-01' AND '2001-04-30'
GROUP BY point;

--Print unique id_type from the analysis table for which the retail price is between 200 and 300 (left and right inclusive).
SELECT DISTINCT(id_type)
FROM analysis
WHERE selling_price BETWEEN 200 AND 300;

--Output all revenue records for sales point #1 where the revenue for the day was less than 5000 or greater than 10000.
SELECT *
FROM Income
WHERE inc > 10000 OR inc < 5000 AND point = 1;

/*For each platform (e.g. Windows, iPhone, iPad, etc.), count the number of users. 
Count unique users, not individual sessions. Print the name of the platform with the corresponding number of users.*/
SELECT platform, COUNT(DISTINCT(user_id))
AS number_of_users
FROM user_sessions
GROUP BY platform;

--Count the number of user events performed by MacBookPro users. Print the result along with the event name. Sort the result by the number of events in descending order.
SELECT COUNT(id) AS event_count, event_name
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY COUNT(event_type) DESC;

--Output all rows from the analysis table for which the retail price is greater than 150 and less than 1000, sorting them in descending order of retail price.
SELECT *
FROM analysis
WHERE cost_price BETWEEN 150 AND 999
ORDER BY cost_price DESC;

--There are 2 tables Persons (Employees) and Positions (positions). Write a query to combine the two tables into one.
SELECT pr.id_persons, pr.name,
ps.title AS pos_title
FROM persons pr
JOIN positions ps
ON pr.pos_id = ps.id_positions;

--Find all PC models with a hard drive capacity of at least 10TB and a price under $1,500.
SELECT model, hd, price
FROM PC
WHERE hd >= 10.0 AND price < 1500;

--Find all the product models that were manufactured by company "A".
SELECT model, maker
FROM Product
WHERE maker = 'A';

--Find all laptop models with a screen size of at least 12 inches and a price under $1,000.
SELECT model, screen, price
FROM Laptop
WHERE screen >= 12 AND price < 1000;

--Find all PC models with a price under $900.
SELECT model, price
FROM PC
WHERE price < 900;

--Find the number of views for each post. Print the post identifier along with the number of views. Arrange the records by post ID in ascending order.
SELECT post_id, COUNT(viewer_id) AS view_count
FROM facebook_post_views
GROUP BY post_id
ORDER BY post_id ASC;

--Find all actions that occurred more than once on the blog.
SELECT action, COUNT(*) AS occurrence_count
FROM facebook_web_log
GROUP BY action
HAVING COUNT(action) > 1;

--Find the maximum step reached for each function. Print the identifier of the function along with its maximum step.
SELECT feature_id, 
MAX(step_reached) AS max_step
FROM facebook_product_features_realizations
GROUP BY feature_id;

--Find the total number of interactions on days 0 and 2. Print the result next to the day.
SELECT day, COUNT(*) AS total_interactions
FROM facebook_user_interactions
GROUP BY day
HAVING DAY IN (0, 2);

--Print all rows from the analysis table where id_type is not equal to 1.
SELECT *
FROM analysis
WHERE id_type != 1;

--Find all records with words beginning with the letter "g". Output words1 and words2 if any of them satisfies the condition.
SELECT *
FROM google_word_lists
WHERE words1 LIKE 'g%' OR words2 LIKE 'g%'

--Write a query that outputs a list of all ship classes with the number of ships in each class.
SELECT c.class, COUNT(s.name) AS num_ships
FROM Classes c
LEFT JOIN Ships s
ON c.class = s.class
GROUP BY c.class;

--Write a query that outputs a list of all ships that were sunk in battles.(sunk)
SELECT s.name
FROM Ships s
JOIN Outcomes o
ON s.name = o.ship
WHERE o.result = 'sunk';

--Write a query that outputs a list of all battles in which ships of the 'Kong class were sunk
SELECT b.name
FROM Battles b
JOIN Outcomes o
ON b.name = o.battle
JOIN Ships s
ON o.ship = s.name
WHERE s.class = 'Kongo';

--Write a query that outputs a list of all ships whose class has more than 8 guns.
SELECT s.name
FROM Ships s
JOIN Classes c
ON s.class = c.class
WHERE c.numGuns > 8;

--Write a query that outputs a list of all battles fought by ships of the 'Tennessee' class
SELECT b.name
FROM Battles b
JOIN Outcomes o
ON b.name = o.battle
JOIN Ships s
ON o.ship = s.name
WHERE s.class = 'Tennessee';

--Write a query that outputs a list of all classes of ships that belong to Japan.
SELECT c.class
FROM Classes c
JOIN Ships s
ON c.class = s.class
WHERE c.country = 'Japan';

--Write a query that lists all battles in which at least one 'Kongo' class ship has participated.
SELECT b.name
FROM Battles b
JOIN Outcomes o
ON b.name = o.battle
JOIN Ships s
ON o.ship = s.name
WHERE s.class = 'Kongo';

--Write a query that outputs a list of all ships that have an onboard caliber greater than 14 inches.
SELECT s.name
FROM Ships s
JOIN Classes c
ON s.class = c.class
WHERE c.bore > 14;

--Write a query that outputs a list of all ships that have participated in more than one battle.
SELECT s.name, COUNT(o.battle) AS battles_count
FROM Ships s
JOIN Outcomes o
ON s.name = o.ship
GROUP BY s.name
HAVING COUNT(o.battle) > 1;

--Write a query that outputs a list of all ship classes that had more than 2 ships.
SELECT c.class, COUNT(s.name) AS ships_count
FROM Classes c
JOIN Ships s
ON c.class = s.class
GROUP BY class
HAVING COUNT(s.name) > 2;

--Write a query that outputs a list of all countries that have participated in battles, with the number of battles they have participated in.
SELECT c.country, COUNT(DISTINCT(o.battle)) AS battles_count
FROM Classes c
JOIN Ships s
ON c.class = s.class
JOIN Outcomes o
ON s.name = o.ship
GROUP BY c.country;

--Write a query that outputs a list of all battles in which more than 2 ships participated.
SELECT battle, COUNT(ship) AS ship_count
FROM Outcomes
GROUP BY battle
HAVING COUNT(ship) > 2;

--Write a query that outputs a list of all ships built in the United States that have at least 10 guns.
SELECT s.name
FROM Ships s
JOIN Classes c
ON s.class = c.class
WHERE c.country = 'USA' AND numGuns >= 10;

--Find all emails with duplicates.
SELECT email, COUNT(email) AS duplicate_count
FROM employee
WHERE email LIKE '%@%.%'
GROUP BY email
HAVING COUNT(email) > 1;

--Count the number of users who performed more than 5 search queries in August 2021.
SELECT COUNT(DISTINCT(user_id))
AS user_count
FROM fb_searches f
WHERE date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY user_id
HAVING COUNT(DISTINCT(search_id)) > 5;

--How many searches were there in the second quarter of 2021? You need to output the number of searches along with the search_count alias.
SELECT COUNT(search_query)
AS search_count
FROM fb_searches
WHERE date BETWEEN '2021-04-01' AND '2021-06-30';

--What percentage of all products are non-fat and recyclable? The field in the result table is percentage.
SELECT (SELECT 100 * COUNT(*)
        FROM facebook_products
        WHERE is_low_fat = 'Y' AND is_recyclable = 'Y') / COUNT(product_id)
        AS percentage
        FROM facebook_products;

--Make a SQL query to select all shipments to Moscow with cargo over 2 tons.
SELECT *
FROM transport
WHERE `Пункт назначения` = 'Москва' 
AND `Масса груза, тонна` > 2.00;

--Output all rows from the analysis table, sorted by ascending category and descending purchase price within each category.
SELECT *
FROM analysis
ORDER BY id_cat_an ASC, cost_price DESC;

--Find the total AdWords revenue for each business type. Print the business types along with the total revenue.
SELECT business_type, SUM(adwords_earnings) 
AS total_earnings
FROM google_adwords_earnings
GROUP BY business_type

--Take clients out of the clients table older than 1991.
SELECT *
FROM clients
WHERE birthday < '1991-1-1';

