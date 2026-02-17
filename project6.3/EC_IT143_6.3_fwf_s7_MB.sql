WITH Comparison AS
(
    SELECT 
        CustomerID,
        ContactName,

        -- Ad Hoc version
        LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName_AdHoc,

        -- Function version
        dbo.ufn_GetFirstName(ContactName) AS FirstName_UDF

    FROM dbo.t_w3_schools_customers
)

SELECT *
FROM Comparison
WHERE FirstName_AdHoc <> FirstName_UDF;