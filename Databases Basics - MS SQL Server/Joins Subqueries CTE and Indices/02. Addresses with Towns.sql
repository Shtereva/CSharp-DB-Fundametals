SELECT TOP (50) FirstName,
  LastName,
  t.Name,
  a.AddressText 
  FROM Employees AS e
JOIN Addresses as a ON a.AddressID = e.AddressID
JOIN Towns as t ON a.TownID = t.TownID
ORDER BY FirstName, LastName