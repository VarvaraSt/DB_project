INSERT INTO "dish_category" ("id","name")
VALUES
  (1,'russian'),
  (2,'Ukrainian'),
  (3,'Mexican'),
  (4,'Chinese'),
  (5,'Greek'),
  (6,'French'),
  (7,'Indian'),
  (8,'Japanese'),
  (9,'Italian'),
  (10,'Kazakh');
INSERT INTO "dish_category" ("id","name")
VALUES
  (11,'German'),
  (12,'American');

INSERT INTO "dish_category" ("id","name","parent_category_id")
VALUES
  (13,'soups',2),
  (14,'desserts',7),
  (15,'soups',4),
  (16,'soups',8),
  (17,'fish',5),
  (18,'desserts',3),
  (19,'fish',10),
  (20,'soups',7),
  (21,'soups',1),
  (22,'meat',7);
INSERT INTO "dish_category" ("id","name","parent_category_id")
VALUES
  (23,'drinks',11),
  (24,'soups',9),
  (25,'soups',9),
  (26,'salads',9),
  (27,'drinks',4),
  (28,'soups',8),
  (29,'desserts',1),
  (30,'salads',8),
  (31,'soups',10),
  (32,'drinks',4);
INSERT INTO "dish_category" ("id","name","parent_category_id")
VALUES
  (33,'salads',4),
  (34,'meat',11),
  (35,'vegetables',10),
  (36,'drinks',5),
  (37,'fish',7),
  (38,'soups',12),
  (39,'desserts',9),
  (40,'fish',6),
  (41,'fish',7),
  (42,'meat',11);
INSERT INTO "dish_category" ("id","name","parent_category_id")
VALUES
  (43,'soups',2),
  (44,'meat',8),
  (45,'desserts',5),
  (46,'desserts',4),
  (47,'desserts',4),
  (48,'soups',12),
  (49,'salads',4),
  (50,'desserts',7),
  (51,'soups',11),
  (52,'soups',8);
INSERT INTO "dish_category" ("id","name","parent_category_id")
VALUES
  (53,'fish',2),
  (54,'salads',6),
  (55,'desserts',9),
  (56,'drinks',10),
  (57,'soups',3),
  (58,'fish',7),
  (59,'fish',3),
  (60,'vegetables',4);
