-----------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn about grouping set concept and how to use the
-- PostgreSQL GROUPING SETS clause to generate multiple grouping sets in a query.

-- Let’s get started by creating a new table called sales for the demonstration.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);

-- A grouping set is a set of columns by which you group by using the GROUP BY clause.
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment;

-- The following query finds the number of products sold by segment. It defines a grouping set (segment):
SELECT
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment;

-- Because UNION ALL requires all result sets to have the same number of columns with compatible data types,
-- you need to adjust the queries by adding NULL to the selection list of each as shown below:
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;

-- To apply this syntax to the above example, you can use
-- GROUPING SETS clause instead of the UNION ALL clause like this:
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        (brand),
        (segment),
        ()
    );

-- The GROUPING() function accepts an argument which can be a column name or an expression:
-- The GROUPING() function returns bit 0 if the argument is a member of the current grouping set and 1 otherwise.
SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
ORDER BY
	brand,
	segment;
------------------------------------------------------------------------------------------------------------------------




