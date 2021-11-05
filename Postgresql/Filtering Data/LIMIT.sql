-------------------------------------------------------------------------------------------------------------------
-- Using PostgreSQL LIMIT to constrain the number of returned rows example
select
    film_id,
    title,
    release_year
from
    film
order by film_id asc
limit 5;

-- To retrieve 5 films starting from the fourth one ordered by film_id,
-- you use both LIMIT and OFFSET clauses as follows:
select
    film_id,
    title,
    release_year
from
    film
order by film_id
limit 5 offset 3;

-- Using PostgreSQL LIMIT OFFSSET to get top / bottom N rows
-- The top 10 most expensive films in terms of rental
select
    film_id,
    title,
    rental_rate
from film
order by rental_rate desc
limit 10;
---------------------------------------------------------------------------------------------------------------------

