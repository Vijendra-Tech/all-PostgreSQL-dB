-- Aggregation - GROUP BY 

SELECT type, COUNT (type)
FROM ingredients GROUP BY type;


-- Having 

SELECT type , COUNT(type)
FROM 
ingredients
WHERE image is NOT NULL
GROUP BY type
HAVING
COUNT(type) >10;