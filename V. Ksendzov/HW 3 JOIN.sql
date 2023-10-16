-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
-- выбираем имя работника и зарплату
-- из таблицы "работники" - это будет основная таблица, к которой мы присоединим другие 
/*присоединяем таблицу "работники+зп (где только айди)" 
по условию айди работника из таблицы "работники" = айди работника из таблицы "работники+зп"
т.е. получается что сейчас объединенная таблица выглядит как:
айди | имя работника | айди es | айди работника | айди зп |*/
-- присоединяем теперь еще таблицу с зп, чтобы айди из таблицы зп совпадала с айди зп в таблице "работники+зп"
-- id e | employee_name | id es | employee_id | salary_id | id s | monthly_salary
-- и теперь когда все соединилось, выводиться будут только 2 и последний столбцы - имя и зп работника

SELECT e.employee_name, s.monthly_salary 
FROM employees e 
JOIN employee_salary es ON e.id = es.employee_id 
JOIN salary s ON es.salary_id = s.id;  

/* сделаем тот же самый запрос, поменяв местами таблицы:
SELECT e.employee_name, s.monthly_salary
FROM salary s
JOIN employee_salary es ON es.salary_id = s.id
JOIN employees e ON e.id = es.employee_id;
* выбираем те же самые данные - имя и зп
* берем из таблицы зарплата
* к ней присоединяем таблицу, и пишем условие чтобы совпадали айдишки. присоединять таблицы можно в любом порядке, т.к. мы используем общий join
* общий join будет возвращать только те строки, которые имеют соответствие в обеих таблицах, и не включает строки без соответствия
* в условии задания написано - работники, чьи зп есть в базе. работники без зп не нужны
*/

/* Левый JOIN позволяет включать записи из левой таблицы, даже если у них нет соответствующих записей в правой таблице.
 * таким образом мы получим абсолютно всех работников, даже без зп
SELECT e.employee_name, s.monthly_salary
FROM employees e
LEFT JOIN employee_salary es ON e.id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id;
*/

-- 2. Вывести всех работников у которых ЗП меньше 2000.
SELECT e.employee_name, s.monthly_salary
FROM salary s
JOIN employee_salary es ON es.salary_id = s.id
JOIN employees e ON e.id = es.employee_id
where s.monthly_salary < 2000;
 
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- задание обратное 1
-- основная таблица зарплата, к ней присоединяем таблицу с айдишками и именами
-- используем left join + where, чтобы отобрать только зп и нулевые имена

SELECT s.monthly_salary, e.employee_name
FROM salary s
LEFT JOIN employee_salary es ON s.id = es.salary_id
LEFT JOIN employees e ON e.id = es.employee_id
WHERE e.employee_name IS NULL;

-- 4. Вывести все зарплатные позиции  меньше 2000, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT s.monthly_salary, e.employee_name
FROM salary s
LEFT JOIN employee_salary es ON s.id = es.salary_id
LEFT JOIN employees e ON e.id = es.employee_id
WHERE e.employee_name IS null
and s.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
SELECT e.employee_name, s.monthly_salary
FROM employees e
LEFT JOIN employee_salary es ON e.id = es.employee_id
LEFT JOIN salary s ON s.id = es.salary_id
WHERE s.monthly_salary IS NULL;

-- 6. Вывести всех работников с названиями их должности.
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id;

-- 7. Вывести имена и должность только Java разработчиков.
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%java developer%';

-- 8. Вывести имена и должность только Python разработчиков.
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%python developer%';

-- 9. Вывести имена и должность всех QA инженеров.
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%qa engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%manual qa engineer%';

-- 11. Вывести имена и должность автоматизаторов QA
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%automation qa engineer%';

-- 12. Вывести имена и зарплаты Junior специалистов
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
SELECT e.employee_name, r.role_name 
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
where r.role_name ILIKE '%senior%';

-- 15. Вывести зарплаты Java разработчиков
SELECT r.role_name, s.monthly_salary
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
where r.role_name ILIKE '%java developer%';

/*
id r  | role_name      | 
id re | employee_id    | role_id
id e  | employee_name  |
id s  | monthly_salary |
id es | employee_id    | salary_id
*/


-- 16. Вывести зарплаты Python разработчиков
SELECT r.role_name, s.monthly_salary 
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
where r.role_name ILIKE '%python developer%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
where r.role_name ILIKE '%junior python developer%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
where r.role_name ILIKE '%middle javascript developer%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e 
JOIN roles_employee re ON e.id = re.employee_id 
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
where r.role_name ILIKE '%senior java developer%';

-- 20. Вывести зарплаты Junior QA инженеров
SELECT r.role_name, s.monthly_salary 
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
where r.role_name ILIKE '%junior%'
ORDER BY monthly_salary ASC;

-- 21. Вывести среднюю зарплату всех Junior специалистов
SELECT AVG(s.monthly_salary) AS average_salary
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name ILIKE '%junior%';

-- 22. Вывести сумму зарплат JS разработчиков
SELECT SUM(s.monthly_salary) AS average_salary, r.role_name
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name ILIKE '%javascript developer%'
GROUP BY r.role_name;

-- 23. Вывести минимальную ЗП QA инженеров
SELECT MIN(s.monthly_salary) AS average_salary, r.role_name
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name ILIKE '%qa engineer%'
Group BY r.role_name;

--24. Вывести максимальную ЗП QA инженеров.
SELECT MAX(s.monthly_salary) AS average_salary, r.role_name
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name ILIKE '%qa engineer%'
Group BY r.role_name;

-- 25. Вывести количество QA инженеров
SELECT COUNT(*) AS qa_engineer_count
FROM roles r
JOIN roles_employee re ON r.id = re.role_id
WHERE r.role_name ILIKE '%qa engineer%';

-- 26. Вывести количество Middle специалистов.
SELECT COUNT(*) AS middle_specialist_count
FROM roles r
JOIN roles_employee re ON r.id = re.role_id
WHERE r.role_name ILIKE '%middle%';

-- 27. Вывести количество разработчиков
SELECT COUNT(*) AS developers_count
FROM roles r
JOIN roles_employee re ON r.id = re.role_id
WHERE r.role_name ILIKE '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT SUM(s.monthly_salary) AS average_salary, r.role_name
FROM roles r  
JOIN roles_employee re ON r.id = re.role_id 
JOIN employees e ON e.id = re.employee_id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE r.role_name ILIKE '%developer%'
GROUP BY r.role_name;

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON es.salary_id = s.id
ORDER BY s.monthly_salary ASC;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON es.salary_id = s.id
where s.monthly_salary between 1700 and 2300
ORDER BY s.monthly_salary ASC;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON es.salary_id = s.id
where s.monthly_salary < 2300
ORDER BY s.monthly_salary ASC;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT e.employee_name, r.role_name, s.monthly_salary
FROM employees e
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON e.id = es.employee_id
JOIN salary s ON es.salary_id = s.id
WHERE s.monthly_salary IN (1100, 1500, 2000)
ORDER BY s.monthly_salary ASC;

