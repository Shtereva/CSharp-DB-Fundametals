CREATE TABLE People
(
	Id int NOT NULL PRIMARY KEY IDENTITY,
	Name nvarchar(200) NOT NULL,
	Picture image,
	Height numeric(18, 2),
	Weight numeric(18, 2),
	Gender char(1) NOT NULL CHECK (Gender IN ('m', 'f')),
	Birthday date NOT NULL,
	Biography nvarchar(max)
)
  
  INSERT INTO People (Name, Height, Weight, Gender, Birthday, Biography)
VALUES('Пешо', 185, 80, 'm', '2005-12-14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in facilisis mi. Vestibulum ac velit diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris iaculis iaculis commodo. Cras faucibus tempor mauris vitae pellentesque. Aenean ultricies quam nulla, bibendum eleifend lorem fermentum id. Integer nulla ipsum, tempus ac neque at, faucibus pulvinar eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla faucibus at erat ac molestie. Fusce quis nisi at elit aliquet lobortis. ')
  
  INSERT INTO People (Name, Height, Weight, Gender, Birthday, Biography)
VALUES('Sashka', 160, 55, 'm', '1986-01-13', 'Duis sed ornare quam. ')
  
  INSERT INTO People (Name, Height, Weight, Gender, Birthday, Biography)
VALUES('Georgi', 200, 90, 'm', '1995-06-18', 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas tincidunt scelerisque velit. Donec rhoncus, nisi at condimentum ultricies, nisl augue luctus mauris, quis dapibus sapien ante non turpis. Cras iaculis nisi et est vehicula, sagittis commodo nisi ornare. Proin tempor diam libero, nec volutpat metus malesuada eget. Phasellus accumsan nisl mauris, eget gravida eros fermentum vitae. Duis ex ex, vulputate vel nisl ac, tristique pellentesque nisl. Cras tempus convallis odio, non egestas libero sollicitudin eu. Nunc quis odio volutpat nibh scelerisque blandit non ut augue. ')
  
  INSERT INTO People (Name, Height, Weight, Gender, Birthday, Biography)
VALUES('Dancheto', 170, 90, 'f', '1963-10-30', 'Nullam urna velit, suscipit eget turpis in, dictum euismod purus.')
  
  INSERT INTO People (Name, Height, Weight, Gender, Birthday, Biography)
VALUES('Simona', 1, 3.55, 'f', '2017-09-19', 'I am new in this world')