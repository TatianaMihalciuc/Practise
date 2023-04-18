-- Find the number of rentals for each category.
SELECT category.category_id,category.name,COUNT(rental.rental_id) FROM category
INNER JOIN film_category
ON category.category_id=film_category.category_id
INNER JOIN inventory
ON inventory.film_id=film_category.film_id
INNER JOIN rental
ON rental.inventory_id=inventory.inventory_id
GROUP BY category.category_id,category.name
ORDER BY COUNT(rental.rental_id) DESC;

-- Find the average rental duration (in days) for each category.
SELECT AVG(film.rental_duration), film_category.category_id,category.name FROM film
INNER JOIN film_category
ON film.film_id=film_category.film_id
INNER JOIN category
ON category.category_id=film_category.category_id
GROUP BY film_category.category_id,category.name;

--Find the rental with the highest payment amount.
SELECT rental_id, SUM(amount) FROM payment
GROUP BY rental_id
ORDER BY SUM(amount) DESC
LIMIT 1;

--Find the number of rentals per month for the year 2005.
SELECT COUNT(rental_id), TO_CHAR(rental_date,'Month'), EXTRACT(year FROM rental_date)
FROM rental
WHERE EXTRACT(year FROM rental_date)=2005
GROUP BY TO_CHAR, EXTRACT(year FROM rental_date);

--Find the rental_ids for rentals that were returned by customers who have overdue rentals. Overdue is more than 9 days
SELECT customer_id, rental_date, return_date, return_date::DATE-rental_date::DATE AS rental_days 
FROM rental
WHERE (return_date::DATE - rental_date::DATE)>=9;

--Count the number of films per movie rating using CASE
SELECT 
SUM(CASE rating
  WHEN 'R' THEN 1
  ELSE 0
END) AS R,

SUM(CASE rating
  WHEN 'PG' THEN 1
  ELSE 0
END) AS PG,

SUM(CASE rating
  WHEN 'PG-13' THEN 1
  ELSE 0
END) AS PG13

FROM film;