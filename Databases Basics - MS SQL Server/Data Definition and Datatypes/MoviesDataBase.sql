CREATE TABLE Directors
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	DirectorName varchar(100) NOT NULL,
	Notes varchar(max)
)

CREATE TABLE Genres
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	GenreName varchar(50),
	Notes varchar(max)
)

CREATE TABLE Categories
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	CategoryName varchar(50),
	Notes varchar(max)
)
  
  
  CREATE TABLE Movies
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Title varchar(100) NOT NULL,
	DirectorId int NOT NULL FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear date,
	Lenght NUMERIC(2,2),
	GenreId int NOT NULL FOREIGN KEY REFERENCES Genres(Id),
	CategoryId int NOT NULL FOREIGN KEY REFERENCES Categories(Id),
	Rating int,
	Notes varchar(max)
)
  
  INSERT INTO Directors(DirectorName) VALUES
('Steven Spielberg'),
('Martin Scorsese'),
('Alfred Hitchcock'),
('Stanley Kubrick'),
('Ridley Scott')


INSERT INTO Genres(GenreName) VALUES
('Drama'),
('War'),
('Crime'),
('Biography'),
('Thriller')

INSERT INTO Categories(CategoryName) VALUES
('Best Actor'),
('Best Story'),
('Best Music'),
('Best ScreenPlay'),
('Best Costumes')


INSERT INTO Movies(Title, DirectorId, GenreId, CategoryId, Rating) VALUES
('Saving Private Ryan', 1, 2, 1, 8),
('The Wolf of Wall Street', 2, 4, 4, 8),
('Psycho ', 3, 5, 3, 8),
('A Clockwork Orange', 4, 1, 5, 8),
('Alien', 5, 3, 2, 8)