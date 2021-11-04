----------------------------------------------------------------------------------------------------------------
-- A column alias allows you to assign a column or an expression in the select list of a SELECT statement a temporary
-- name. The column alias exists temporarily during the execution of the query.
select
    first_name,
    last_name as Surname
from
    customer;
-- Or we can make it shorter by removing the AS keyword as follows:
select
    first_name,
    last_name  Surname
from
    customer;
--Assigning a column alias to an expression example
select
    first_name || ' ' || customer.last_name as full_name,
    email
from
    customer;
--If a column alias contains one or more spaces, you need to surround it with double quotes like this:
SELECT
    first_name || ' ' || last_name "full name"
FROM
    customer;
----------------------------------------------------------------------------------------------------------------
