CREATE DATABASE AcademyDB;

USE AcademyDB;

CREATE TABLE TBL_Division (
    division_id INT PRIMARY KEY,
    division_name VARCHAR(100)
);

CREATE TABLE TBL_Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    division_id INT,
    FOREIGN KEY (division_id) REFERENCES TBL_Division(division_id)
);

INSERT INTO TBL_Division (division_id, division_name) VALUES
(1, 'Information Technology'),
(2, 'Civil Engineering'),
(3, 'Electronics'),
(4, 'Physics'),
(5, 'Statistics');

INSERT INTO TBL_Subject (subject_id, subject_name, division_id) VALUES
(201, 'Programming Basics', 1),
(202, 'Database Systems', 1),
(203, 'Operating Systems', 1),
(204, 'Building Design', 2),
(205, 'Construction Materials', 2),
(206, 'Signals and Systems', 3),
(207, 'Microprocessors', 3),
(208, 'Quantum Mechanics', 4),
(209, 'Probability Theory', 5),
(210, 'Statistical Methods', 5);

CREATE LOGIN academy_user WITH PASSWORD = 'Secure@123';
CREATE USER academy_user FOR LOGIN academy_user;

GRANT SELECT ON TBL_Subject TO academy_user;

SELECT division_name
FROM TBL_Division
WHERE division_id IN (
    SELECT division_id
    FROM TBL_Subject
    GROUP BY division_id
    HAVING COUNT(subject_id) > 2
);

