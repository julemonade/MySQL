/*Выведите имя, фамилию, патронуса всех персонажей, у которых есть patronus и он известен*/
SELECT fname, lname, patronus
FROM characters
WHERE patronus IS NOT NULL AND NOT patronus="Unknown";

/*Выведите фамилию персонажей, у которых последняя буква в фамилии ‘e’*/
SELECT lname 
FROM characters
WHERE lname LIKE '%e';

/*Посчитайте общий возраст всех персонажей и выведите это на экран*/
SELECT SUM (age) FROM characters;

/*Выведите имя, фамилию и возраст персонажей по убыванию их возраста*/
SELECT fname, lname, age
FROM characters
ORDER BY age DESC;

/*Выведите имя персонажа и возраст, у которых последний находится в диапазоне от 50 до 100 лет*/
SELECT fname, age
FROM characters
WHERE age BETWEEN 50 AND 100;

/*Выведите возраст всех персонажей так, чтобы среди них не было тех, у кого он одинаковый*/
SELECT distinct age
FROM characters;

/*Выведите всю информацию о персонажах, у которых faculty = Gryffindor и чей возраст больше 30 лет*/
SELECT *
FROM characters
WHERE faculty = 'Gryffindor' AND age > 30;

/*Выведите имена первых трех факультетов из таблицы, так чтобы факультеты не повторялись*/
SELECT distinct faculty
FROM characters
LIMIT 3;

/*Выведите имена всех персонажей, у которых имя начинается с ‘H’ и состоит из 5 букв, или чье имя начинается с ‘L’ */
SELECT fname
FROM characters
WHERE fname LIKE 'H____' OR 'L%';

/*Посчитайте средний возраст всех персонажей*/
SELECT AVG (age) FROM characters;

/*Удалите персонажа с ID = 11*/
DELETE FROM characters WHERE char_id='11';

/*Выведите фамилию всех персонажей, которые содержат в ней букву ‘a’*/
SELECT lname 
FROM characters
WHERE lname LIKE '%a%';

/*Используйте псевдоним для того, чтобы временно замените название столбца fname на Half-Blood Prince для реального принца-полукровки*/
SELECT fname AS Half_Blood_Prince 
FROM characters;

/*Выведите id и имена всех патронусов в алфавитном порядки, при условии что они есть или известны*/
SELECT char_id, fname, patronus
FROM characters
WHERE patronus IS NOT NULL AND NOT patronus = 'Unknown'
ORDER BY patronus ASC;

/*Используя оператор IN, выведите имя и фамилию тех персонажей, у которых фамилия Crabbe, Granger или Diggory*/
SELECT fname, lname
FROM characters
WHERE lname in ('Crabbe', 'Granger', 'Diggory');

/*Выведите минимальный возраст персонажа*/
SELECT MIN(age)
FROM characters;

/*Используя оператор UNION выберите имена из таблицы characters и названия книг из таблицы library*/
SELECT fname FROM characters
UNION ALL
SELECT book_name FROM library;

/*Используя оператор HAVING посчитайте количество персонажей на каждом факультете, оставив только те факультеты, где количество студентов больше 1*/
SELECT COUNT(char_id), faculty
FROM characters
Group by faculty
Having COUNT(char_id) > 1; 

/*Используя оператор CASE опишите следующую логику:
Выведите имя и фамилию персонажа, а также следующий текстовое сообщение:
Если факультет Gryffindor, то в консоли должно вывестись Godric
Если факультет Slytherin, то в консоли должно вывестись Salazar
Если факультет Ravenclaw, то в консоли должно вывестись Rowena
Если факультет Hufflepuff, то в консоли должно вывестись Helga
Если другая информация, то выводится Muggle
Для сообщения используйте псевдоним Founders
*/

SELECT  char_id, fname, lname, faculty,
CASE 
WHEN faculty = "Gryffindor" THEN "Godric"
WHEN faculty = "Slytherin" THEN "Salazar"
WHEN faculty = "Ravenclaw" THEN "Rowena"
WHEN faculty = "Hufflepuff" THEN "Helga"
ELSE "Muggle"
END AS Founders
FROM characters;

/*Используя регулярное выражение найдите фамилии персонажей, которые не начинаются с букв H, L или S и выведите их*/
SELECT lname FROM characters WHERE lname NOT LIKE ("(H|L|S)%");




