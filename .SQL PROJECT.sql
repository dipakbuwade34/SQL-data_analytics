USE company_db;

USE dipak;

SHOW TABLES;

SELECT * FROM departments;

SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT d.dept_name,
       MAX(e.salary) AS highest_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

DESCRIBE employees;

CREATE DATABASE sql_project;

USE sql_project;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance'),
(104,'Sales'),
(105,'Marketing');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees
(emp_id, emp_name, age, gender, dept_id, salary)
VALUES
(1,'Rahul',24,'Male',101,35000),
(2,'Priya',26,'Female',102,45000),
(3,'Amit',28,'Male',103,55000),
(4,'Neha',25,'Female',104,40000),
(5,'Rohan',30,'Male',105,60000),
(6,'Anjali',27,'Female',102,48000),
(7,'Vikas',29,'Male',101,38000),
(8,'Pooja',23,'Female',103,52000);

SELECT * FROM employees;

SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT d.dept_name,
COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT emp_name, salary
FROM employees
WHERE salary = (
SELECT MAX(salary)
FROM employees
);

SELECT AVG(salary) AS average_salary
FROM employees;

SELECT emp_name, salary
FROM employees
WHERE salary > 50000;