-- For JOSNB from Pg

ALTER TABLE recipes 
ADD 
COLUMN meta JOSNB;

SELECT meta -> 'tags' -> 0 AS first_tag FROM recipes WHERE recipe_id =6 ;