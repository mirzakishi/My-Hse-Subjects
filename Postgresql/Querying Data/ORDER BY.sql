-----------------------------------------------------------------------------------------------------------------------
--Summary: in this tutorial, you will learn how to sort the result set returned from the SELECT statement
-- by using the PostgreSQL ORDER BY clause.

--The following query uses the ORDER BY clause to sort customers by their first names in ascending order:
select
    first_name,
    last_name
from
    customer
order by
    first_name asc

--Using PostgreSQL ORDER BY clause to sort rows by multiple columns
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;

--The following statement selects the first names and their lengths.
-- It sorts the rows by the lengths of the first names:
SELECT
	first_name,
	LENGTH(first_name) AS len
FROM
	customer
ORDER BY
	len DESC;

-- When you sort rows that contains NULL, you can specify the order of NULL with other non-null values by using
-- the NULLS FIRST or NULLS LAST option of the ORDER BY clause:
-- create a new table
CREATE TABLE sort_demo(
	num INT
);

-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);
-- The following query returns data from the sort_demo table:(By default or asc statement 'null' is coming at the end)
SELECT num
FROM sort_demo
ORDER BY num asc;

-- Делаем так, что 'null' появилось на первом строке
SELECT num
FROM sort_demo
ORDER BY num NULLS FIRST; -- или мы можем просто писать order by desc
-----------------------------------------------------------------------------------------------------------------------
