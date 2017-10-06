CREATE TABLE Students
(
	StudentID INT PRIMARY KEY,
	Name varchar(50)
)

CREATE TABLE Exams (
	ExamID INT PRIMARY KEY,
	Name varchar(50)
	)

CREATE TABLE StudentsExams
(
	StudentID int,
	ExamID int,
	CONSTRAINT PK_Student_Exam
	PRIMARY KEY(StudentID, ExamID),
	CONSTRAINT FK_StudentsExams_Students
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentsExams_Exams
	FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
)
 

 
INSERT INTO Students(StudentID, Name)
VALUES 
(1, 'Mila'),
(2, 'Toni'),
(3, 'Ron')
 
INSERT INTO Exams(ExamID, Name)
VALUES 
(101, 'SpringMVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g')

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)