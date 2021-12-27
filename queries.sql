SELECT dish.name, dish.image, dish.description, dish.calories, dish.proteins, dish.fats, dish.carbohydrates, string_agg(i.name, ', ') as ingredients
FROM dish
JOIN dish_ingredient di on dish.id = di.dish_id
JOIN ingredient i on di.ingredient_id = i.id
WHERE dish.name = 'sed'
GROUP BY dish.id;

SELECT U.name, m.name, sum(md.portion_n * d.calories) as calories,
       sum(md.portion_n * d.proteins) as proteins, sum(md.portion_n * d.fats) as fats,
       sum(md.portion_n * d.carbohydrates) as carbohydrates
FROM meal m
JOIN "User" U on m.user_id = U.id
JOIN meal_dish md on m.id = md.meal_id
JOIN dish d on md.dish_id = d.id
WHERE U.name = 'Mannix Allison' AND m.name = 'breakfast'
GROUP BY m.name, U.name;

SELECT count(*)
FROM "User";

SELECT count(*)
FROM "User" u
WHERE u.created_at >= current_date - 30 AND u.created_at <= current_date;

SELECT dish_id, name, count(*) as num
FROM meal_dish md
JOIN dish d on md.dish_id = d.id
GROUP BY dish_id, name
ORDER BY num DESC
LIMIT 10;



