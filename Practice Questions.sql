USE ORG;
SHOW TABLES;
SELECT * FROM worker;
SELECT * FROM bonus;
SELECT * FROM title;
DESC bonus;
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT(DEPARTMENT) FROM worker;
SELECT DEPARTMENT FROM worker GROUP BY DEPARTMENT;
-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,'b') FROM worker WHERE FIRST_NAME='Amitabh';
SELECT POSITION('b' IN FIRST_NAME) FROM worker WHERE FIRST_NAME = 'Amitabh';
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT RTRIM(DEPARTMENT) FROM worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT(DEPARTMENT),LENGTH(DEPARTMENT) AS LEN FROM worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLET_NAME FROM worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM worker ORDER BY FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM worker ORDER BY FIRST_NAME ASC,DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM worker WHERE FIRST_NAME='Vipul' OR FIRST_NAME='Satish';

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM worker WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM worker WHERE DEPARTMENT='Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM worker WHERE FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM worker WHERE FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM worker WHERE FIRST_NAME LIKE '%h' AND LENGTH(FIRST_NAME)=6;

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM worker WHERE SALARY BETWEEN 100000 AND 500000;

-- -- Q-20. Write an SQL query to print details of the Workers who have joined in Feb 2014.
SELECT * FROM worker WHERE MONTH(JOINING_DATE)=02 AND YEAR(JOINING_DATE)=2014;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(DEPARTMENT) FROM worker WHERE DEPARTMENT='Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT FIRST_NAME,LAST_NAME FROM worker WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM worker GROUP BY DEPARTMENT ORDER BY COUNT(DEPARTMENT) DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT worker.* FROM worker INNER JOIN title ON worker.WORKER_ID=title.WORKER_REF_ID WHERE title.WORKER_TITLE='Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE,COUNT(WORKER_TITLE) FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT(WORKER_TITLE)>1;
SELECT * FROM WORKER;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2)=1;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2)=0;

-- Q-28. Write an SQL query to clone a new table from another table.CREATE TABLE worker_clone LIKE worker;
CREATE TABLE WORKER_CLONE LIKE WORKER;
SELECT * FROM WORKER_CLONE;
INSERT INTO WORKER_CLONE (SELECT * FROM WORKER);

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT WORKER.* FROM WORKER INNER JOIN WORKER_CLONE ON WORKER.WORKER_ID=WORKER_CLONE.WORKER_ID;

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT WORKER.* FROM WORKER LEFT JOIN WORKER_CLONE ON WORKER.WORKER_ID=WORKER_CLONE.WORKER_ID WHERE WORKER_CLONE.WORKER_ID IS NULL;
-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
select curdate();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM WORKER;
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT W1.SALARY FROM WORKER AS W1 WHERE 5=(SELECT COUNT(W2.SALARY) FROM WORKER AS W2 WHERE W2.SALARY>=W1.SALARY);

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT W1.SALARY FROM WORKER AS W1 WHERE 5=(SELECT COUNT(W2.SALARY) FROM WORKER AS W2 WHERE W2.SALARY>=W1.SALARY);

-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT SALARY,COUNT(WORKER_ID) FROM WORKER GROUP BY SALARY;
SELECT W1.*,W2.* FROM WORKER AS W1 INNER JOIN WORKER AS W2 ON W1.SALARY=W2.SALARY WHERE W1.WORKER_ID!=W2.WORKER_ID;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT W1.SALARY FROM WORKER AS W1 WHERE 2=(SELECT COUNT(W2.SALARY) FROM WORKER AS W2 WHERE W2.SALARY>=W1.SALARY);

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM WORKER
UNION ALL
SELECT * FROM WORKER;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT * FROM BONUS;
SELECT * FROM WORKER;
SELECT W.WORKER_ID FROM WORKER AS W LEFT JOIN BONUS AS B ON W.WORKER_ID=B.WORKER_REF_ID WHERE B.WORKER_REF_ID IS NULL;

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT COUNT(DISTINCT(WORKER_ID)) FROM WORKER;

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.


-- Q-43. Write an SQL query to fetch the first row of a table.


-- Q-44. Write an SQL query to fetch the last five records from a table.


-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT DEPARTMENT,MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery


-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.


-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery


-- Q-48. Write an SQL query to fetch nth max salaries from a table.


-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.


-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.select first_name, salary from worker where salary = (select max(Salary) from worker);
