--WITH averageSize(DepositGroup, average) as
--    (SELECT DepositGroup, AVG(MagicWandSize)
 SELECT [DepositGroup]  FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) IN(
	SELECT TOP(1) AVG(MagicWandSize) 
	FROM WizzardDeposits 
	GROUP BY DepositGroup 
	ORDER BY AVG(MagicWandSize))


