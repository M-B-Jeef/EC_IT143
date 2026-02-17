-- Next question:
-- How can I extract the last name from the ContactName column in the t_w3_schools_customers table?

-- Next steps:
-- 1. Research method to get substring after the last space.
-- 2. Create ad hoc query for last name.
-- 3. Create scalar function dbo.ufn_GetLastName(@FullName NVARCHAR(100)).
SELECT 
    CustomerID,
    CustomerName,
    ContactName,
    dbo.ufn_GetLastName(ContactName) AS ContactName_last_name,
    Address,
    City,
    Country
FROM dbo.t_w3_schools_customers
ORDER BY ContactName;
