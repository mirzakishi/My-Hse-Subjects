-------------------------------------------------------------------------------------------------------------------
-- Summary: in this tutorial, you will learn how to use the PostgreSQL BETWEEN
-- operator to match a value against a range of values.
select
    customer_id,
    payment_id,
    amount
from
    payment
where amount between 8 and 9;

-- To get payments whose amount is not in the range of 8 and 9, you use the following query:
select
    customer_id,
    payment_id,
    amount
from
    payment
where amount not between 8 and 9
order by amount desc;

-- If you want to check a value against of date ranges, you should use
-- the literal date in ISO 8601 format i.e., YYYY-MM-DD
SELECT
	customer_id,
	payment_id,
	amount,
    payment_date
FROM
	payment
WHERE
	payment_date BETWEEN '2007-02-07' AND '2007-02-15';
-----------------------------------------------------------------------------------------------------------------------
