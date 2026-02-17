
/***********************************************************************************
******************************
NAME: dbo.v_w3_schools_customers.sql
PURPOSE:How to extract the first name from the contact name, How to extract the last name from the contact name
MODIFICATION LOG:
Ver   Date          Author       Description
----- ----------   -----------  -------------------------------------------------------------------------------
1.0   05/23/2022   JJAUSSI      1. Built this script for EC IT440
RUNTIME:
1s
NOTES:
This is where I talk about what this script is, why I built it, and other stuff...
******************************************************************************************************************/
-- Current status:-- Question:
-- How can I extract the first name from the ContactName column in the t_w3_schools_customers table?

-- I have the table t_w3_schools_customers with ContactName in "First Last" format.

-- Next logical step:
-- 1. Test using LEFT, CHARINDEX, and SUBSTRING to extract first name.
-- 2. Compare results to full ContactName to ensure correctness.

USE EC_IT143_DA;
GO

CREATE FUNCTION dbo.ufn_GetFirstName(@FullName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    -- Return first name from full name
    RETURN LEFT(@FullName, CHARINDEX(' ', @FullName + ' ') - 1)
END;
GO

-- Test the function
SELECT ContactName, dbo.ufn_GetFirstName(ContactName) AS FirstName
FROM dbo.t_w3_schools_customers;
