/*Таблица employees
Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.*/
create table employees 
	(id serial primary key,
	employee_name varchar(50) not null);

INSERT INTO employees (employee_name)
VALUES 
    ('Alice Johnson'),
    ('David Smith'),
    ('Emma Williams'),
    ('Michael Brown'),
    ('Olivia Jones'),
    ('Sarah Davis'),
    ('James Miller'),
    ('Emily Wilson'),
    ('Daniel Moore'),
    ('Ava Taylor'),
    ('Joseph Anderson'),
    ('Sophia Thomas'),
    ('Benjamin Jackson'),
    ('Mia White'),
    ('Ethan Harris'),
    ('Charlotte Martin'),
    ('Liam Clark'),
    ('Grace Turner'),
    ('Henry Walker'),
    ('Amelia Lewis'),
    ('Samuel Carter'),
    ('Harper Scott'),
    ('William Young'),
    ('Abigail Hall'),
    ('Alexander Green'),
    ('Madison King'),
    ('Noah Adams'),
    ('Elizabeth Martinez'),
    ('Oliver Rodriguez'),
    ('Ella Hill'),
    ('Daniel Allen'),
    ('Scarlett Bennett'),
    ('Matthew Parker'),
    ('Lily Wright'),
    ('Christopher Turner'),
    ('Chloe Mitchell'),
    ('Andrew Carter'),
    ('Zoe Hall'),
    ('Jack Scott'),
    ('Aubrey Wilson'),
    ('Ethan Baker'),
    ('Addison Wood'),
    ('Samuel Hayes'),
    ('Avery Nelson'),
    ('Benjamin Cook'),
    ('Sofia Rivera'),
    ('Luke Johnson'),
    ('Victoria Evans'),
    ('Caleb Perez'),
    ('Grace Murphy'),
    ('Daniel Reed'),
    ('Mia Torres'),
    ('James Foster'),
    ('Lily Ramirez'),
    ('Henry Russell'),
    ('Ella Butler'),
    ('Alexander Price'),
    ('Sophia Coleman'),
    ('Noah Morris'),
    ('Scarlett Ward'),
    ('William Brooks'),
    ('Ava Perry'),
    ('Christopher Cox'),
    ('Olivia Howard'),
    ('Matthew Bell'),
    ('Amelia Long'),
    ('Michael Gray'),
    ('Harper Hughes'),
    ('Samuel Watson'),
    ('Emily Powell');

/*Таблица salary
Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 15 строками:*/
create table salary
	(id serial primary key, 
	monthly_salary int not null);

INSERT INTO salary (monthly_salary)
values
    (1000),
    (1100),
    (1200),
    (1300),
    (1400),
    (1500),
    (1600),
    (1700),
    (1800),
    (1900),
    (2000),
    (2100),
    (2200),
    (2300),
    (2400),
    (2500);

/*Таблица employee_salary
Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id*/
create table employee_salary 
	(id serial primary key,
	employee_id int not null unique, 
	salary_id int not null);

insert into employee_salary(employee_id,salary_id)
   values (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (71, 16),  -- Existing employee_id
        (6, 6),
        (7, 7),
        (8, 8),
        (9, 9),
        (72, 6),  -- Existing employee_id  
        (11, 11),
        (12, 12),
        (13, 13),
        (14, 14),
        (73, 2),  -- Existing employee_id
        (16, 16),
        (17, 1),   
        (18, 2),   
        (19, 3),   
        (74, 11),   -- Non-existent employee_id
        (21, 5),
        (22, 6),
        (23, 7),
        (24, 8),
        (75, 9),  -- Existing employee_id
        (26, 10),  
        (27, 11),
        (28, 12),
        (29, 13),
        (76, 4),  -- Non-existent employee_id
        (31, 15),
        (32, 16),
        (33, 1),   
        (34, 2),   
        (77, 6),   -- Non-existent employee_id
        (36, 4),   
        (37, 5),
        (78, 5),  -- Non-existent employee_id
        (79, 15),  -- Non-existent employee_id
        (80, 9);  -- Non-existent employee_id
        
/*Таблица roles
Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:*/
create table roles 
	(id serial primary key, 
	role_name int not null unique);

insert into roles(role_name)
    values 
        ('Junior Python developer'),
        ('Middle Python developer'),
        ('Senior Python developer'),
        ('Junior Java developer'),
        ('Middle Java developer'),
        ('Senior Java developer'),
        ('Junior JavaScript developer'),
        ('Middle JavaScript developer'),
        ('Senior JavaScript developer'),
        ('Junior Manual QA engineer'),
        ('Middle Manual QA engineer'),
        ('Senior Manual QA engineer'),
        ('Project Manager'),
        ('Designer'),
        ('HR'),
        ('CEO'),
        ('Sales manager'),
        ('Junior Automation QA engineer'),
        ('Middle Automation QA engineer'),
        ('Senior Automation QA engineer');

/*Таблица roles_employee
Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
Наполнить таблицу roles_employee 40 строками:*/
CREATE TABLE roles_employee (
    id serial PRIMARY KEY,
    employee_id int NOT NULL,
    role_id int NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

