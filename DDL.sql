DROP TABLE IF EXISTS "dish_ingredient";
DROP TABLE IF EXISTS "favorite_dish";
DROP TABLE IF EXISTS "ingredient";
DROP TABLE IF EXISTS "ingredient_category";
DROP TABLE IF EXISTS "meal_dish";
DROP TABLE IF EXISTS "meal";
DROP TABLE IF EXISTS "dish";
DROP TABLE IF EXISTS "dish_category";
DROP TABLE IF EXISTS "User";

CREATE TABLE "User"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "weight" INTEGER NOT NULL,
    "height" INTEGER NOT NULL,
    "age" INTEGER NOT NULL,
    "activity" VARCHAR(255) NOT NULL,
    "e-mail" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "is_admin" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "User" ADD PRIMARY KEY("id");
CREATE TABLE "ingredient"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "calories" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "proteins" INTEGER NOT NULL,
    "fats" INTEGER NOT NULL,
    "carbohydrates" INTEGER NOT NULL
);
ALTER TABLE
    "ingredient" ADD PRIMARY KEY("id");
CREATE TABLE "ingredient_category"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "parent_category_id" INTEGER NULL
);
ALTER TABLE
    "ingredient_category" ADD PRIMARY KEY("id");
CREATE TABLE "dish"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "category_id" INTEGER NOT NULL,
    "image" VARCHAR(255) NULL,
    "description" TEXT NULL,
    "calories" INTEGER NOT NULL,
    "proteins" INTEGER NOT NULL,
    "fats" INTEGER NOT NULL,
    "carbohydrates" INTEGER NOT NULL
);
ALTER TABLE
    "dish" ADD PRIMARY KEY("id");
CREATE TABLE "dish_category"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "parent_category_id" INTEGER NULL
);
ALTER TABLE
    "dish_category" ADD PRIMARY KEY("id");
CREATE TABLE "dish_ingredient"(
    "id" INTEGER NOT NULL,
    "dish_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    "ingredient_weight" INTEGER NOT NULL
);
ALTER TABLE
    "dish_ingredient" ADD PRIMARY KEY("id");
CREATE TABLE "favorite_dish"(
    "id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "dish_id" INTEGER NOT NULL
);
ALTER TABLE
    "favorite_dish" ADD PRIMARY KEY("id");
CREATE TABLE "meal"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "description" TEXT NULL
);
ALTER TABLE
    "meal" ADD PRIMARY KEY("id");
CREATE TABLE "meal_dish"(
    "id" INTEGER NOT NULL,
    "meal_id" INTEGER NOT NULL,
    "dish_id" INTEGER NOT NULL,
    "portion_n" INTEGER NOT NULL
);
ALTER TABLE
    "meal_dish" ADD PRIMARY KEY("id");
ALTER TABLE
    "dish_ingredient" ADD CONSTRAINT "dish_ingredient_ingredient_id_foreign" FOREIGN KEY("ingredient_id") REFERENCES "ingredient"("id");
ALTER TABLE
    "ingredient_category" ADD CONSTRAINT "ingredient_category_parent_category_id_foreign" FOREIGN KEY("parent_category_id") REFERENCES "ingredient_category"("id");
ALTER TABLE
    "ingredient" ADD CONSTRAINT "ingredient_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "ingredient_category"("id");
ALTER TABLE
    "favorite_dish" ADD CONSTRAINT "favorite_dish_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
ALTER TABLE
    "meal" ADD CONSTRAINT "meal_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
ALTER TABLE
    "dish_ingredient" ADD CONSTRAINT "dish_ingredient_dish_id_foreign" FOREIGN KEY("dish_id") REFERENCES "dish"("id");
ALTER TABLE
    "favorite_dish" ADD CONSTRAINT "favorite_dish_dish_id_foreign" FOREIGN KEY("dish_id") REFERENCES "dish"("id");
ALTER TABLE
    "meal_dish" ADD CONSTRAINT "meal_dish_dish_id_foreign" FOREIGN KEY("dish_id") REFERENCES "dish"("id");
ALTER TABLE
    "dish_category" ADD CONSTRAINT "dish_category_parent_category_id_foreign" FOREIGN KEY("parent_category_id") REFERENCES "dish_category"("id");
ALTER TABLE
    "dish" ADD CONSTRAINT "dish_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "dish_category"("id");
ALTER TABLE
    "meal_dish" ADD CONSTRAINT "meal_dish_meal_id_foreign" FOREIGN KEY("meal_id") REFERENCES "meal"("id");
