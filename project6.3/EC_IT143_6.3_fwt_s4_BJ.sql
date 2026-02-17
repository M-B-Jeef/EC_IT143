/***********************************************************************************
******************************
NAME: dbo.v_w3_schools_customers.sql
PURPOSE:
MODIFICATION LOG:
Ver   Date          Author       Description
----- ----------   -----------  -------------------------------------------------------------------------------
1.0   05/23/2022   JJAUSSI      1. Built this script for EC IT440
RUNTIME:
1s
NOTES:
This is where I talk about what this script is, why I built it, and other stuff...
******************************************************************************************************************/

-- Step 1: What do we want to track for this table?
-- Question: How can we keep track of the last modification date and the user who modified a record?

-- This script is purely descriptive, focusing on identifying the tracking requirements.
-- No execution required.

-- Step 2: Begin creating an answer
-- We will add two new columns to the customers table:
-- 1. LastModifiedDate (datetime)
-- 2. LastModifiedBy (nvarchar(128))

USE [EC_IT143_DA];
GO

USE [EC_IT143_DA];
GO

-- Step 4: Create an after-update trigger
CREATE OR ALTER TRIGGER trg_AfterUpdate_Customers
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Correct syntax for updating LastModifiedDate and LastModifiedBy
    UPDATE c
    SET 
        LastModifiedDate = GETDATE(),
        LastModifiedBy = SUSER_NAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;
END;
GO
