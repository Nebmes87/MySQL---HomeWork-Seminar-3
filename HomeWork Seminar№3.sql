DROP DATABASE IF EXISTS lesson_3_hm;
CREATE DATABASE lesson_3_hm;
USE lesson_3_hm;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `firetname` VARCHAR (30) NOT NULL,
    `lastname` VARCHAR (30) NOT NULL,
    `post` VARCHAR (30) NOT NULL,
    `seniority` INT NOT NULL,
    `salary` INT NOT NULL,
    `age` INT NOT NULL
);

INSERT staff(`firetname`, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петя', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff LIMIT 5;

/* 1.
Отсортируйте поле “зарплата” (salary) в порядке: убывания; возрастания
*/

SELECT *
FROM staff
ORDER BY salary;

SELECT *
FROM staff
ORDER BY salary DESC;

/* 2. 
Выведите 5 максимальных заработных плат (salary)
*/

SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

/* 3. 
Подсчитать суммарную зарплату(salary) по каждой специальности (post)
*/

SELECT post, SUM(salary) AS whole_salary
FROM staff
GROUP BY post;

/* 4. 
Найти количество сотрудников по специальности (post) “Рабочий” в возрасте от 24 до 49 лет включительно
*/

SELECT post, COUNT(post) AS workers_count
FROM staff
WHERE age >= 24 AND age <= 49
GROUP BY post
HAVING post = 'рабочий';

/* 5. 
Найти количество специальностей
*/

SELECT COUNT(DISTINCT post) AS post_list
FROM staff;

/* 6. 
Вывести специальности, у которых средний возраст сотрудника меньше 30 лет
*/

SELECT post, AVG(age) AS age_to_30
FROM staff
GROUP BY post
HAVING age_to_30 < 30;