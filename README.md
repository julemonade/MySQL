**Welcome to my GitHub repository dedicated to MySQL!**  
Here, you will find a collection of files related to databases and SQL queries. 
This repository contains two important database files:
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
