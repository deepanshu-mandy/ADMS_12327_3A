CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Data_tbl (
    EmpID INT,
    RecordYear INT,
    Revenue INT
);

CREATE TABLE Requests (
    EmpID INT,
    RecordYear INT
);

INSERT INTO Data_tbl (EmpID, RecordYear, Revenue)
VALUES
(10, 2021, 500),
(20, 2022, 700),
(30, 2020, 300),
(10, 2022, 550),
(40, 2019, 600),
(50, 2018, 200),
(20, 2021, 650),
(30, 2021, 0);

INSERT INTO Requests (EmpID, RecordYear)
VALUES
(10, 2022),
(40, 2019),
(50, 2018),
(20, 2020),
(20, 2021),
(20, 2022),
(30, 2021);

SELECT
    r.EmpID,
    r.RecordYear,
    ISNULL(d.Revenue, 0) AS Revenue
FROM
    Requests r
LEFT JOIN
    Data_tbl d ON r.EmpID = d.EmpID AND r.RecordYear = d.RecordYear;
