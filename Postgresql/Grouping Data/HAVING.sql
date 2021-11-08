-----------------------------------------------------------------------------------------------------------------------
-- Summary: The HAVING clause specifies a search condition for a group or an aggregate.
-- The HAVING clause is often used with the GROUP BY clause to filter
-- groups or aggregates based on a specified condition.

-- Note: HAVING vs. WHERE
-- The WHERE clause allows you to filter rows based on a specified condition.
-- However, the HAVING clause allows you to filter groups of rows according to a specified condition.
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id;

-- The following statement adds the HAVING clause to select the only customers who have been spending more than 200:
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
HAVING
	SUM (amount) > 200;

-- PostgreSQL HAVING clause with COUNT
-- The following query uses the GROUP BY clause to find the number of customers per store:

SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id

-- The following statement adds the HAVING clause to select the store that has more than 300 customers:
SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id
HAVING
	COUNT (customer_id) > 300;
