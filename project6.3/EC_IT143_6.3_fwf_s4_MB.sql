-- Resources used:
-- 1. https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
-- 2. https://www.w3schools.com/sql/sql_substring.asp

-- Test query (same as Step 3):
SELECT 
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
