--  Storing Queries in Function
SELECT r.title 
FROM
recipe_ingredients ri
INNER JOIN
recipes r ON
r.recipe_id = ri.recipe_id
GROUP BY r.title
HAVING
COUNT(r.title) BETWEEN 4 AND 6;

----------------------------------------------------------

CREATE or REPLACE FUNCTION
 get_recipes_with_ingredeients(low INT, high INT)
 RETURNS 
 SETOF VARCHAR
 LANGUAGE
 plpgsql
 AS
 $$
   BEGIN
      RETURN QUERY SELECT r.title 
FROM
recipe_ingredients ri
INNER JOIN
recipes r ON
r.recipe_id = ri.recipe_id
GROUP BY r.title
HAVING
COUNT(r.title) BETWEEN low AND high; 
 END;
  $$;


SELECT * FROM get_recipes_with_ingredeients(2,3);
