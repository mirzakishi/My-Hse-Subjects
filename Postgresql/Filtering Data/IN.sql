-----------------------------------------------------------------------------------------------------------------
--Suppose you want to know the rental information of customer id 1 and 2,
--you can use the IN operator in the WHERE clause as follows:
SELECT customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id IN (1, 2)
ORDER BY
	return_date DESC;

-- The following query uses the equal (=) and OR operators instead of the IN operator.
-- It is equivalent to the query above:
SELECT
	rental_id,
	customer_id,
	return_date
FROM
	rental
WHERE
	customer_id = 1 OR customer_id = 2
ORDER BY
	return_date DESC;

-- We can combine the IN operator with the NOT operator to select rows whose values do not match the values in the list.
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id NOT IN (1, 2);

-- Similar to the IN operator, you can use the not equal (<>) and AND operators to write the NOT IN operator:
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id <> 1 AND customer_id <> 2;

-- PostgreSQL IN with a subquery
SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;

-- Note: Because this query returns a list of values, you can use it as the input of the IN operator like this:
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;
-----------------------------------------------------------------------------------------------------------------------


