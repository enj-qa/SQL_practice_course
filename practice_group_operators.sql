--Print a list of all trips (trip) to the city "Paris", sorted by departure time (time_out) in descending order.
SELECT *
FROM Trip
WHERE town_to = 'Paris'
ORDER BY time_out DESC;

--Write a query that outputs a list of all battles, ordered by date.
SELECT *
FROM Battles
ORDER BY battle_date ASC;

--Count the number of students taught by each teacher. Print the result along with the teacher's name.
SELECT teacher, COUNT(student_id)
AS StudentCount
FROM sat_scores
GROUP BY teacher;

--Find the number of employees in each department. Print the name of the department along with the corresponding number of employees.
SELECT department, COUNT(worker_id)
AS employee_count
FROM worker
GROUP BY department;

--For each video game player, find the last login date.
SELECT DISTINCT(player_id), MAX(login_date)
AS last_login_date
FROM players_logins
GROUP BY player_id;

--Given the education levels and wages of a group of individuals, find the average wage for each level of education.
SELECT education, AVG(salary)
AS average_salary
FROM google_salaries
GROUP BY education;

--You were asked to find the 5 most profitable products in terms of total revenue over time.
SELECT product_id,
SUM(cost_in_dollars * units_sold)
AS total_revenue
FROM online_orders
GROUP BY product_id
ORDER BY SUM(cost_in_dollars * units_sold) DESC
LIMIT 5;

--Count the number of speakers of each language. Sort the result by the number of speakers in descending order.
SELECT language, COUNT(user_id)
AS SpeakerCount 
FROM playbook_users
GROUP BY language
ORDER BY COUNT(user_id) DESC;

--Output the distribution of user activity by date. By distribution we mean the number of posts per day. The fields in the resulting table are day_of_month, post_count.
SELECT post_date
AS day_of_month, 
COUNT(post_id)
AS post_count
FROM facebook_posts
GROUP BY post_date;

--Count the number of speakers of each language.
SELECT language,
count(*)
FROM playbook_users
GROUP BY language;

--Find the numbers of flights that had more than 2 passengers:
SELECT trip_no
FROM Pass_in_trip
GROUP BY trip_no
HAVING COUNT(ID_psg) > 2;

--Find all passengers who have flown more than once.
SELECT ID_psg, COUNT(trip_no)
AS trips_count
FROM Pass_in_trip
GROUP BY ID_psg
HAVING COUNT(trip_no) > 1;

--Find companies that have at least 2 users who speak Chinese.
SELECT company_id
FROM playbook_users
WHERE language = 'Chinese'
GROUP BY company_id
HAVING COUNT(DISTINCT user_id) >= 2;

/*Write a query to return all customers (cust_id) that violate the constraints of the primary key in the customer dimension (dim_customer), i.e., those customers 
that are present in the customer dimension more than once*/
SELECT cust_id, 
COUNT(cust_id) AS count
FROM dim_customer
GROUP BY cust_id
HAVING COUNT(cust_id) > 1;

--Find the hour with the highest cost of gasoline. Suppose there is only 1 hour with the highest gasoline cost.
SELECT *
FROM weather_data
WHERE gasoline_cost = (SELECT MAX(gasoline_cost) 
                       FROM weather_data);

--Find the gender that made the most doctor visits. Print the gender along with the corresponding number of appointments.
SELECT gender, COUNT(*)
AS visit_count
FROM medical_appointments
WHERE gender = 'F';
