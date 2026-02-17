USE [EC_IT143_DA];
GO

-- Step 5: Test the trigger

-- Update a record to see if the trigger works
UPDATE dbo.t_w3_schools_customers
SET Address = 'New Updated Address'
WHERE CustomerID = 1;

-- Check results
SELECT CustomerID, ContactName, Address, LastModifiedDate, LastModifiedBy
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
