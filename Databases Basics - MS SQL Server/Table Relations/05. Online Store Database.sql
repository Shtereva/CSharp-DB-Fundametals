CREATE TABLE Cities (
	CityID int PRIMARY KEY IDENTITY,
	Name varchar(50)
	)

CREATE TABLE Customers (
	CustomerID int PRIMARY KEY IDENTITY,
	Name varchar(50),
	Birthday date,
	CityID int FOREIGN KEY REFERENCES Cities(CityID)
	)

CREATE TABLE Orders (
	OrderID int PRIMARY KEY IDENTITY,
	CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID)
	)

CREATE TABLE ItemTypes (
	ItemTypeID int PRIMARY KEY IDENTITY,
	Name varchar(50)
	)

CREATE TABLE Items (
	ItemID int PRIMARY KEY IDENTITY,
	Name varchar(50),
	ItemTypeID int FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
	)


CREATE TABLE OrderItems (
	OrderID int,
	ItemID int,
	CONSTRAINT PK_Order_Item
	PRIMARY KEY (OrderID, ItemID),
	CONSTRAINT FK_OrderItems_Items
	FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
	CONSTRAINT FK_OrderItems_Orders
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
	)