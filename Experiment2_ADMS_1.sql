CREATE DATABASE Organization;
USE Organization;

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    team VARCHAR(50),
    supervisor_id INT
);

INSERT INTO Staff (staff_id, staff_name, team, supervisor_id) VALUES
(101, 'Riya', 'Marketing', NULL),
(102, 'Aman', 'Sales', 101),
(103, 'Neha', 'Tech', 101),
(104, 'Tarun', 'Sales', 102),
(105, 'Kavya', 'Tech', 103),
(106, 'Anil', 'Marketing', 101);

SELECT 
s.staff_name AS Employee,
s.team AS Team,
sp.staff_name AS Supervisor,
sp.team AS SupervisorTeam
FROM 
Staff s
LEFT JOIN Staff sp ON s.supervisor_id = sp.staff_id;
