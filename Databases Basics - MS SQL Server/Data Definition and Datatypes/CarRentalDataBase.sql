CREATE TABLE Categories
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	CategoryName nvarchar(50) NOT NULL,
	DailyRate money NOT NULL,
	WeeklyRate money NOT NULL,
	MontlyRate money NOT NULL,
	wEEKENDrATE MONEY not null
)

CREATE TABLE Cars
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	PlateNumber nvarchar(10) NOT NULL,
	Manufacturer varchar(50) NOT NULL,
	Model varchar(50) NOT NULL,
	CarYear int NOT NULL,
	CategoryId int NOT NULL FOREIGN KEY REFERENCES Categories(Id),
	Doors bit,
	Picture varbinary(max),
	Condition nvarchar(50),
	Avaible nvarchar(3) CHECK (Avaible IN ('Yes', 'No')),
)

CREATE TABLE Employees
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Title nvarchar(50),
	Notes nvarchar(max)
) 

CREATE TABLE Customers
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	DriverLicenceNumber VARCHAR(50) NOT NULL,
	FullName nvarchar(100) NOT NULL,
	Address nvarchar(250) NOT NULL,
	City nvarchar(100) NOT NULL,
	ZIPCode int NOT NULL,
	Notes nvarchar(max)
)

CREATE TABLE RentalOrders 
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	EmployeeId int NOT NULL FOREIGN KEY REFERENCES Employees(Id),
	CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(Id),
	CarId int NOT NULL FOREIGN KEY REFERENCES Cars(Id),
	TankLevel bit,
	KilometrageStart int NOT NULL,
	KilometrageEnd int NOT NULL,
	TotalKilometrage int NOT NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL,
	TotalDays int NOT NULL,
	RateApplied bit,
	TaxRate numeric(10,2),
	OrderStatus nvarchar(10),
	Notes nvarchar(max)
)

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MontlyRate, wEEKENDrATE) VALUES
('low class', 100, 600, 2500, 150),
('medium class', 200, 800, 3500, 250),
('high class', 300, 900, 5500, 350)


INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Avaible) VALUES
('PR26589RD', 'Mercedes', 'GL', 2016, 3, 'Yes'),
('565TE69', 'Toyota', 'Avensis', 2016, 2, 'Yes'),
('PR9875SE', 'Opel', 'Corsa', 2001, 1, 'No')

INSERT INTO Employees(FirstName, LastName) VALUES
('Ivan', 'Ivanov'),
('Petq', 'Petrova'),
('John', 'Malkovich')

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode) VALUES
('ASD56994DDA4DD4445AS', 'John Doe', '56 ASD blvd', 'New York', 2035),
('4566E444EETGGD56SSSD', 'Jane Doe', '34 DFG avn', 'Boston', 126),
('46565956565232655252', 'Ivan Georgiev', 'Ivan Vazov 3', 'Ruse', 7000)

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, KilometrageStart, KilometrageEnd,
 TotalKilometrage, StartDate, EndDate, TotalDays) VALUES
 (3, 1, 1, 10000, 20000, 5000000, '2016-05-12', '2016-06-12', 12),
 (2, 2, 3, 10000, 20000, 5000000, '2016-05-12', '2016-06-12', 12),
 (1, 3, 2, 10000, 20000, 5000000, '2016-05-12', '2016-06-12', 12)