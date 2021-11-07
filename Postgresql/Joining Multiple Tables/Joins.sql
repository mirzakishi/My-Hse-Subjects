-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

-- PostgreSQL inner join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
INNER JOIN basket_b
    ON fruit_a = fruit_b;

-- PostgreSQL left join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT JOIN basket_b
   ON fruit_a = fruit_b;

-- To select rows from the left table that do not have matching rows in the right table,
-- you use the left join with a WHERE clause. For example:
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT  JOIN basket_b
    ON fruit_a = fruit_b
WHERE b IS NULL;    -- Note that the LEFT JOIN is the same as the LEFT OUTER JOIN so you can use them interchangeably.

-- PostgreSQL right join
-- The right join is a reversed version of the left join. The right join starts selecting data from the right table.
-- It compares each value in the fruit_b column of every row in the right table with each value in the fruit_a column
-- of every row in the fruit_a table.
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT JOIN basket_b ON fruit_a = fruit_b;
--
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT JOIN basket_b
   ON fruit_a = fruit_b
WHERE a IS NULL;

-- PostgreSQL full outer join
-- The full outer join or full join returns a result set that contains all rows from both left and right tables,
-- with the matching rows from both sides if available. In case there is no match,
-- the columns of the table will be filled with NULL.
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL OUTER JOIN basket_b
    ON fruit_a = fruit_b;

-- To return rows in a table that do not have matching rows in the other,
-- you use the full join with a WHERE clause like this:
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL JOIN basket_b
   ON fruit_a = fruit_b
WHERE a IS NULL OR b IS NULL;
-----------------------------------------------------------------------------------------------------------------------

