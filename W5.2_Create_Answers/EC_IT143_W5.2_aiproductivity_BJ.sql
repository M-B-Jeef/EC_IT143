/***********************************************************************************
NAME: EC_IT143_W5.2_AIProductivity_BL.sql
PURPOSE: Answer questions for AI Productivity dataset

MODIFICATION LOG:
Ver      Date        Author        Description
1.0      02/14/2026  BL            Project 5.2 answers
***********************************************************************************/

USE EC_IT143_DA;
GO

-- Question 1
-- Author: BJ (me)
-- Question: Which employees are at high risk of burnout and what are their productivity scores?

SELECT 
    Employee_ID,
    burnout_risk_level,
    productivity_score
FROM dbo.ai_productivity_targets
WHERE burnout_risk_level = 'High';
GO

-- Question 2
-- Author: BJ (me)
-- Question: Do higher productivity scores appear more frequently in certain burnout levels?

SELECT 
    burnout_risk_level,
    AVG(productivity_score) AS avg_productivity
FROM dbo.ai_productivity_targets
GROUP BY burnout_risk_level;
GO

-- Question 3
-- Author: BJ (me)
-- Question: What is the distribution of productivity scores across employees?

SELECT 
    productivity_score,
    COUNT(*) AS employee_count
FROM dbo.ai_productivity_targets
GROUP BY productivity_score
ORDER BY productivity_score DESC;
GO

-- Question 4
-- Author: Classmate Inspired Question
-- Question: List employees with productivity score and burnout risk ordered by highest productivity.

SELECT 
    Employee_ID,
    productivity_score,
    burnout_risk_level
FROM dbo.ai_productivity_targets
ORDER BY productivity_score DESC;
GO
