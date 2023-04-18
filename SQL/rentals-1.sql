-- Find the number of rentals for each category.
SELECT category.category_id,category.name,COUNT(rental.rental_id) FROM category
INNER JOIN film_category
ON category.category_id=film_category.category_id
INNER JOIN inventory
ON inventory.film_id=film_category.film_id
INNER JOIN rental
ON rental.inventory_id=inventory.inventory_id
GROUP BY category.category_id,category.name
ORDER BY COUNT(rental.rental_id) DESC

