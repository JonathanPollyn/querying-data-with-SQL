/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO


--=================================================
--WINDOWS FUNCTION
--=================================================
SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   SUM(TaxAmt) AS TaxAmt
FROM Sales.SalesOrderHeader   --31465   -- 31406
GROUP BY CustomerID,DueDate,OrderDate
--OVER()

--TYPE OF WINDOWS FUNCTION

--1 Aggregate - 
--2 Ranking
--3 Offset
--=================================================
--1 Aggregate    --PARTITION BY
SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   SUM(TaxAmt) OVER() AS TaxAmt
FROM Sales.SalesOrderHeader   --31465  10186974.4602  10186974.4602

SELECT SUM(TaxAmt)
FROM Sales.SalesOrderHeader 
--===================================================
SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   SUM(TaxAmt) OVER(PARTITION BY CustomerID ORDER BY OrderDate,DueDate) AS TaxAmt
FROM Sales.SalesOrderHeader 
--===================================================
SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   SUM(TaxAmt) OVER(PARTITION BY CustomerID) AS CustomerTotal,
	   SUM(TaxAmt) OVER() AS GrandTotal
FROM Sales.SalesOrderHeader 

--2 Ranking --ROW_NUMBER, RANK, DENSE_RANK, NTILE
SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   TaxAmt,
	   ROW_NUMBER() OVER(ORDER BY TaxAmt) AS rowNumber,
	   RANK() OVER(ORDER BY TaxAmt) AS Ranking,
	   DENSE_RANK() OVER(ORDER BY TaxAmt) AS DenseRank,
	   NTILE(100) OVER(ORDER BY TaxAmt) AS Nitle
FROM Sales.SalesOrderHeader 
--==========================================================

SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   TaxAmt,
	   ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY TaxAmt) AS rowNumber
FROM Sales.SalesOrderHeader 

--3 Offset  -- LAG, LEAD , FIRST_VALUE and LAST_VALUE

SELECT CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   TaxAmt,
	   LAG(TaxAmt)  OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS Previous_Value,
	   LEAD(TaxAmt)  OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS Next_Value
FROM Sales.SalesOrderHeader 

--WINDOW FRAME
--UNBOUNDED PRECEDING
--UNBOUNDED FOLLOWING
--CURRENT ROW
--==============================================================
SELECT 
	   CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   TaxAmt,
	   FIRST_VALUE(TaxAmt) OVER(PARTITION BY CUSTOMERID 
			ORDER BY OrderDate
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS First_Value,
	   LAST_VALUE(TaxAmt) OVER(PARTITION BY CUSTOMERID 
			ORDER BY OrderDate
			ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS Last_Value
FROM Sales.SalesOrderHeader 
