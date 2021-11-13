-----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use the
-- PostgreSQL subquery that allows you to construct complex queries.

-- Select films wherer rental_rate > AVG(rental_rate)
select
    film_id,
    title,
    rental_rate
from
    film
where
    rental_rate > (
        select
            avg(rental_rate)
        from
            film
        );

-- Note: PostgreSQL executes the query that contains a subquery in the following sequence:
-- 1. First, executes the subquery.
-- 2. Second, gets the result and passes it to the outer query.
-- 3. Third, executes the outer query.

-- PostgreSQL subquery with IN operator
SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (
		SELECT
			inventory.film_id
		FROM
			rental
		INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
		WHERE
			return_date BETWEEN '2005-05-29'
		AND '2005-05-30'
	);

-- PostgreSQL subquery with EXISTS operator
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			1
		FROM
			payment
		WHERE
			payment.customer_id = customer.customer_id
	);
-----------------------------------------------------------------------------------------------------------------------

