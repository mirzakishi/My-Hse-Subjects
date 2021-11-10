-----------------------------------------------------------------------------------------------------------------------
-- A common use of  ROLLUP is to calculate the aggregations of data by
-- year, month, and date, considering the hierarchy year > month > date

-- The following query uses the ROLLUP clause to find the number of products
-- sold by brand (subtotal) and by all brands and segments (total).
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (brand, segment)
ORDER BY
    brand,
    segment;

-- The following statement finds the number of rental per day, month, and year by using the ROLLUP:
SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) M,
    EXTRACT (DAY FROM rental_date) d,
    COUNT (rental_id)
FROM
    rental
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date),
        EXTRACT (DAY FROM rental_date)
    );
-----------------------------------------------------------------------------------------------------------------------

