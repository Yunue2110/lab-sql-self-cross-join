USE sakila;

##Get all pairs of actors that worked together.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor ;

SELECT a1.actor_id , fi.film_id,
a2.actor_id 
FROM actor a1
JOIN film_actor fi 
ON a1.actor_id = fi.actor_id
JOIN film_actor fi2
ON fi.film_id = fi2.film_id
JOIN ACTOR a2 
ON a1.actor_id > a2.actor_id;

##Get all pairs of customers that have rented the same film more than 3 times.
SELECT * FROM rental;
SELECT *FROM inventory;

CREATE TEMPORARY TABLE client1 
SELECT r.customer_id , r.inventory_id , i.film_id , f.title
FROM rental r
JOIN inventory i 
ON r.inventory_id = i.inventory_id
JOIN film f
ON f.film_id= i.film_id;
SELECT* FROM client1;

CREATE TEMPORARY TABLE client2 
SELECT r.customer_id , r.inventory_id , i.film_id , f.title
FROM rental r
JOIN inventory i 
ON r.inventory_id = i.inventory_id
JOIN film f
ON f.film_id= i.film_id;
SELECT * FROM client2;

SELECT client1.customer_id , client2.customer_id , COUNT(*) AS the_same_film 
FROM client1 
JOIN client2 
ON client1.film_id = client2.film_id
WHERE client1.customer_id <> client2.customer_id
GROUP BY client1.customer_id , client2.customer_id
HAVING COUNT(*)> 3
ORDER BY client1.customer_id , client2.customer_id ;

##Get all possible pairs of actors and films.

SELECT a.actor_id , a.first_name , f.title
FROM actor AS a
CROSS JOIN film AS f
order by 1;


