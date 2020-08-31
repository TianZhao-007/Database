CREATE TABLE STUDENT (
    StudentID     integer PRIMARY KEY,
    Name    varchar(100),
    Age integer
);

INSERT INTO STUDENT (StudentID, Name, Age) VALUES (111, 'Eva', 20);
INSERT INTO STUDENT (StudentID, Name, Age) VALUES (222, 'Tom', 25);
INSERT INTO STUDENT (StudentID, Name, Age) VALUES (333, 'John', 35);
INSERT INTO STUDENT (StudentID, Name, Age) VALUES (444, 'Emily', 35);

CREATE TABLE COURSE (
    CourseNo     varchar(100) PRIMARY KEY,
    Name    varchar(100),
    Unit integer
);

INSERT INTO COURSE (CourseNo, Name, Unit) VALUES ('ECON2102', 'Economics', 6);
INSERT INTO COURSE (CourseNo, Name, Unit) VALUES ('COMP2400', 'Databases', 6);
INSERT INTO COURSE (CourseNo, Name, Unit) VALUES ('BUSN2011', 'Accounting', 6);

CREATE TABLE ENROL (
    StudentID    integer,
    CourseNo     varchar(100),
    Semester varchar(100),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseNo) REFERENCES COURSE(CourseNo),
    CONSTRAINT student_course_semester PRIMARY KEY(StudentID, CourseNo, Semester)
);

INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (111, 'BUSN2011', 'S2 2020');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (111, 'COMP2400', 'S2 2020');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (111, 'ECON2102', 'S2 2019');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (222, 'BUSN2011', 'S2 2020');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (222, 'COMP2400', 'S2 2020');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (333, 'BUSN2011', 'S2 2020');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (333, 'COMP2400', 'S2 2020');
INSERT INTO ENROL (StudentID, CourseNo, Semester) VALUES (333, 'ECON2102', 'S2 2020');


--Warmup exercises
--Select * vs Select...
SELECT * 
FROM Enrol;

SELECT StudentID, CourseNo, Semester
FROM Enrol;

--Count(*) vs Count(...)
-- The second one will not work
SELECT COUNT(*)
FROM Enrol;

SELECT COUNT(StudentID,CourseNo,Semester)
FROM Enrol;

SELECT COUNT(CourseNo)
FROM Enrol;


--Cartesian product
SELECT *
FROM Student,Course;

-- Left Join, Inner Join and Natural Join
SELECT *
FROM Student LEFT JOIN Enrol 
ON Student.StudentID=Enrol.StudentID;

SELECT *
FROM Student INNER JOIN Enrol 
ON Student.StudentID=Enrol.StudentID;

SELECT *
FROM Student NATURAL JOIN Enrol; 



-- How to write SQL queries

-- List the ids of students who enrolled in at least one course in S2 2020.
-- With and Without DISTINCT

SELECT StudentID
FROM Enrol
WHERE Semester='S2 2020';

SELECT DISTINCT StudentID
FROM Enrol
WHERE Semester='S2 2020';

-- How many students have enrolled in at least one course in S2 2020?
-- With and Without DISTINCT

SELECT COUNT(StudentID)
FROM Enrol
WHERE Semester='S2 2020';

SELECT COUNT(DISTINCT StudentID)
FROM Enrol
WHERE Semester='S2 2020';

-- List the ids of students who enrolled in at least one course in S2 2020.
-- Correct but not need to involve Student

SELECT DISTINCT Enrol.StudentID
FROM Enrol, Student
WHERE Semester='S2 2020' AND Enrol.StudentID = Student.StudentID;

SELECT DISTINCT Enrol.StudentID
FROM Enrol INNER JOIN Student
ON Enrol.StudentID = Student.StudentID
WHERE Semester='S2 2020';

-- List the ids of students and the course names that they enrolled in S2 2020. 

SELECT StudentID, Name
FROM Enrol, Course
WHERE Semester='S2 2020' AND Enrol.CourseNo = Course.CourseNo;

SELECT StudentID, Name
FROM Enrol INNER JOIN Course
ON Enrol.CourseNo = Course.CourseNo
WHERE Semester='S2 2020';

-- List the ids of students and the course names that they enrolled in S2 2020.
-- use alias

SELECT StudentID, Name
FROM Enrol e, Course c
WHERE Semester='S2 2020' AND e.CourseNo = c.CourseNo;

SELECT StudentID, Name
FROM Enrol e INNER JOIN Course c
ON e.CourseNo = c.CourseNo
WHERE Semester='S2 2020';

-- List the ids of students who enrolled in both COMP2400 and BUSN2011 in S2 2020.

SELECT StudentID
FROM Enrol
WHERE Semester='S2 2020'
AND CourseNo = 'COMP2400'
INTERSECT
SELECT StudentID
FROM Enrol
WHERE Semester='S2 2020'
AND CourseNo = 'BUSN2011';

-- List the ids of students and the total units (from enrolled courses) in S2 2020.

SELECT StudentID, SUM(Unit)
FROM Enrol NATURAL JOIN Course
WHERE Semester='S2 2020'
GROUP BY StudentID;

--Who take(s) two courses in S2 2020? List their IDs and ages.

SELECT StudentID, Age
FROM Enrol NATURAL JOIN Student
WHERE Semester='S2 2020'
GROUP BY StudentID, Age
HAVING COUNT(*)=2;

SELECT StudentID, Age
FROM Student NATURAL JOIN (SELECT StudentID
                           FROM Enrol 
                           WHERE Semester='S2 2020'
                           GROUP BY StudentID
                           HAVING COUNT(*)=2) SCC;


-- Who take(s) the largest number of courses in S2 2020? List their IDs.

WITH S2C AS
    (SELECT StudentID, COUNT(*) AS NoC
     FROM Enrol
     WHERE Semester='S2 2020'
     GROUP BY StudentID)
SELECT sc1.StudentID
FROM S2C sc1
WHERE sc1.NoC = (SELECT MAX(sc2.NoC)
                 FROM S2C sc2);