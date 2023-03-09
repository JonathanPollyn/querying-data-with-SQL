/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO


---------------------------------------------------------------------
--Filtering data with predicates
---------------------------------------------------------------------
--Working with string all records where the first name is "Myer
SELECT *
FROM Person.Person
WHERE FirstName = 'Myer';


--Return all the records from the person table that have first name as Roberto
SELECT *
FROM Person.Person
WHERE FirstName = 'Roberto';

--Return all the records from the Department table that have department ID of 16 
SELECT *
FROM HumanResources.Department
WHERE DepartmentID = 16;

--Reture the unit price and order quantity from the SalesOrderDetail that have unit price of 5.70
SELECT [UnitPrice], OrderQty
FROM Sales.SalesOrderDetail
WHERE UnitPrice = '5.70';  


--Reture the unit price and order quantity from the SalesOrderDetail that do not have unit price of 5.70
SELECT UnitPrice, OrderQty
FROM Sales.SalesOrderDetail
WHERE UnitPrice <> '5.70';

SELECT UnitPrice, OrderQty
FROM Sales.SalesOrderDetail
WHERE UnitPrice != '5.70';

--Reture the job title and modified date from the Employee for those who job titles are Design Engineer
SELECT JobTitle, ModifiedDate
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'

--Return the personID, StoreID and Territory ID from the Customer table for those with store ID 642,644,620,1022
SELECT PersonID, 
	   StoreID, 
	   TerritoryID
FROM [Sales].[Customer] 
WHERE StoreID IN (642,644,620,1022);  


--Return the personID, StoreID and Territory ID from the Customer table for those that do not have store ID 642,644,620,1022
SELECT PersonID, 
	   StoreID, 
	   TerritoryID
FROM [Sales].[Customer]  
WHERE StoreID NOT IN (642,644,620,1022);  

--Return all the records from the SalesOrderDetail for only unit price grater than 2024.994
SELECT *
FROM Sales.SalesOrderDetail
WHERE UnitPrice > '2024.994';


--Return all the records from the SalesOrderDetail for only unit price less than or equal to 2024.994 and have product ID equal to 771
SELECT *
FROM Sales.SalesOrderDetail
WHERE UnitPrice <= '2024.994' AND ProductID = 771;


/*
Return all the records from the SalesOrderDetail for those that product ID equal to 11771 or have unit price less than or
equal to 2024.994
*/
SELECT *
FROM Sales.SalesOrderDetail
WHERE ProductID = 11771 OR UnitPrice <= '2024.994';




/*
Return a unique record of the FirstName, LastName, MiddleName
from the person table that have first name as kim
*/
SELECT DISTINCT FirstName, 
			LastName, 
			MiddleName
FROM Person.Person  
WHERE FirstName = 'Kim'


--Return the JobTitle, ModifiedDate that have job title as Design Engineer
SELECT JobTitle, ModifiedDate
FROM HumanResources.Employee
WHERE JobTitle = N'Design Engineer'


--==============================================================
--Working with the LIKE Operator
--==============================================================
--Return all the records from the Person that have first name starting with Ke
SELECT *
FROM Person.Person
WHERE FirstName LIKE 'KE%'


--Return all the records from the Person that have first name ending in T
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%T'


--Return all the records from the Person that have first name ending in vin
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%VIN'

--Return all the records from the Person that who have first name containing vin
SELECT *
FROM Person.Person
WHERE FirstName LIKE '%VIN%'


--====================================
--Handling NULLs incorrectly
--====================================
--This is the wrong way to work with NULL values
SELECT MiddleName
FROM Person.Person
WHERE MiddleName = NULL


--This is the wrong way to work with NULL values
SELECT MiddleName
FROM Person.Person
WHERE MiddleName <> NULL

--======================================
--Resolving NULL problems
--======================================
--Return the middle name that are not known
SELECT MiddleName
FROM Person.Person
WHERE MiddleName IS NULL

--Return the middle name that are known
SELECT MiddleName
FROM Person.Person
WHERE MiddleName IS NOT NULL

