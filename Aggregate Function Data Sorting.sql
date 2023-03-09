/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO  

--------------------------------------------------------------------
--GROUP BY
--------------------------------------------------------------------

SELECT FirstName
FROM Person.Person  --19972
WHERE FirstName = 'KIM'
GROUP BY FirstName  --1018



---------------------------------------------------------------------
-- Sorting data
---------------------------------------------------------------------
--Sorting in an Ascending order
SELECT  LastName, FirstName
FROM Person.Person
ORDER BY LastName ASC;

--Sort records descending order
SELECT  LastName, FirstName
FROM Person.Person
ORDER BY FirstName DESC;

--Sorting by the ModifiedDate in an Ascending order
SELECT ModifiedDate, LastName, 
		FirstName
FROM Person.Person
ORDER BY ModifiedDate ASC;

--Sorting the UnitPrice in an ascending order
SELECT ProductID, UnitPrice
FROM Sales.SalesOrderDetail
ORDER BY UnitPrice ASC;  --121317

---------------------------------------------------------------------
-- Demo: Filtering Data with TOP and FETCH-OFFSET
---------------------------------------------------------------------
--Get the top 5 records pay attention to the result when you did not including the order by
SELECT TOP (5) LastName, FirstName
FROM Person.Person;

--Get the top 5 records  
SELECT TOP (5) ProductID, UnitPrice
FROM Sales.SalesOrderDetail
ORDER BY ProductID ASC;

SELECT TOP (5) ProductID, UnitPrice
FROM Sales.SalesOrderDetail
ORDER BY ProductID DESC;
GO

--Get the top 10 records  
SELECT TOP (10) ProductID, UnitPrice
FROM Sales.SalesOrderDetail
ORDER BY UnitPrice DESC;
GO

SELECT TOP (1) PERCENT LastName, FirstName
FROM Person.Person;  --19972

--Return the first one percent
SELECT TOP (1) PERCENT LastName, FirstName
FROM Person.Person  --19972
ORDER BY FirstName ASC;
GO

--Return the top 5 records with ties
SELECT TOP (5) WITH TIES LastName, FirstName
FROM Person.Person
ORDER BY FirstName ASC

--Return the second lowest records
SELECT LastName, FirstName
FROM Person.Person
ORDER BY LastName
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY

--Return the second lowest records
SELECT ProductID, UnitPrice
FROM Sales.SalesOrderDetail 
ORDER BY UnitPrice ASC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY

---------------------------------------------------------------------
-- Demo: Aggregate Functions
---------------------------------------------------------------------
--Return the sum of tax amount by each customer ID
--SUM
SELECT SUM(TaxAmt) AS TotalTaxAmt, CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID

--Return the total records from the SalesOrderHeader table
SELECT COUNT(*) AS RecordCount
FROM Sales.SalesOrderHeader 

--Return the total occurance of each customer ID
SELECT COUNT(*) AS RecordCount, CustomerID
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID

--Return the the customers who have placed only one order
SELECT COUNT(*) AS RecordCount, CustomerID
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID
HAVING COUNT(*) < 2

--Return all the duplicate customer id from the SalesOrderHeader table
SELECT COUNT(*) AS DupCount, customerID
FROM Sales.SalesOrderHeader
GROUP BY customerID
HAVING COUNT(*) > 1

--Return the minimum subtotal from the SalesOrderHeader
SELECT MIN(SubTotal)
FROM Sales.SalesOrderHeader

--Return the minimum sub total of each customer ID
SELECT MIN(SubTotal) AS MinimumVal, customerID
FROM Sales.SalesOrderHeader
GROUP BY customerID

--Return the first customer ID who placed order from the SalesOrderHeader table
SELECT MIN(OrderDate) AS MinimumVal, customerID
FROM Sales.SalesOrderHeader
GROUP BY customerID

--Return the maximum subtotal from the SalesOrderHeader
SELECT MAX(SubTotal)
FROM Sales.SalesOrderHeader

--Return the maximum and maximum subtotal of each customer who placed order
-- from the SalesOrderHeader
SELECT MIN(SubTotal) AS MinimumVal,
		 MAX(SubTotal) AS MaxVal, 
		 customerID
FROM Sales.SalesOrderHeader
GROUP BY customerID


--Return the average sub total
--AVG
SELECT AVG(SubTotal)
FROM Sales.SalesOrderHeader

--Return the average sub total spent by each customer
SELECT AVG(SubTotal), customerID
FROM Sales.SalesOrderHeader
GROUP BY customerID





