----------------------------------------------------------------------------------------------------------------------
-- The UNION operator combines result sets of two or more SELECT statements into a single result set.

-- Note: The UNION operator removes all duplicate rows from the combined data set.
-- To retain the duplicate rows, you use the the UNION ALL instead.

-- Creating tables and inserting data
DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO
   top_rated_films(title,release_year)
VALUES
   ('The Shawshank Redemption',1994),
   ('The Godfather',1972),
   ('12 Angry Men',1957);

INSERT INTO
   most_popular_films(title,release_year)
VALUES
   ('An American Pickle',2020),
   ('The Godfather',1972),
   ('Greyhound',2020);

--  Simple PostgreSQL UNION example:
select *
    from top_rated_films
union
select *
    from most_popular_films;

-- PostgreSQL UNION ALL (duplicate: The Godfather):
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films;

-- PostgreSQL UNION ALL with ORDER BY clause example:
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films
ORDER BY title;
-----------------------------------------------------------------------------------------------------------------------






