--------------------------------------------------------------------------------------------------------------------
-- A CROSS JOIN clause allows you to produce a Cartesian Product of rows in two or more tables.
-- The following CREATE TABLE statements create
-- T1 and T2 tables and insert some sample data for the cross demonstration.

DROP TABLE IF EXISTS T1;
CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

DROP TABLE IF EXISTS T2;
CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1 (label)
VALUES
	('A'),
	('B');

INSERT INTO T2 (score)
VALUES
	(1),
	(2),
	(3);

-- The following statement uses the CROSS JOIN operator to join the table T1 with the table T2.
SELECT *
FROM T1
CROSS JOIN T2;
--------------------------------------------------------------------------------------------------------------------