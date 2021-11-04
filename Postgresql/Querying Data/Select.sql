-------------------------------------------------------------------------------------------------------------
-- Select show you how to query data from a single table.
select first_name,
       last_name,
       email
from
    customer;

-- Using PostgreSQL SELECT statement with concatenation
select
    first_name || ' ' || customer.last_name,
    email
from
    customer;

-- The following example uses the SELECT statement with an expression. It omits the FROM clause:
select 5^2
--------------------------------------------------------------------------------------------------------------
