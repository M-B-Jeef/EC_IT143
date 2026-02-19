USE AdventureWorks2022;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

---------------------------------------------------------
-- CLEAN UP
---------------------------------------------------------
IF EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_SalesOrder_PurchaseOrderNumber'
    AND object_id = OBJECT_ID('Sales.SalesOrderHeader')
)
DROP INDEX IX_SalesOrder_PurchaseOrderNumber 
ON Sales.SalesOrderHeader;
GO

---------------------------------------------------------
-- STEP 1 & 2
-- Query using unindexed character column
-- (Before running, click Include Actual Execution Plan)
---------------------------------------------------------

SELECT SalesOrderID, PurchaseOrderNumber, OrderDate
FROM Sales.SalesOrderHeader
WHERE PurchaseOrderNumber = 'PO12345';
GO

/*
STEP 3:
Include Actual Execution Plan (Ctrl + M)

STEP 4:
Review execution plan.

STEP 5:
Take note of:
- Estimated Subtree Cost
- Table Scan
- Missing Index Recommendation
*/

---------------------------------------------------------
-- STEP 7: Create Index (from missing index suggestion)
---------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_SalesOrder_PurchaseOrderNumber
ON Sales.SalesOrderHeader (PurchaseOrderNumber);
GO

---------------------------------------------------------
-- STEP 8: Re-run query to compare performance
---------------------------------------------------------

SELECT SalesOrderID, PurchaseOrderNumber, OrderDate
FROM Sales.SalesOrderHeader
WHERE PurchaseOrderNumber = 'PO12345';
GO

/*
Compare:
- Estimated Subtree Cost (before vs after)
- Table Scan vs Index Seek
- Logical reads
*/

---------------------------------------------------------
-- SECOND TABLE EXAMPLE
---------------------------------------------------------

IF EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Product_Size'
    AND object_id = OBJECT_ID('Production.Product')
)
DROP INDEX IX_Product_Size 
ON Production.Product;
GO

SELECT ProductID, Name, Size
FROM Production.Product
WHERE Size = 'M';
GO

CREATE NONCLUSTERED INDEX IX_Product_Size
ON Production.Product (Size);
GO

SELECT ProductID, Name, Size
FROM Production.Product
WHERE Size = 'M';
GO
