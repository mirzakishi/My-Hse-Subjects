-----------------------------------------------------------------------------------------------------------------------
-- Summary: A recursive common table expression (CTE) is a CTE that references itself. By doing so,
-- the CTE repeatedly executes, returns subsets of data, until it returns the complete result set.
-- PostgreSQL provides the WITH statement that allows you to construct auxiliary statements for use in a query.

-- We will create a new table to demonstrate the PostgreSQL recursive query.
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	employee_id serial PRIMARY KEY,
	full_name VARCHAR NOT NULL,
	manager_id INT
);

INSERT INTO employees (
	employee_id,
	full_name,
	manager_id
)
VALUES
	(1, 'Michael North', NULL),
	(2, 'Megan Berry', 1),
	(3, 'Sarah Berry', 1),
	(4, 'Zoe Black', 1),
	(5, 'Tim James', 1),
	(6, 'Bella Tucker', 2),
	(7, 'Ryan Metcalfe', 2),
	(8, 'Max Mills', 2),
	(9, 'Benjamin Glover', 2),
	(10, 'Carolyn Henderson', 3),
	(11, 'Nicola Kelly', 3),
	(12, 'Alexandra Climo', 3),
	(13, 'Dominic King', 3),
	(14, 'Leonard Gray', 4),
	(15, 'Eric Rampling', 4),
	(16, 'Piers Paige', 7),
	(17, 'Ryan Henderson', 7),
	(18, 'Frank Tucker', 8),
	(19, 'Nathan Ferguson', 8),
	(20, 'Kevin Rampling', 8);

select * from employees;

-- 1. Execute the non-recursive term to create the base result set (R0).
-- 2. Execute recursive term with Ri as an input to return the result set Ri+1 as the output.
-- 3. Repeat step 2 until an empty set is returned. (termination check)
-- 4. Return the final result set that is a UNION or UNION ALL of the result set R0, R1, … Rn

-- -- PostgreSQL executes a recursive CTE in the following sequence:
-- The following query returns all subordinates of the manager with the id 2.
WITH RECURSIVE subordinates AS (
	SELECT
		employee_id,
		manager_id,
		full_name
	FROM
		employees
	WHERE
		employee_id = 2
	UNION
		SELECT
			e.employee_id,
			e.manager_id,
			e.full_name
		FROM
			employees e
		INNER JOIN subordinates s ON s.employee_id = e.manager_id
) SELECT
	*
FROM
	subordinates;

-- Попрубуем посчитать факториал
WITH RECURSIVE r AS (
    -- стартовая часть рекурсии (т.н. "anchor")
    SELECT
        1 AS i,
        1 AS factorial

    UNION

    -- рекурсивная часть
    SELECT
        i+1 AS i,
        factorial * (i+1) as factorial
    FROM r
    WHERE i < 10
)
SELECT * FROM r;

-- How it works:
-- 1. The recursive CTE, subordinates, defines one non-recursive term and one recursive term.
-- 2. The non-recursive term returns the base result set R0 that is the employee with the id 2.
