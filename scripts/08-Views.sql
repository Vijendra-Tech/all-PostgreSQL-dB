--Create Views for some comnination of tables;

CREATE VIEW title_type 
AS
SELECT title,type FROM recipes
WHERE title ILIKE '%veg%';


--Materalized VIEW

CREATE Materalized VIEW
 actor_category
 AS
 --All SQL query with nested Query

WITH No DATA; --DOn't run sql query immediatly so it will no data in Newly created View


---To run materialized View 
REFRESH Materalized VIEW actor_category;
