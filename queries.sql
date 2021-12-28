-- Поиск блюда по названию. Например, поиск блюда 'sed'
SELECT dish.name, dish.image, dish.description, dish.calories, dish.proteins, dish.fats, dish.carbohydrates, string_agg(i.name, ', ') as ingredients
FROM dish
JOIN dish_ingredient di on dish.id = di.dish_id
JOIN ingredient i on di.ingredient_id = i.id
WHERE dish.name = 'sed'
GROUP BY dish.id;

-- Расчёт КБЖУ для какого-то приёма пищи пользователя. Например, для Mannix Allison
SELECT U.name, m.name, sum(md.portion_n * d.calories) as calories,
       sum(md.portion_n * d.proteins) as proteins, sum(md.portion_n * d.fats) as fats,
       sum(md.portion_n * d.carbohydrates) as carbohydrates
FROM meal m
JOIN "User" U on m.user_id = U.id
JOIN meal_dish md on m.id = md.meal_id
JOIN dish d on md.dish_id = d.id
WHERE U.name = 'Mannix Allison' AND m.name = 'breakfast'
GROUP BY m.name, U.name;

-- Расчёт количества пользователей для отчёта
SELECT count(*)
FROM "User";

-- Расчёт новых пользователей за последний месяц для отчёта
SELECT count(*)
FROM "User" u
WHERE u.created_at >= current_date - 30 AND u.created_at <= current_date;

-- Расчёт топ-10 наиболее часто поеддаемых пользователями блюд для отчёта
SELECT dish_id, name, count(*) as num
FROM meal_dish md
JOIN dish d on md.dish_id = d.id
GROUP BY dish_id, name
ORDER BY num DESC
LIMIT 10;

-- Рекурсивный поиск блюд в категории "russian", включая подкатегории
SELECT d.id as id, d.name as name, category_id, dc.name as category_name
FROM dish d
JOIN dish_category dc on dc.id = d.category_id AND
                         (dc.id in (
WITH RECURSIVE cat AS
(
    SELECT id
    FROM dish_category
    WHERE dish_category.parent_category_id = (
        SELECT id
        FROM dish_category
        WHERE name = 'russian'
        )
    UNION ALL
    SELECT c.id
    FROM dish_category c
    JOIN cat ON cat.id = c.parent_category_id
)
SELECT DISTINCT id FROM cat) OR dc.id = (
        SELECT id
        FROM dish_category
        WHERE name = 'russian'
        ));
