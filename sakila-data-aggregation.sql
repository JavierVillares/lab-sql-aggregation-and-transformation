USE sakila;

SHOW tables;

SELECT MAX(length)  AS max_duration
FROM film;

SELECT MIN(length)  AS min_duration
FROM film;

SELECT AVG(length) AS avg_duration;

SELECT MIN(length) AS min_duration,
       MAX(length) AS max_duration
FROM film;

SELECT 
    CONCAT(FLOOR(AVG(length) / 60), ' hours ', AVG(length) % 60, ' minutes') AS avg_duration
FROM film;


SELECT
rental_date,
return_date,
DATEDIFF(return_date, rental_date) AS days_rented
FROM rental;

SELECT 
    MONTHNAME(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT
    DAYNAME(rental_date) AS weekend,
    DAYNAME(rental_date) AS workday
FROM rental;

SELECT 
    title,
    IFNULL(rental_duration, 2) AS 'Not Available'
FROM film
ORDER BY title ASC;


SELECT
	COUNT(DISTINCT film_id)
FROM film;

SELECT 
    rating,
    COUNT(*) AS number_of_films
FROM film
GROUP BY rating;

SELECT 
    rating,
    COUNT(*) AS number_of_films
FROM film
GROUP BY rating
ORDER BY number_of_films DESC;



SELECT 
    rating,
    AVG(length) AS average_length,
    COUNT(*) AS number_of_films
FROM film
GROUP BY rating
HAVING average_length > 120
ORDER BY number_of_films DESC;