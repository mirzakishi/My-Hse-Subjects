----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use the PostgreSQL ANY operator to
-- compare a scalar value with a set of values returned by a subquery.

SELECT
    MAX( length )
FROM
    film
INNER JOIN film_category
        USING(film_id)
GROUP BY
    category_id;

-- You can use this query as a subquery in the following statement that finds the films whose
-- lengths are greater than or equal to the maximum length of any film category :
SELECT title
FROM film
WHERE length >= ANY(
    SELECT MAX( length )
    FROM film
    INNER JOIN film_category USING(film_id)
    GROUP BY  category_id );

-- ANY vs. IN
-- The = ANY is equivalent to IN operator.
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );

-- The following statement uses the IN operator which produces the same result:
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id IN(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );

-----------------------------------------------------------------------------------------------------------------------


