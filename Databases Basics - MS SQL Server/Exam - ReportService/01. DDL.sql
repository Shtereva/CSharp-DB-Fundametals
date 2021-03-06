CREATE TABLE Departments (
	Id INT  PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL
	) 

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	Departmentid INT FOREIGN KEY REFERENCES Departments(Id)
	) 

CREATE TABLE [Status](
	Id INT PRIMARY KEY IDENTITY,
	Label VARCHAR(30) NOT NULL
)

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(25),
	LastName NVARCHAR(25),
	Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
	BirthDate datetime2,
	Age INT,
	DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments(Id)
	)

CREATE TABLE Users(
	Id INT  PRIMARY KEY IDENTITY,
	Username NVARCHAR(30) NOT NULL UNIQUE,
	[Password] NVARCHAR(50) NOT NULL,
	[Name] NVARCHAR(50),
	Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
	BirthDate DATETIME2,
	Age INT,
	Email NVARCHAR(50) NOT NULL
	)

CREATE TABLE Reports(
	Id INT PRIMARY KEY IDENTITY,
	CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(Id),
	StatusId INT NOT NULL FOREIGN KEY REFERENCES [Status](Id),
	OpenDate DATETIME2 NOT NULL,
	CloseDate DATETIME2,
	[Description] VARCHAR(200),
	UserId INT NOT NULL FOREIGN KEY REFERENCES Users(Id),
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id)
	)

