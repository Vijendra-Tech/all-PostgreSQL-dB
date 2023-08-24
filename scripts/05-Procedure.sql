-- Procedure in SQL 


CREATE PROCEDURE 
  set_null_image_default()
  LANGUAGE
  SQL
  AS
  $$ 
   UPDATE 
     ingredients 
     SET
        image = 'default.jpg'
    WHERE 
    image is NULL;
  $$;

CALL set_null_image_default();