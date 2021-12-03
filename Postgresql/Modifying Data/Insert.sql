-----------------------------------------------------------------------------------------------------------------------
--Summary: in this tutorial, you will learn how to use the PostgreSQL INSERT statement to insert a new row into a table

DROP TABLE IF EXISTS links;

CREATE TABLE links (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
        last_update DATE
);

-- 1. PostgreSQL INSERT – Inserting a single row into a table

INSERT INTO links (url, name)
VALUES('https://www.postgresqltutorial.com','PostgreSQL Tutorial');

-- 2. PostgreSQL INSERT – Inserting character string that contains a single quote

INSERT INTO links (url, name)
VALUES('http://www.oreilly.com','O''Reilly Media');

-- 3. PostgreSQL INSERT – Inserting a date value
-- Note: To insert a date value into a column with the DATE type, you use the date in the format 'YYYY-MM-DD'.

INSERT INTO links (url, name, last_update)
VALUES('https://www.google.com','Google','2013-06-01');

-- 4. PostgreSQL INSERT- Getting the last insert id

INSERT INTO links (url, name, last_update)
VALUES('https://www.facebook.com','Facebook','2021-12-03');
--RETURNING *;

-- select * from links;
-----------------------------------------------------------------------------------------------------------------------

-- INSERT Multiple Rows

-- CREATE NEW TABLE

DROP TABLE IF EXISTS links;

CREATE TABLE links (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

-- Insert multiple rows

INSERT INTO
    links (url, name)
VALUES
    ('https://www.google.com','Google'),
    ('https://www.yahoo.com','Yahoo'),
    ('https://www.bing.com','Bing');


select *
from links;

-- Inserting multiple rows and returning inserted rows

INSERT INTO
    links(url,name, description)
VALUES
    ('https://duckduckgo.com/','DuckDuckGo','Privacy & Simplified Search Engine'),
    ('https://swisscows.com/','Swisscows','Privacy safe WEB-search')
RETURNING *;
-----------------------------------------------------------------------------------------------------------------------
