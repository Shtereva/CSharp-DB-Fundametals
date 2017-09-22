CREATE TABLE Users
(
	Id bigint NOT NULL PRIMARY KEY IDENTITY,
	Username varchar(30) NOT NULL UNIQUE,
	Password varchar(26) NOT NULL,
	ProfilePicture varbinary(1000),
	LastLoginName varchar(30),
	isDeleted varchar(5) CHECK(isDeleted IN ('true', 'false'))
)
  
  INSERT INTO Users(Username, Password, LastLoginName, isDeleted)
VALUES('Pesho', '123456', 'Pesho', 'false')
  
  INSERT INTO Users(Username, Password, LastLoginName, isDeleted)
VALUES('Gosho', 'asdfgh', 'Pesho', 'true')
  
  INSERT INTO Users(Username, Password, LastLoginName, isDeleted)
VALUES('Maya', 'qwerty', 'Maya', 'true')
  
  INSERT INTO Users(Username, Password, LastLoginName, isDeleted)
VALUES('Milka', 'zxxcvbn', 'Milka', 'false')
  
  INSERT INTO Users(Username, Password, LastLoginName, isDeleted)
VALUES('Gabriel', 'asa23wde', 'The Americans', 'false')