INSERT INTO "ingredient_category" ("id","name")
VALUES
  (1,'fish'),
  (2,'vegetables'),
  (3,'fruits'),
  (4,'meat'),
  (5,'cereals'),
  (6,'dairy'),
  (7,'sauces'),
  (8,'other');
INSERT INTO "ingredient_category" ("id","name","parent_category_id")
VALUES
  (9,'white fish',1),
  (10,'red fish',1),
  (11,'spices',8);
