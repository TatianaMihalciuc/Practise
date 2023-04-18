-- Find the average rental duration (in days) for each category.
SELECT AVG(film.rental_duration), film_category.category_id,category.name FROM film
INNER JOIN film_category
ON film.film_id=film_category.film_id
INNER JOIN category
ON category.category_id=film_category.category_id
GROUP BY film_category.category_id,category.name
