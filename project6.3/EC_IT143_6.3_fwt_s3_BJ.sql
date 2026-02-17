USE [EC_IT143_DA];
GO

-- Step 3: Research and test a solution

-- Before creating triggers, we research how to capture the last modified date and user.
-- Useful references:

-- 1. Microsoft Docs on AFTER UPDATE triggers:
-- https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql
-- Explains syntax and usage of AFTER UPDATE triggers.

-- 2. Stack Overflow discussion on tracking last modified user and date:
-- https://stackoverflow.com/questions/3513371/how-to-track-last-modified-by-and-last-modified-date-in-sql-server

-- 3. SQLShack tutorial on audit columns with triggers:
-- https://www.sqlshack.com/track-changes-in-sql-server-using-triggers/

-- Test updates (before trigger creation) to understand behavior:
UPDATE dbo.t_w3_schools_customers
SET Address = 'Test Address Update'
WHERE CustomerID = 1;

-- Check results: no trigger yet, so LastModifiedDate and LastModifiedBy are still NULL
SELECT CustomerID, ContactName, LastModifiedDate, LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
