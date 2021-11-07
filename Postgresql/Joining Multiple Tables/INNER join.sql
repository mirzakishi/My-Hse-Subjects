------------------------------------------------------------------------------------------------------------------
-- In a relation database, data is typically distributed in more than one table.
-- To select complete data, you often need to query data from multiple tables.
SELECT
	c.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p
    ON c.customer_id = p.customer_id
where c.customer_id='416'
ORDER BY payment_date;
-- Note: Since both tables have the same customer_id column, we can use the USING syntax:
SELECT
	customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment USING(customer_id)
ORDER BY payment_date;

-- Using PostgreSQL INNER JOIN to join three tables
SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer c
INNER JOIN payment p
    ON p.customer_id = c.customer_id
INNER JOIN staff s
    ON p.staff_id = s.staff_id
ORDER BY payment_date;
-------------------------------------------------------------------------------------------------------------------


