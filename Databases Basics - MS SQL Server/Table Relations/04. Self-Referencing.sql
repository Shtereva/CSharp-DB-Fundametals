CREATE TABLE Teachers (
	TeacherID int PRIMARY KEY,
	Name varchar(50),
	ManagerID int FOREIGN KEY REFERENCES Teachers(TeacherID)
	)

	INSERT INTO Teachers(TeacherID, Name, ManagerID)
	VALUES
	(101, 'John', NULL),
	(102, 'Maya', 106),
	(103, 'Silvia', 106),
	(104, 'Ted', 105),
	(105, 'Mark', 101),
	(106, 'Greta', 101)