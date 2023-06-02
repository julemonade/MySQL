/*Выведите имя, фамилию персонажей и название книги, которая на них числится*/
SELECT characters.fname, characters.lname, library.book_name
FROM characters
INNER JOIN library
ON characters.char_id = library.book_id;

/*Выведите имя, фамилию персонажей и название книги, вне зависимости от того, есть ли у них книги или нет*/
SELECT characters.fname, characters.lname, library.book_name
FROM characters
LEFT JOIN library
ON characters.char_id = library.book_id;

/*Выведите название книги и имя патронуса, вне зависимости от того, есть ли информация о держателе книги в таблице или нет*/
SELECT characters.patronus, library.book_name
FROM characters
RIGHT JOIN library
ON characters.char_id = library.book_id;

/*Выведите имя, фамилию, возраст персонажей и название книги, которая на них числится, при условии, что все владельцы книг должны быть старше 15 лет*/
SELECT characters.fname, characters.lname, characters.age, library.book_name
FROM characters
JOIN library
ON characters.char_id = library.book_id
Where characters.age > 15;

/*Выведите имя персонажа, название книги, дату выдачи и дату завершения, при условии, что он младше 15 лет и его патронус неизвестен*/
SELECT characters.fname, library.book_name, library.start_date, library.end_date
FROM characters
JOIN library
ON characters.char_id = library.book_id
Where characters.age < 15 AND characters.patronus = 'Unknown';

/*Используя вложенный запрос количество книг, у которых end_date больше, чем end_date у Hermione*/
SELECT library.book_id, library.book_name, library.end_date
FROM library
WHERE library.end_date > (SELECT MAX(end_date) FROM library
                          JOIN characters ON library.book_id = characters.char_id
                          WHERE characters.fname = 'Hermione');

/*С помощью вложенного запроса выведите имена всех патронусов, у которых владельцы старше возраста персонажа, у которого патронус Unknown*/
SELECT char_id, age, patronus
FROM characters
WHERE age > (SELECT MAX(age) 
			 FROM characters
			 WHERE patronus = 'Unknown');