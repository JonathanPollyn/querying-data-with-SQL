/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014
GO

----------------------------------------------------------------------------------
-- Combining Sets with Set Operators - UNION and UNION ALL, INTERSECT,EXCEPT
----------------------------------------------------------------------------------

--UNION
SELECT JobTitle, Gender
FROM HumanResources.Employee  --290
UNION
SELECT FirstName, LastName
FROM Person.Person   --19972   --19609
ORDER BY JobTitle  --94 ROWS, 1111

SELECT FirstName, LastName
FROM Person.Person  
UNION
SELECT ' ', ' '
FROM HumanResources.Employee  
ORDER BY FirstName

--UNION ALL
SELECT JobTitle, Gender
FROM HumanResources.Employee  --290
UNION ALL
SELECT FirstName, LastName
FROM Person.Person   --19972   --20262

SELECT COUNT(*) TABLE1 FROM [HumanResources].[Department]
UNION ALL
SELECT COUNT(*) TABLE1 FROM [HumanResources].[Shift]

    