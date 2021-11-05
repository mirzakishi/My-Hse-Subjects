----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use PostgreSQL WHERE clause to
-- filter rows returned by a SELECT statement.
-- If you use column aliases in the SELECT clause, you cannot use them in the WHERE clause.

-- Using WHERE clause with the equal (=) operator example
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie';

-- Using WHERE clause with the AND operator example
SELECT
    first_name,
    last_name
from
    customer
where
    first_name='Jamie'
    and
    last_name='Rice';
-- Using the WHERE clause with the OR operator example
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	last_name = 'Rodriguez' OR
	first_name = 'Adam';

-- If you want to match a string with any string in a list, you can use the IN operator.
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name IN ('Ann','Anne','Annie');

-- To find a string that matches a specified pattern, you use the LIKE operator.
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE 'Ann%'

-- The following example finds customers whose first names start with the letter A and contains
-- 3 to 5 characters by using the BETWEEN operator.
select
    first_name,
    length(first_name) as name_length
from
    customer
where
    first_name like 'A%' and
    length(first_name) between 3 and 5
order by name_length asc

-- Using the WHERE clause with the not equal operator (<>)
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE 'Bra%' AND
	last_name <> 'Motley';
----------------------------------------------------------------------------------------------------------------------

