-----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use the PostgreSQL
-- EXISTS operator to test for existence of rows in a subquery.

-- The EXISTS accepts an argument which is a subquery.
-- If the subquery returns at least one row, the result of EXISTS is true. In case the subquery returns no row,
-- the result is of EXISTS is false.

-- Find customers who have at least one payment whose amount is greater than 11
SELECT first_name,
       last_name
FROM customer c
WHERE EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;

-- Note: In this example, for each customer in the customer table, the subquery checks the payment table to find if that
-- customer made at least one payment (p.customer_id = c.customer_id) and the amount is greater than 11 ( amount > 11)

-- B) NOT EXISTS example
-- The NOT operator negates the result of the EXISTS operator. The NOT EXISTS is opposite to EXISTS. It means that
-- if the subquery returns no row, the NOT EXISTS returns true.

-- The following example returns customers have not made any payment that greater than 11.
SELECT first_name,
       last_name
FROM customer c
WHERE NOT EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;


-- C) EXISTS and NULL
-- If the subquery returns NULL, EXISTS returns true. See the following example:
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS( SELECT NULL )
ORDER BY
	first_name,
	last_name;
-- In this example, the subquery returned NULL, therefore, the query returned all rows from the customer table.