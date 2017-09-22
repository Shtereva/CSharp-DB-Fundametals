CREATE TABLE Employees 
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Firstname nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Title nvarchar(50) NOT NULL,
	Notes nvarchar(max)
)

CREATE TABLE Customers
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	AccountNumber varchar(10) NOT NULL,
	Firstname nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	EmergencyName nvarchar(50),
	EmergencyNumber varchar(20),
	Notes nvarchar(max)
)

CREATE TABLE RoomStatus 
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	RoomStatus  nvarchar(20) NOT NULL,
	Notes nvarchar(max)
)

CREATE TABLE RoomTypes
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	RoomType nvarchar(50),
	Notes nvarchar(max)
)

CREATE TABLE BedTypes
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	BedType nvarchar(50),
	Notes nvarchar(max)
)

CREATE TABLE Rooms
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	RoomNumber int NOT NULL,
	RoomType int NOT NULL FOREIGN KEY REFERENCES RoomTypes(Id),
	BedType int NOT NULL FOREIGN KEY REFERENCES BedTypes(Id),
	Rate int,
	RoomStatus int NOT NULL FOREIGN KEY REFERENCES RoomStatus(Id),
	Notes nvarchar(max)
)

CREATE TABLE Payments
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
	PaymentDate date NOT NULL,
	AccountNumber int NOT NULL FOREIGN KEY REFERENCES Customers(Id),
	FirstDateOccupied date,
	LastDateOccupied date,
	TotalDays int,
	AmountCharged decimal(10,2),
	TaxRate decimal(10,2),
	TaxAmount decimal(10,2),
	PaymentTotal decimal(10,2),
	Notes nvarchar(max)
)

CREATE TABLE Occupancies 
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
	DateOccupied date,
	AccountNumber int NOT NULL FOREIGN KEY REFERENCES Customers(Id),
	RoomNumber int NOT NULL FOREIGN KEY REFERENCES Rooms(Id),
	RateApplied int,
	PhoneCharge decimal(10,2),
	Notes nvarchar(max)
)
  
  INSERT INTO Employees(Firstname, LastName, Title) VALUES
('Ivan', 'Ivanov', 'Manager'),
('Sasho', 'Velikov', 'Receptionist'),
('Eli', 'Popova', 'HR')

INSERT INTO Customers(AccountNumber, Firstname, LastName, PhoneNumber) VALUES
('BG26RBB655', 'Gosho', 'Rusev', '+359/889 658-741'),
('BG26RBB112', 'Pesho', 'Stoyanov', '+359/889 658-741'),
('BG26RBB956', 'Petq', 'Petrova', '+359/889 658-741')

INSERT INTO RoomStatus(RoomStatus) VALUES
('free'),
('occupied'),
('for cleaning')

INSERT INTO RoomTypes(RoomType) VALUES
('room'),
('studio'),
('apartment')

INSERT INTO BedTypes(BedType) VALUES
('small'),
('medium'),
('king size')

INSERT INTO Rooms(RoomNumber, RoomType, BedType, RoomStatus) VALUES
(1, 3, 3, 1),
(22, 2, 2, 2),
(13, 1, 1, 1)

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, PaymentTotal) VALUES
(2, '2013-12-16', 3, 256.35),
(3, '2013-12-16', 1, 256.35),
(1, '2013-12-16', 2, 256.35)

INSERT INTO Occupancies(EmployeeId, AccountNumber, RoomNumber) VALUES
(1, 3, 2),
(2, 2, 1),
(3, 1, 3)