CREATE DATABASE DigitalLibrary;

USE DigitalLibrary;

CREATE TABLE WriterMaster (
    WriterID INT PRIMARY KEY,
    WriterName VARCHAR(100),
    Nationality VARCHAR(50)
);

CREATE TABLE PublicationMaster (
    PubID INT PRIMARY KEY,
    PubTitle VARCHAR(120),
    WriterID INT,
    FOREIGN KEY (WriterID) REFERENCES WriterMaster(WriterID)
);

INSERT INTO WriterMaster VALUES
(1, 'Neil Gaiman', 'UK'),
(2, 'Margaret Atwood', 'Canada'),
(3, 'Paulo Coelho', 'Brazil');

INSERT INTO PublicationMaster VALUES
(201, 'American Gods', 1),
(202, 'The Handmaid''s Tale', 2),
(203, 'The Alchemist', 3),
(204, 'Coraline', 1);

SELECT 
    P.PubTitle AS Publication_Title,
    W.WriterName AS Author,
    W.Nationality
FROM 
    PublicationMaster P
JOIN 
    WriterMaster W ON P.WriterID = W.WriterID;

