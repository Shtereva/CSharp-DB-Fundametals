SELECT FirstName, Age, PhoneNumber FROM Customers
WHERE (Age >= 21 AND FirstName like '%an%') OR (RIGHT(PhoneNumber, 2) = 38 AND CountryId <> 31)
ORDER BY FirstName, Age DESC