/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	  (SELECT MountainRange FROM Mountains WHERE MountainRange = 'Rila') AS [MountainRange],	
      [PeakName] ,
	  [Elevation]
  FROM Peaks
  WHERE MountainId = 17
  ORDER BY Elevation DESC

 