-- Write a query to find the number of films in each rating category.
SELECT rating, COUNT(*) AS num_films
FROM films
GROUP BY rating;

-- Write a query to find the total length of films released in each year.
SELECT release_year, SUM(length) AS total_length
FROM films
GROUP BY release_year;

-- Write a query to find the actors who have appeared in the most films, 
-- sorted by the number of films in descending order.
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(*) AS num_films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY num_films DESC;

-- Write a query to find the films that were released in the year 2000 and have a rating of 'PG-13'.
SELECT *
FROM films
WHERE release_year = 2000 AND rating = 'PG-13';

-- Write a query to find the actors who have appeared in films released in the year 2005.
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN films ON film_actor.film_id = films.film_id
WHERE films.release_year = 2005;

-- Write a query to find the average length of films in each rating category.
SELECT rating, AVG(length) AS avg_length
FROM films
GROUP BY rating;

-- Write a query to find the actors who have appeared in films with a total length greater than 3 hours.
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN films ON film_actor.film_id = films.film_id
GROUP BY actor.actor_id
HAVING SUM(films.length) > 180;

-- Write a query to find the actors who have appeared in at least 5 films, sorted by last name in ascending order.
SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(*) AS num_films
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
HAVING COUNT(*) >= 5
ORDER BY actor.last_name ASC;

-- Write a query to find the films that were released on or after January 1st, 2000.
SELECT *
FROM films
WHERE release_year >= '2000-01-01';

-- Write a query to find the actors who have appeared in films released in the month of December.
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN films ON film_actor.film_id = films.film_id
WHERE EXTRACT(month FROM films.release_year) = 12;