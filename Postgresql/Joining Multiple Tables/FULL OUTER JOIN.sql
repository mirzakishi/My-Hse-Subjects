------------------------------------------------------------------------------------------------------------------
-- First, create two new tables for the demonstration: employees and departments:
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE departments (
	department_id serial PRIMARY KEY,
	department_name VARCHAR (255) NOT NULL
);

CREATE TABLE employees (
	employee_id serial PRIMARY KEY,
	employee_name VARCHAR (255),
	department_id INTEGER
);

-- Second, insert some sample data into the departments and employees tables.
INSERT INTO departments (department_name)
VALUES
	('Sales'),
	('Marketing'),
	('HR'),
	('IT'),
	('Production');

INSERT INTO employees (
	employee_name,
	department_id
)
VALUES
	('Bette Nicholson', 1),
	('Christian Gable', 1),
	('Joe Swank', 2),
	('Fred Costner', 3),
	('Sandra Kilmer', 4),
	('Julia Mcqueen', NULL);
------

-- Third, use the FULL OUTER JOIN to query data from both employees and departments tables.
SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d
        ON d.department_id = e.department_id;

-- To find the department that does not have any employees, you use a WHERE clause as follows:
SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d
        ON d.department_id = e.department_id
WHERE
	employee_name IS NULL;
-----------------------------------------------------------------------------------------------------------------------

