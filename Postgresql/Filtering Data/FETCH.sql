-------------------------------------------------------------------------------------------------------------------
-- The following query use the FETCH clause to select the first film sorted by titles in ascending order:
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title
FETCH FIRST ROW ONLY;

-- The following query use the FETCH clause to select the first five films sorted by titles:
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title
FETCH FIRST 5 ROW ONLY;

-- The following statement returns the next five films after the first five films sorted by titles:
SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title
offset 5 rows
FETCH FIRST 5 ROW ONLY;

--Note: The FETCH clause is functionally equivalent to the LIMIT clause. If you plan to make your application
--compatible with other database systems, you should use the FETCH clause because it follows the standard SQL.
-----------------------------------------------------------------------------------------------------------------------