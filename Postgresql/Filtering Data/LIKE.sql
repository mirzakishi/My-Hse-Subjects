-----------------------------------------------------------------------------------------------------------------------
-- Suppose that you want to find a customer but you do not remember her name exactly. However,
-- you just remember that her name begins with something like Jen
SELECT
	first_name,
        last_name
FROM
	customer
WHERE
	first_name LIKE 'Jen%';

-- PostgreSQL LIKE operator – pattern matching examples
SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false

-- How it works.
-- 1. The first expression returns true because the foopattern does not contain any wildcard character so the
-- LIKE operator acts like the equal (=) operator.
-- 2. The second expression returns true because it matches any string that begins with the
-- letter  f and followed by any number of characters.
--3. The third expression returns true because the pattern ( _o_) matches any string that begins with any
-- single character, followed by the letter o and ended with any single character.
-- 4. The fourth expression returns false because the pattern  b_ matches any string that begins with the
-- letter  b and followed by any single character.

-- It’s possible to use wildcards(%) at the beginning and/or end of the pattern.
SELECT
	first_name,
        last_name
FROM
	customer
WHERE
	first_name LIKE '%er%'
ORDER BY
        first_name;

-- You can combine the percent ( %) with underscore ( _) to construct a pattern as the following example:
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_her%'
ORDER BY
        first_name;

-- PostgreSQL NOT LIKE examples
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name NOT LIKE 'Jen%'
ORDER BY
        first_name

-- PostgreSQL extensions of LIKE operator
-- PostgreSQL supports the ILIKE operator that works like the LIKE operator.
-- In addition, the ILIKE operator matches value case-insensitively.
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name ILIKE 'BAR%';
-- Note: The  BAR% pattern matches any string that begins with BAR, Bar, BaR, etc.
-- If you use the LIKE operator instead, the query will not return any row.

-- Note: PostgreSQL also provides some operators that act like the LIKE, NOT LIKE,
-- ILIKE and NOT ILIKE operator as shown below:
-- Operator	       Equivalent
     ~~	              LIKE
     ~~*	          ILIKE
     !~~	          NOT LIKE
     !~~*	          NOT ILIKE
------------------------------------------------------------------------------------------------------------------------
