/***********************************************************************************************
NAME: AdventureWorks SQL Answers - W3.4
PURPOSE: Answer 8 AdventureWorks questions for IT143 Week 3 Assignment
MODIFICATION LOG:
Ver     Date        Author      Description
-----   ----------  ---------   -------------------------------------------------------------------
1.0     02/07/2026  BLB        Completed assignment 3.4 with all 8 questions answered
RUNTIME: Depends on SQL Server execution
NOTES: 
- All queries tested in SSMS 2022 with AdventureWorks 2022 OLTP sample database
- Queries are formatted for readability and follow SQL best practices
***********************************************************************************************/

/*----------------------------------------
-- Q1: Business User question - Marginal complexity
-- Author: BLB
-- Question: What are the five most expensive products based on list price in the Production.Product table?
----------------------------------------*/
SELECT TOP 5 
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;


/*----------------------------------------
-- Q2: Business User question - Marginal complexity
-- Author: BLB
-- Question: How many employees are currently listed in the HumanResources.Employee table?
----------------------------------------*/
SELECT COUNT(*) AS TotalEmployees
FROM HumanResources.Employee;


/*----------------------------------------
-- Q3: Business User question - Moderate complexity
-- Author: BLB
-- Question: Identify the five least profitable products per unit sold based on list price vs. standard cost.
----------------------------------------*/
SELECT TOP 5 
    p.Name,
    (p.ListPrice - p.StandardCost) AS ProfitPerUnit
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name, p.ListPrice, p.StandardCost
ORDER BY ProfitPerUnit ASC;


/*----------------------------------------
-- Q4: Business User question - Moderate complexity
-- Author: BLB
-- Question: Determine which customer territories generated the highest total sales revenue last year.
----------------------------------------*/
SELECT 
    c.TerritoryID,
    SUM(od.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader sh
JOIN Sales.SalesOrderDetail od ON sh.SalesOrderID = od.SalesOrderID
JOIN Sales.Customer c ON sh.CustomerID = c.CustomerID
WHERE YEAR(sh.OrderDate) = YEAR(GETDATE()) - 1
GROUP BY c.TerritoryID
ORDER BY TotalRevenue DESC;


/*----------------------------------------
-- Q5: Business User question - Increased complexity
-- Author: BLB
-- Question: Monthly summary of road bike sales performance in 2013 (quantity, revenue, standard cost, net revenue).
----------------------------------------*/
SELECT 
    DATENAME(MONTH, sh.OrderDate) AS OrderMonth,
    p.Color,
    SUM(sod.OrderQty) AS QuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue,
    SUM(sod.OrderQty * p.StandardCost) AS TotalStandardCost,
    SUM(sod.LineTotal - (sod.OrderQty * p.StandardCost)) AS EstimatedNetRevenue
FROM Sales.SalesOrderHeader sh
JOIN Sales.SalesOrderDetail sod ON sh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE p.ProductSubcategoryID IN (SELECT ProductSubcategoryID 
                                FROM Production.ProductSubcategory 
                                WHERE Name LIKE '%Road%')
  AND YEAR(sh.OrderDate) = 2013
GROUP BY DATENAME(MONTH, sh.OrderDate), p.Color
ORDER BY OrderMonth, p.Color;


/*----------------------------------------
-- Q6: Business User question - Increased complexity
-- Author: BLB
-- Question: Yearly comparison of employee sales performance (total sales, orders, average revenue per order)
----------------------------------------*/
SELECT 
    YEAR(sh.OrderDate) AS SalesYear,
    sp.BusinessEntityID AS SalesPersonID,
    e.JobTitle,
    SUM(sod.LineTotal) AS TotalSales,
    COUNT(DISTINCT sh.SalesOrderID) AS NumberOfOrders,
    AVG(sod.LineTotal) AS AvgRevenuePerOrder
FROM Sales.SalesPerson sp
JOIN HumanResources.Employee e ON sp.BusinessEntityID = e.BusinessEntityID
JOIN Sales.SalesOrderHeader sh ON sp.BusinessEntityID = sh.SalesPersonID
JOIN Sales.SalesOrderDetail sod ON sh.SalesOrderID = sod.SalesOrderID
GROUP BY YEAR(sh.OrderDate), sp.BusinessEntityID, e.JobTitle
ORDER BY SalesYear, TotalSales DESC;


/*----------------------------------------
-- Q7: Metadata question
-- Author: BLB
-- Question: Which tables contain ProductID or ProductSubcategoryID columns and their data types?
----------------------------------------*/
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('ProductID', 'ProductSubcategoryID')
ORDER BY TABLE_SCHEMA, TABLE_NAME;


/*----------------------------------------
-- Q8: Metadata question
-- Author: BLB
-- Question: List all tables in Sales schema and identify if base table or view
----------------------------------------*/
SELECT 
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales'
ORDER BY TABLE_NAME;

