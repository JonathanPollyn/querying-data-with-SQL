/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO

--Return all the records from the Employee table
SELECT *
FROM HumanResources.Employee;

--Return all the records from the Person table
SELECT *
FROM Person.Person; --19972


--Return all the records from the Department table

SELECT *
FROM HumanResources.Department;

--Return the first name and last name from the person table

SELECT FirstName, LastName
FROM Person.Person;

--Return the job title, hiredate, Gender and marital status from the Employee table
SELECT 
	   JobTitle, HireDate, 
	   Gender, MaritalStatus
FROM HumanResources.Employee;

--Write a query to return the Address line 1 and the postal code from the address table
SELECT AddressLine1, PostalCode
FROM Person.Address;

--Using the result from the previous question, rewrite the address line to read
--Street address and the postal code to read ZipCode
SELECT AddressLine1 AS StreetAddress, 
		PostalCode AS ZipCode
FROM Person.Address;


--Write a query that will return the name and the modified date from the location table
--Please tell us where the column is coming from
SELECT LOC.Name, LOC.ModifiedDate
FROM Production.Location AS LOC;


-- Write a query that will retrun all the records from the CurrencyRate table
SELECT *
FROM Sales.CurrencyRate;


--Write a query that will return all the records from the specialoffer table
SELECT *
FROM Sales.SpecialOffer;



--Write a query that will return the Vendor name and the vendor account number 
--from the Vendor table
SELECT Name, AccountNumber
FROM Purchasing.Vendor;



--Using the query result from Q-3, write a query that will display the Vendor
--account number as "Account Number"
SELECT Name, AccountNumber AS 'AccountNumber'
FROM Purchasing.Vendor;



