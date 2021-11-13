-----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use the PostgreSQL ALL operator to compare a value with
-- a list of values returned by a subquery.

-- The following query returns the average lengths of all films grouped by film rating:
SELECT
    ROUND(AVG(length), 2) avg_length
FROM
    film
GROUP BY
    rating
ORDER BY
    avg_length DESC;

-- To find all films whose lengths are greater than the list of the average lengths above, you use the
-- ALL and greater than operator (>) as follows:

SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
            SELECT
                ROUND(AVG (length),2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    length;
-----------------------------------------------------------------------------------------------------------------------
