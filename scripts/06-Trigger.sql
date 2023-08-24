-- Trigger -Log  recipe table update in separate table

 -- We can only  Trigger with Functions not with Procedures

 CREATE TABLE updated_recipes (
  id INT GENERATED ALWAYS AS IDENTITY,
  recipe_id INT,
  old_title VARCHAR (255),
  new_title VARCHAR (255),
  time_of_update TIMESTAMP
);

-- Function to update  in trigger

CREATE or REPLACE FUNCTION log_update_recipe_name()
RETURNS
TRIGGER
LANGUAGE
plpgsql
AS 
$$ 
   BEGIN 
        IF OLD.title <> NEW.title THEN
           INSERT INTO 
              updated_recipes(recipe_id,old_title,new_title,time_of_update)
              VALUES
              (NEW.recipe_id, OLD.title, NEW.title, NOW());
          END IF;
          RETURN NEW;
    END;
$$;



---create on Trigger
CREATE OR REPLACE TRIGGER updated_recipe_trigger
AFTER UPDATE ON recipes
  FOR EACH ROW EXECUTE PROCEDURE log_update_recipe_name();