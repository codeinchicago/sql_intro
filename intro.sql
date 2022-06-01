--Question 1: How many actors are there with the last name "Wahlberg"?

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

--Answer: 2.

--Question 2: How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--Answer: 5,607.

--Question 3: What film does the store have the most of?

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY count(film_id) DESC;
--Film 193, CROSSROADS CASUALTIES

--Answer: "Crossroads Casualties", 8 copies.

--Question 4: How many customers have the last name 'William'?

SELECT *
FROM customer
WHERE last_name  = 'William';

--Answer: 0.

--Question 5: What store employee (get the id) sold the most rentals?

SELECT count(staff_id)
FROM rental
WHERE staff_id = '1';
--8040 for staff_id = 1
SELECT count(staff_id)
FROM rental
WHERE staff_id = '2';
--8004 for staff_id =2

SELECT *
FROM staff;
--Mike Hillyer is staff_id 1.

--Answer: Mike Hillyer sold the most rentals.

--Question 6: How many different district names are there?

SELECT count(DISTINCT district) 
FROM address;

--Answer: 378.

--Question 7: What film has the most actors in it?

SELECT film_id, count(film_id) 
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--Answer: "Lambs Cincinatti", 15 actors.

--Question 8: From store_id 1, how many customers have a last 
--name ending with 'es'?

SELECT count(store_id) 
FROM customer
WHERE last_name LIKE '%es' AND store_id = '1';

--Answer:13.

--Question 9: How many payment amounts had over 250 rentals w/
--customer ids b/w 380 and 430?

SELECT amount, count(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(amount) > 250;
--ORDER BY count(amount) DESC;

--Answer: Three. 2.99, 4.99, and 0.99.

--Question 10: Within the film table, how many rating categories are there?
--What rating has the most movies total?

SELECT count(DISTINCT rating)
FROM film;
--Five ratings.

SELECT rating, count(rating)
FROM film
GROUP BY rating
ORDER BY count(rating) DESC;
--PG-13

--Answer: There are five rating categories, and PG-13 is the most common rating, at 223 films.