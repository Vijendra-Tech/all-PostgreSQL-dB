--Anayze performance of query with Explain

EXPLAIN ANALYZE SELECT * FROM recipes;

--Create index

CREATE TABLE  indian_address(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    street_address int NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    UNIQUE(street_address,city,state) --create index

)

CREATE INDEX idx_name ON igredients(title);

--GIN Index

CREATE INDEX gin_name ON recipes USING gin(title);

--create parial Index
