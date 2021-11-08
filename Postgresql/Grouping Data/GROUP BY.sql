--------------------------------------------------------------------------------------------------------------------
-- Summary: The GROUP BY clause divides the rows returned from the SELECT statement into groups.
-- For each group, you can apply an aggregate function e.g.,
-- SUM() to calculate the sum of items or COUNT() to get the number of items in the groups.
-- Using PostgreSQL GROUP BY without an aggregate function.
SELECT
   customer_id
FROM
   payment
GROUP BY
   customer_id;
-- Note: In this case  the GROUP BY works like the DISTINCT clause that removes duplicate rows from the result set.

-- Using PostgreSQL GROUP BY with SUM() function;
select
    customer_id,
    sum(amount)
from
    payment
group by
    customer_id;

-- The following statement uses the ORDER BY clause with GROUP BY clause to sort the groups:
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
ORDER BY
	SUM (amount) DESC;

-- Using PostgreSQL GROUP BY clause with the JOIN clause
SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)
GROUP BY
	full_name
ORDER BY amount DESC;

-- Using PostgreSQL GROUP BY with COUNT() function
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;

-- Using PostgreSQL GROUP BY with multiple columns
SELECT
	customer_id,
	staff_id,
	SUM(amount) as sum
FROM
	payment
GROUP BY
	staff_id,
	customer_id
ORDER BY
    customer_id;

-- Using PostgreSQL GROUP BY clause with date column
SELECT
	DATE(payment_date) paid_date,
	SUM(amount) sum
FROM
	payment
GROUP BY
	DATE(payment_date);
-----------------------------------------------------------------------------------------------------------------------