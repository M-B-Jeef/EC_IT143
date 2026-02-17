USE [EC_IT143_DA];
GO

-- Step 2: Begin creating an answer
-- We will add two new columns to the customers table:
-- 1. LastModifiedDate (datetime)
-- 2. LastModifiedBy (nvarchar(128))

ALTER TABLE dbo.t_w3_schools_customers
ADD LastModifiedDate DATETIME NULL,
    LastModifiedBy NVARCHAR(128) NULL;

-- This prepares the table to store tracking information.
