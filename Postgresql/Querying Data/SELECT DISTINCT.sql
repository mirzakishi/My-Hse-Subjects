-----------------------------------------------------------------------------------------------------------------
-- The DISTINCT clause is used in the SELECT statement to remove duplicate rows from a result set.
-- The DISTINCT clause keeps one row for each group of duplicates.
-- The DISTINCT clause can be applied to one or more columns in the select list of the SELECT statement.

-- 1. First, use the following CREATE TABLE statement to create the distinct_demo table that consists of three columns:
-- id, bcolor and fcolor.
CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);

-- 2. Second, insert some rows into the distinct_demo table using the following INSERT statement:
INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
-- 3. Third, query the data from the distinct_demo table using the SELECT statement:
select * from distinct_demo

-- The following statement selects unique values in the  bcolor column from the t1 table and sorts the result set in
-- alphabetical order by using the ORDER BY clause.
SELECT
	DISTINCT bcolor
FROM
	distinct_demo
ORDER BY
	bcolor;
-- The following statement demonstrates how to use the DISTINCT clause on multiple columns:
SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
-- PostgreSQL DISTINCT ON example
SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
-----------------------------------------------------------------------------------------------------------------------