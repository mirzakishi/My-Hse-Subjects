-----------------------------------------------------------------------------------------------------------------------
-- The INTERSECT operator returns any rows that are available in both result sets.
SELECT *
FROM most_popular_films
INTERSECT
SELECT *
FROM top_rated_films;

------------------------------------------------------EXCEPT-----------------------------------------------------------
-- The EXCEPT operator returns distinct rows from the first (left) query
-- that are not in the output of the second (right) query.
SELECT * FROM top_rated_films
EXCEPT
SELECT * FROM most_popular_films;
--------------------------------------------------------------------------------------------------------------------
