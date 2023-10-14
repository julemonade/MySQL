**Welcome to my GitHub repository dedicated to MySQL!**  
Here, you will find two collections of files related to databases and SQL queries. This repository is divided into two folders, by courses where I studied. 

In **A. Rusau folder** contains two important database files:
- Hogwarts characters
- Hogwarts library

In addition to the database files, this repository also includes two SQL query files:
- Homework 1
- Homework 2

 These SQL query files contain the queries I wrote to accomplish specific tasks to the Characters and Library databases. 
 
 Here is an example of query that you can find opening one of the homework files:
 ```mysql
 /*Display the IDs and names of all Patronuses in alphabetical order, provided that they exist or are known*/
SELECT char_id, fname, patronus
FROM characters
WHERE patronus IS NOT NULL AND NOT patronus = 'Unknown'
ORDER BY patronus ASC;
```

In **V. Ksendzov folder** contains three SQL query files:
- Homework 1 (DDL quieries)
- Homework 2 (Quieries to Database with students data)
- Homework 3 (Quieries to Database created in Homework 1)

Here is an example of query that you can find opening one of the homework files:
 ```mysql
 /*   */
SELECT monthly_salary,employee_name
FROM salary
LEFT JOIN employee_salary ON salary.id = employee_salary.salary_id
LEFT JOIN employees ON employee_salary.employee_id = employees.id
WHERE employees.employee_name IS null and salary.monthly_salary < 2000;
```
