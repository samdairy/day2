SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

--Inner JOIN on the actor and film_Actor table
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- INNER JOIN on the actor, film_actor, and film table to see which actors are in what film
SELECT first_name, last_name, title --selecting columns from tables
FROM actor --table A
INNER JOIN film_actor --table B
ON actor.actor_id = film_actor.actor_id
INNER JOIN film --table c?
ON film_actor.film_id = film.film_id;

-- Join that will produce info about a customer
-- From the country of Angola
-- First Name, Last Name, Email, Country
SELECT first_name, last_name, email, country
FROM customer
INNER JOIN country
ON customer.customer_id = country.country_id
WHERE country = 'Angola';


SELECT first_name, last_name, email, country, city, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

SELECT *
FROM customer;

SELECT *
FROM address;

--Find a customer_id that has a payment amount greater than 175
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

SELECT store_id, first_name, last_name, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'United States' AND customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Subquery to find all films in english
--using the film table and language table
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM "language"
	WHERE "name" = 'English'
);

SELECT *
FROM "language";


-- Customers who live in dallas
SELECT first_name, last_name, address_id
FROM customer 
WHERE address_id IN (
	SELECT address_id
	FROM address
	WHERE city_id IN (
		SELECT city_id
		FROM city
		WHERE city = 'Dallas'
	)
);

SELECT *
FROM category;

--Subquery to grab all horror movies
SELECT title, film_id
FROM film
WHERE film_id IN (
	SELECT film_id
	FROM film_category
	WHERE category_id IN (
		SELECT category_id
		FROM category
		WHERE "name" = 'Horror'
	)
);	

SELECT district
FROM address;

--1. List all customers who live in Texas (use
--JOINs)
SELECT *
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id
WHERE district = 'Texas';
--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT *
FROM payment
INNER JOIN customer 
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;
--3. Show all customers names who have made payments over $175(use
--subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  GROUP BY customer_id
  HAVING SUM(amount)  > 175);
--4. List all customers that live in Nepal (use the city
--table)
SELECT *
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
		

--5. Which staff member had the most
transactions?
SELECT first_name, list_name
FROM staf
GROUP def next_bigger(n):
 





ORDER BY staf 
--6.How many movies of each rating are
there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;
--7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)
SELECT * 
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  GROUP BY customer_id
  HAVING SUM(amount) > 6.99)
--8.How many free rentals did stores give away?
SELECT store_id 
FROM store
WHERE store_id IN(
    SELECT store_id
	FROM store_rental
	WHERE rental_id IN (
	   SELECT rental_id
	   FROM rental
	   WHERE )
		
	
	
 
    

 