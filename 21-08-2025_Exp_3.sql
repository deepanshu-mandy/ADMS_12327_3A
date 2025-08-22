-- Create Department Table
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
    );

-- CREATE Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

-- APROACH 01
SELECT d.dept_name, e.name, e. salary
FROM department d
INNER JOIN employee e
ON d.id = e.department_id
WHERE e.salary IN
(  SELECT MAX(salary)
   FROM employee 
   WHERE department_id = e.department_id
)
ORDER BY d.dept_name

-- APROACH 02
SELECT d.dept_name, e.name, e. salary
FROM department d
INNER JOIN employee e
ON d.id = e.department_id
WHERE e.salary IN
(  SELECT MAX(e2.salary)
   FROM employee AS e2
   GROUP BY e2.department_id
)
ORDER BY d.dept_name

/*
HARD QUESTION
*/

CREATE TABLE A
( EmpID INT PRIMARY KEY,
  Ename VARCHAR(50),
  Salary INT);

CREATE TABLE B
( EmpID INT PRIMARY KEY,
  Ename VARCHAR(50),
  Salary INT);

INSERT INTO A (EmpID, Ename, Salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO B (EmpID, Ename, Salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

/*
   PLACEMENT OF SQ:
      1. SQ WITH WHERE CLAUSE
      2. SQ WITH SELECT COMMAND (ALIAS)
      3. SQ WITH 

*/

SELECT EmpID, MIN(Ename), MIN(Salary) AS Salary
FROM
(
SELECT * FROM A
UNION ALL
SELECT * FROM B
) AS Intermediate_result
GROUP BY EmpID

-- GROUP BY: THE COL WHICH IS USED WITH GB WILL ALSO BE USED WITH SELECT COMMAND
-- VICE-VERSA ALSO APPLIES

-- MIN AND MAC ARE USED WITH ONLY NUMERIC DATA: WRONG

SELECT * FROM A

SELECT MIN(Ename) FROM A
SELECT MAX(Ename) FROM A
