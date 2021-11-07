------------------------------------------------------------------------------------------------------------------
-- The following statement uses the LEFT JOIN clause to join film table with the inventory table:
SELECT
	film.film_id,
	title,
	inventory_id
FROM
	film
LEFT JOIN inventory
    ON inventory.film_id = film.film_id
ORDER BY title;

-- The following statement adds a WHERE clause to find the films that are not in the inventory:
SELECT
	film.film_id,
	film.title,
	inventory_id
FROM
	film
LEFT JOIN inventory
   ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL
ORDER BY title;

-- If both tables have the same column name used in the ON clause, you can use the USING syntax like this:
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i USING (film_id)
WHERE i.film_id IS NULL
ORDER BY title;
--------------------------------------------------------------------------------------------------------------------