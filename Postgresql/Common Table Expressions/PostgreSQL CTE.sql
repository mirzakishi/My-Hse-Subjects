-----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use the PostgreSQL CTE
-- (common table expressions) to simplify complex queries.

-- Common Table Expressions or CTEs are typically used to simplify complex joins and subqueries in PostgreSQL.
WITH cte_film AS (
    SELECT
        film_id,
        title,
        (CASE
            WHEN length < 30 THEN 'Short'
            WHEN length < 90 THEN 'Medium'
            ELSE 'Long'
        END) length
    FROM
        film
)
SELECT
    film_id,
    title,
    length
FROM
    cte_film
WHERE
    length = 'Long'
ORDER BY
    title;

-- Note: The common table expression has two parts:
-- The first part defines the name of the CTE which is cte_film.
-- The second part defines a SELECT statement that populates the expression with rows.

-- The following statement illustrates how to join a CTE with a table:
WITH cte_rental AS (
    SELECT staff_id,
        COUNT(rental_id) rental_count
    FROM   rental
    GROUP  BY staff_id
)
SELECT s.staff_id,
    first_name,
    last_name,
    rental_count
FROM staff s
    INNER JOIN cte_rental USING (staff_id);


-- The following statement illustrates how to use the CTE with the RANK() window function:

WITH cte_film AS  (
    SELECT film_id,
        title,
        rating,
        length,
        RANK() OVER (
            PARTITION BY rating
            ORDER BY length DESC)
        length_rank
    FROM
        film
)
SELECT *
FROM cte_film
WHERE length_rank = 1;
-----------------------------------------------------------------------------------------------------------------------
