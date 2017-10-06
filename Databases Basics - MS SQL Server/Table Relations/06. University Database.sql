CREATE TABLE Majors (
	MajorID int PRIMARY KEY IDENTITY,
	Name varchar(50)
	)

CREATE TABLE Students (
	StudentID int PRIMARY KEY IDENTITY,
	StudentNumber int,
	StudentName varchar(50),
	MajorID int FOREIGN KEY REFERENCES Majors(MajorID)
	)

CREATE TABLE Payments (
	PaymentID int PRIMARY KEY IDENTITY,
	PaymentDate date,
	PaymentAmount decimal(10, 2),
	StudentID int FOREIGN KEY REFERENCES Students(StudentID)
	)


CREATE TABLE Subjects (
	SubjectID int PRIMARY KEY IDENTITY,
	SubjectName varchar(50)
	)


CREATE TABLE Agenda (
	StudentID int,
	SubjectID int,
	CONSTRAINT PK_Order_Item
	PRIMARY KEY (StudentID, SubjectID),
	CONSTRAINT FK_Agenda_Students
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_Agenda_Subjects
	FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
	)