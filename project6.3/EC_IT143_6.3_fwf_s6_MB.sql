SELECT 
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName_AdHoc,
    dbo.ufn_GetFirstName(ContactName) AS FirstName_UDF
FROM dbo.t_w3_schools_customers;
